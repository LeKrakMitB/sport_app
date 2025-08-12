# Script de dÃ©veloppement (Windows PowerShell)
Write-Host "Demarrage en mode developpement" -ForegroundColor Green

# DÃ©marrer Docker Compose
Write-Host "Demarrage des services Docker..." -ForegroundColor Cyan
Push-Location infrastructure\docker
docker-compose up -d postgres redis
Pop-Location

Write-Host "Attente des services..." -ForegroundColor Cyan
Start-Sleep -Seconds 5

# DÃ©marrer le backend
Write-Host "Demarrage du backend..." -ForegroundColor Cyan
Start-Job -ScriptBlock {
    Set-Location $using:PWD
    Push-Location backend
    & ".\venv\Scripts\Activate.ps1"
    uvicorn main:app --reload --port 8000
    Pop-Location
}

# DÃ©marrer le frontend
Write-Host "Demarrage du frontend..." -ForegroundColor Cyan
Start-Job -ScriptBlock {
    Set-Location $using:PWD
    Push-Location frontend
    npm run dev
    Pop-Location
}

Write-Host "Services demarres!" -ForegroundColor Green
Write-Host "Frontend: http://localhost:3000" -ForegroundColor Yellow
Write-Host "Backend: http://localhost:8000" -ForegroundColor Yellow

# Attendre l'interruption
try {
    while ($true) {
        Start-Sleep -Seconds 1
    }
} catch {
    Write-Host "Arret des services..." -ForegroundColor Yellow
    Get-Job | Stop-Job
    Get-Job | Remove-Job
}
