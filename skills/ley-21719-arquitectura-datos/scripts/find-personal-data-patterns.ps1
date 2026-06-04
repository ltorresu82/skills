[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string] $Path,

    [switch] $Recurse,

    [switch] $ShowMatches,

    [string[]] $Include = @("*.sql", "*.prisma", "*.ts", "*.tsx", "*.js", "*.jsx", "*.json", "*.csv", "*.md", "*.txt", "*.yml", "*.yaml", "*.env.example")
)

$ErrorActionPreference = "Stop"

$resolved = Resolve-Path -LiteralPath $Path
$root = $resolved.Path

$patterns = @(
    @{
        Name = "rut_posible_primary_key"
        Regex = "\brut\b.*\bprimary\s+key\b|\bprimary\s+key\b.*\brut\b"
        Risk = "RUT usado como llave tecnica"
    },
    @{
        Name = "email_posible_unique_key"
        Regex = "\b(email|correo)\b.*\b(unique|primary\s+key)\b|\b(unique|primary\s+key)\b.*\b(email|correo)\b"
        Risk = "email usado como identificador tecnico"
    },
    @{
        Name = "telefono_posible_unique_key"
        Regex = "\b(telefono|phone)\b.*\b(unique|primary\s+key)\b|\b(unique|primary\s+key)\b.*\b(telefono|phone)\b"
        Risk = "telefono usado como identificador tecnico"
    },
    @{
        Name = "rut"
        Regex = "\b\d{1,2}\.?\d{3}\.?\d{3}-[\dkK]\b"
        Risk = "identificador directo"
    },
    @{
        Name = "email"
        Regex = "\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b"
        Risk = "identificador directo/contacto"
    },
    @{
        Name = "telefono_cl"
        Regex = "(?<!\d)(?:\+?56\s?)?(?:9\s?)?\d{4}\s?\d{4}(?!\d)"
        Risk = "identificador directo/contacto"
    },
    @{
        Name = "campo_posible_dato_personal"
        Regex = "\b(rut|run|email|correo|telefono|phone|nombre|apellido|direccion|address|fecha_nacimiento|birthdate|passport|documento|cedula|biometr|huella|salud|diagnostico)\b"
        Risk = "campo o variable sensible al contexto"
    }
)

$wildcards = $Include | ForEach-Object {
    [System.Management.Automation.WildcardPattern]::new($_, "IgnoreCase")
}

$files = Get-ChildItem -LiteralPath $root -File -Recurse:$Recurse |
    Where-Object {
        $name = $_.Name
        ($wildcards | Where-Object { $_.IsMatch($name) }) -and
        $_.FullName -notmatch "\\\.git\\" -and
        $_.FullName -notmatch "\\node_modules\\" -and
        $_.FullName -notmatch "\\dist\\" -and
        $_.FullName -notmatch "\\build\\"
    }

$results = New-Object System.Collections.Generic.List[object]

foreach ($file in $files) {
    $lineNumber = 0
    $relativeFile = $file.FullName
    if ($relativeFile.StartsWith($root, [System.StringComparison]::OrdinalIgnoreCase)) {
        $relativeFile = $relativeFile.Substring($root.Length).TrimStart("\", "/")
    }

    try {
        Get-Content -LiteralPath $file.FullName -ErrorAction Stop | ForEach-Object {
            $lineNumber++
            $line = $_

            foreach ($pattern in $patterns) {
                $matches = [regex]::Matches($line, $pattern.Regex, "IgnoreCase")
                foreach ($match in $matches) {
                    $results.Add([pscustomobject]@{
                        File = $relativeFile
                        Line = $lineNumber
                        Type = $pattern.Name
                        Risk = $pattern.Risk
                        Match = if ($ShowMatches) { $match.Value } else { "[hidden]" }
                    })
                }
            }
        }
    }
    catch {
        Write-Warning "No se pudo leer: $($file.FullName)"
    }
}

$results |
    Sort-Object File, Line, Type |
    Format-Table File, Line, Type, Risk, Match -AutoSize

if ($results.Count -gt 0 -and -not $ShowMatches) {
    Write-Host ""
    Write-Host "Valores ocultos por defecto. Use -ShowMatches solo en auditorias controladas; puede exponer datos personales."
}
