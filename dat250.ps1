param(
  [Parameter(Position = 0)]
  [string]$Command
)

Set-Location $PSScriptRoot

switch ($Command) {
  "start" {
    docker compose up --build
  }
  "stop" {
    docker compose down
  }
  "reset" {
    docker compose down -v
    docker compose up --build
  }
  "rebuild" {
    docker compose pull --ignore-pull-failures
    docker compose build --no-cache
    docker compose up -d --force-recreate --remove-orphans
    Write-Host "Stack running in the background: http://localhost:18181"
  }
  "logs" {
    docker compose logs -f
  }
  default {
    Write-Host "Usage: .\dat250.ps1 {start|stop|reset|rebuild|logs}"
    Write-Host "  start   - foreground: compose up --build"
    Write-Host "  stop    - compose down"
    Write-Host "  reset   - remove volumes (fresh DB), then up --build (foreground)"
    Write-Host "  rebuild - pull bases, rebuild backend (--no-cache), recreate containers (-d)"
    Write-Host "  logs    - follow compose logs"
    exit 1
  }
}
