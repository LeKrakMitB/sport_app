# Script de setup (Windows PowerShell)
Write-Host "Configuration du projet Sports Platform" -ForegroundColor Green

# Installer les dÃ©pendances frontend
Write-Host "Installation des dependances frontend..." -ForegroundColor Cyan
Push-Location frontend
npm install
Pop-Location

# Installer les dÃ©pendances backend
Write-Host "Installation des dependances backend..." -ForegroundColor Cyan
Push-Location backend
& ".\venv\Scripts\Activate.ps1"
pip install -r requirements.txt
Pop-Location

# GÃ©nÃ©rer les clients Prisma
Write-Host "Generation des clients Prisma..." -ForegroundColor Cyan
Get-ChildItem -Path "modules\*\database" | ForEach-Object {
    if (Test-Path (Join-Path $_.FullName "package.json")) {
        Push-Location $_.FullName
        npm install
        npx prisma generate
        Pop-Location
    }
}

Write-Host "Setup termine!" -ForegroundColor Green
