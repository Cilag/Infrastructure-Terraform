# Script de verification des environnements Terraform
Write-Host "=== Verification des environnements Terraform ===" -ForegroundColor Cyan

$environments = @("dev", "staging", "prod")

foreach ($env in $environments) {
    Write-Host "`n--- Environnement: $env ---" -ForegroundColor Yellow
    
    if (Test-Path "env/$env") {
        Push-Location "env/$env"
        
        Write-Host "Outputs Terraform:" -ForegroundColor Green
        terraform output 2>$null
        
        if ($LASTEXITCODE -ne 0) {
            Write-Host "Environnement pas encore deploye" -ForegroundColor Red
        }
        
        Pop-Location
    } else {
        Write-Host "Dossier non trouve" -ForegroundColor Red
    }
}

Write-Host "`n=== Buckets GCS crees ===" -ForegroundColor Cyan
Write-Host "Nom | Environment | Retention (jours) | Versioning" -ForegroundColor Yellow
Write-Host "----+-------------+-------------------+-----------" -ForegroundColor Yellow

gcloud storage buckets list --filter="name:cilag-app" --format="value(name,labels.environment,lifecycle_config.rule[0].condition.age,versioning_enabled)"
