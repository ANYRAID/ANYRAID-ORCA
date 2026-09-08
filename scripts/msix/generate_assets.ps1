# Generates MSIX package logos from the master ANYRAID-ORCA application icon
# (resources\images\ANYRAID-ORCA_192px.png). Each PNG is resized to its exact
# target dimensions with high-quality Lanczos resampling while preserving alpha.
#
# Run once locally on Windows when the logo changes, then commit the generated
# PNG files in assets/. CI does not run this script.
#
# Prerequisite: Python 3 with Pillow (pip install Pillow).
param(
    [string]$Python = 'python'
)
$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path (Split-Path $PSScriptRoot -Parent) -Parent
$source   = Join-Path $repoRoot 'resources\images\ANYRAID-ORCA_192px.png'
$outDir   = Join-Path $PSScriptRoot 'assets'
New-Item -ItemType Directory -Force $outDir | Out-Null

$sizes = [ordered]@{
    'Square150x150Logo.png'                              = 150
    'Square44x44Logo.png'                                = 44
    'Square44x44Logo.targetsize-44_altform-unplated.png' = 44
    'StoreLogo.png'                                      = 50
}

$py = @'
import sys
from pathlib import Path

from PIL import Image

source, out_dir = sys.argv[1], Path(sys.argv[2])
for spec in sys.argv[3:]:
    name, px = spec.rsplit('=', 1)
    px = int(px)
    image = Image.open(source).convert("RGBA").resize((px, px), Image.Resampling.LANCZOS)
    (out_dir / name).parent.mkdir(parents=True, exist_ok=True)
    image.save(out_dir / name, format="PNG", optimize=True)
    print(f'Wrote {name} ({px}x{px})')
'@

$renderScript = Join-Path $env:TEMP 'anyraid_orca_msix_render.py'
Set-Content -Path $renderScript -Value $py -Encoding utf8
try {
    $specs = foreach ($name in $sizes.Keys) { "$name=$($sizes[$name])" }
    & $Python $renderScript $source $outDir @specs
    if ($LASTEXITCODE -ne 0) {
        throw 'Pillow image generation failed. Is Pillow installed? (pip install Pillow)'
    }
}
finally {
    Remove-Item $renderScript -ErrorAction SilentlyContinue
}
