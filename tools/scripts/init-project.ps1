# Script d'initialisation Sports Platform MVP - Windows PowerShell
# Usage: .\init-project.ps1

Write-Host "Initialisation du projet Sports Platform MVP" -ForegroundColor Green
Write-Host "================================================" -ForegroundColor Green

# Vérifier qu'on est dans le bon dossier
if ((Split-Path -Leaf $PWD) -ne "sports-platform") {
    Write-Host "Erreur: Ce script doit etre execute depuis le dossier 'sports-platform'" -ForegroundColor Red
    Write-Host "Faites: mkdir sports-platform; cd sports-platform" -ForegroundColor Yellow
    exit 1
}

Write-Host "Creation de la structure des dossiers..." -ForegroundColor Cyan

# 1. Cloner le repo existant ou initialiser
if (!(Test-Path ".git")) {
    Write-Host "Clonage du repository GitHub..." -ForegroundColor Cyan
    git clone https://github.com/LeKrakMitB/sport_app.git .
    
    # Si le repo est vide, créer .gitignore
    if (!(Test-Path ".gitignore")) {
        Write-Host "Creation du .gitignore..." -ForegroundColor Cyan
        $gitignoreContent = @'
# Dependencies
node_modules/
venv/
__pycache__/

# Production builds
.next/
dist/
build/

# Environment variables
.env*
!.env.example

# Logs
*.log
npm-debug.log*

# Database
*.db
*.sqlite

# IDEs
.vscode/
.idea/
*.swp
*.swo

# OS
.DS_Store
Thumbs.db

# Prisma
prisma/generated/
'@
        $gitignoreContent | Out-File -FilePath ".gitignore" -Encoding UTF8
    }
} else {
    Write-Host "Repository deja clone, continuation..." -ForegroundColor Yellow
}

Write-Host "Creation de la structure des modules..." -ForegroundColor Cyan

# 2. Créer la structure complète des modules
$modules = @("authentification", "profil-pratiquants", "profil-instructeur", "selection-booking", "paiement", "notifications", "messagerie")

# Structure de base
New-Item -ItemType Directory -Path "modules" -Force | Out-Null
New-Item -ItemType Directory -Path "shared\types" -Force | Out-Null
New-Item -ItemType Directory -Path "shared\utils" -Force | Out-Null
New-Item -ItemType Directory -Path "shared\components\ui" -Force | Out-Null
New-Item -ItemType Directory -Path "shared\components\layout" -Force | Out-Null
New-Item -ItemType Directory -Path "shared\database" -Force | Out-Null
New-Item -ItemType Directory -Path "shared\services" -Force | Out-Null
New-Item -ItemType Directory -Path "infrastructure\docker" -Force | Out-Null
New-Item -ItemType Directory -Path "infrastructure\k8s" -Force | Out-Null
New-Item -ItemType Directory -Path "infrastructure\terraform" -Force | Out-Null
New-Item -ItemType Directory -Path "infrastructure\scripts" -Force | Out-Null
New-Item -ItemType Directory -Path "infrastructure\monitoring" -Force | Out-Null
New-Item -ItemType Directory -Path "docs\api" -Force | Out-Null
New-Item -ItemType Directory -Path "docs\architecture" -Force | Out-Null
New-Item -ItemType Directory -Path "docs\deployment" -Force | Out-Null

# Structure pour chaque module
foreach ($module in $modules) {
    Write-Host "Configuration du module: $module" -ForegroundColor Cyan
    
    # Frontend structure
    New-Item -ItemType Directory -Path "modules\$module\frontend\components" -Force | Out-Null
    New-Item -ItemType Directory -Path "modules\$module\frontend\pages" -Force | Out-Null
    New-Item -ItemType Directory -Path "modules\$module\frontend\hooks" -Force | Out-Null
    New-Item -ItemType Directory -Path "modules\$module\frontend\store" -Force | Out-Null
    
    # Backend structure  
    New-Item -ItemType Directory -Path "modules\$module\backend\api" -Force | Out-Null
    New-Item -ItemType Directory -Path "modules\$module\backend\services" -Force | Out-Null
    New-Item -ItemType Directory -Path "modules\$module\backend\models" -Force | Out-Null
    New-Item -ItemType Directory -Path "modules\$module\backend\middleware" -Force | Out-Null
    
    # Database structure
    New-Item -ItemType Directory -Path "modules\$module\database\prisma" -Force | Out-Null
    New-Item -ItemType Directory -Path "modules\$module\database\repositories" -Force | Out-Null
    
    # Tests
    New-Item -ItemType Directory -Path "modules\$module\tests" -Force | Out-Null
}

# Structure spécifique par module
New-Item -ItemType Directory -Path "modules\authentification\frontend\components\connexion" -Force | Out-Null
New-Item -ItemType Directory -Path "modules\authentification\frontend\components\session" -Force | Out-Null
New-Item -ItemType Directory -Path "modules\authentification\frontend\components\shared" -Force | Out-Null

New-Item -ItemType Directory -Path "modules\profil-pratiquants\frontend\components\profile" -Force | Out-Null
New-Item -ItemType Directory -Path "modules\profil-pratiquants\frontend\components\sessions" -Force | Out-Null
New-Item -ItemType Directory -Path "modules\profil-pratiquants\frontend\components\activity" -Force | Out-Null
New-Item -ItemType Directory -Path "modules\profil-pratiquants\frontend\components\shared" -Force | Out-Null

New-Item -ItemType Directory -Path "modules\profil-instructeur\frontend\components\dashboard" -Force | Out-Null
New-Item -ItemType Directory -Path "modules\profil-instructeur\frontend\components\settings" -Force | Out-Null
New-Item -ItemType Directory -Path "modules\profil-instructeur\frontend\components\profile" -Force | Out-Null
New-Item -ItemType Directory -Path "modules\profil-instructeur\frontend\components\shared" -Force | Out-Null

New-Item -ItemType Directory -Path "modules\selection-booking\frontend\components\filtering" -Force | Out-Null
New-Item -ItemType Directory -Path "modules\selection-booking\frontend\components\cards" -Force | Out-Null
New-Item -ItemType Directory -Path "modules\selection-booking\frontend\components\calendar" -Force | Out-Null
New-Item -ItemType Directory -Path "modules\selection-booking\frontend\components\booking" -Force | Out-Null
New-Item -ItemType Directory -Path "modules\selection-booking\frontend\components\search" -Force | Out-Null

New-Item -ItemType Directory -Path "modules\paiement\frontend\components\stripe" -Force | Out-Null
New-Item -ItemType Directory -Path "modules\paiement\frontend\components\checkout" -Force | Out-Null
New-Item -ItemType Directory -Path "modules\paiement\frontend\components\success" -Force | Out-Null
New-Item -ItemType Directory -Path "modules\paiement\frontend\components\shared" -Force | Out-Null

New-Item -ItemType Directory -Path "modules\notifications\frontend\components\bell" -Force | Out-Null
New-Item -ItemType Directory -Path "modules\notifications\frontend\components\center" -Force | Out-Null
New-Item -ItemType Directory -Path "modules\notifications\frontend\components\settings" -Force | Out-Null
New-Item -ItemType Directory -Path "modules\notifications\frontend\components\types" -Force | Out-Null

New-Item -ItemType Directory -Path "modules\messagerie\frontend\components\chat" -Force | Out-Null
New-Item -ItemType Directory -Path "modules\messagerie\frontend\components\conversations" -Force | Out-Null
New-Item -ItemType Directory -Path "modules\messagerie\frontend\components\contact" -Force | Out-Null
New-Item -ItemType Directory -Path "modules\messagerie\frontend\components\media" -Force | Out-Null
New-Item -ItemType Directory -Path "modules\messagerie\frontend\components\shared" -Force | Out-Null
New-Item -ItemType Directory -Path "modules\messagerie\backend\websocket" -Force | Out-Null

Write-Host "Initialisation de Next.js..." -ForegroundColor Cyan

# 3. Initialiser Next.js
npx create-next-app@latest frontend --typescript --tailwind --eslint --app --src-dir --import-alias "@/*" --no-git

# 4. Installation des dépendances frontend
Write-Host "Installation des dependances frontend..." -ForegroundColor Cyan
Push-Location frontend
npm install next-auth "@next-auth/prisma-adapter"
npm install "@stripe/stripe-js" "@stripe/react-stripe-js"
npm install socket.io-client
npm install lucide-react
npm install "@hookform/resolvers" react-hook-form zod
npm install zustand
npm install "@prisma/client"
Pop-Location

Write-Host "Configuration du backend Python..." -ForegroundColor Cyan

# 5. Initialiser le backend Python
New-Item -ItemType Directory -Path "backend" -Force | Out-Null

# Créer requirements.txt
$requirementsContent = @'
fastapi==0.104.1
uvicorn[standard]==0.24.0
sqlalchemy==2.0.23
alembic==1.12.1
python-jose[cryptography]==3.3.0
passlib[bcrypt]==1.7.4
stripe==7.5.0
redis==5.0.1
python-multipart==0.0.6
pytest==7.4.3
pytest-asyncio==0.21.1
python-dotenv==1.0.0
websockets==12.0
pydantic==2.5.0
'@
$requirementsContent | Out-File -FilePath "backend\requirements.txt" -Encoding UTF8

# Créer l'environnement virtuel Python
Push-Location backend
python -m venv venv
& ".\venv\Scripts\Activate.ps1"
pip install -r requirements.txt
Pop-Location

Write-Host "Configuration des bases de donnees Prisma..." -ForegroundColor Cyan

# 6. Configuration Prisma pour le module authentification
Write-Host "Configuration Prisma pour: authentification" -ForegroundColor Cyan
Push-Location "modules\authentification\database"

# Initialiser npm et Prisma
npm init -y
npm install prisma "@prisma/client"
npx prisma init --datasource-provider postgresql

# Créer le schema pour authentification
$authSchemaContent = @'
generator client {
  provider = "prisma-client-js"
  output   = "./generated"
}

datasource db {
  provider = "postgresql"
  url      = env("AUTH_DATABASE_URL")
  schema   = "auth_schema"
}

model User {
  id        String   @id @default(cuid())
  email     String   @unique
  password  String?
  name      String?
  role      UserRole
  isActive  Boolean  @default(true)
  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt
  
  sessions UserSession[]
  accounts Account[]
  
  @@schema("auth_schema")
}

model UserSession {
  id        String   @id @default(cuid())
  userId    String
  token     String   @unique
  expiresAt DateTime
  ipAddress String?
  userAgent String?
  isActive  Boolean  @default(true)
  createdAt DateTime @default(now())
  
  user User @relation(fields: [userId], references: [id], onDelete: Cascade)
  
  @@schema("auth_schema")
}

model Account {
  id                String  @id @default(cuid())
  userId            String
  type              String
  provider          String
  providerAccountId String
  refresh_token     String?
  access_token      String?
  expires_at        Int?
  token_type        String?
  scope             String?
  id_token          String?
  session_state     String?
  
  user User @relation(fields: [userId], references: [id], onDelete: Cascade)
  
  @@unique([provider, providerAccountId])
  @@schema("auth_schema")
}

enum UserRole {
  PRACTITIONER
  INSTRUCTOR
  ADMIN
  
  @@schema("auth_schema")
}
'@
$authSchemaContent | Out-File -FilePath "prisma\schema.prisma" -Encoding UTF8

Pop-Location

# Configuration Prisma pour profil-instructeur
Write-Host "Configuration Prisma pour: profil-instructeur" -ForegroundColor Cyan
Push-Location "modules\profil-instructeur\database"

npm init -y
npm install prisma "@prisma/client"
npx prisma init --datasource-provider postgresql

$instructorSchemaContent = @'
generator client {
  provider = "prisma-client-js"
  output   = "./generated"
}

datasource db {
  provider = "postgresql"
  url      = env("INSTRUCTOR_DATABASE_URL")
  schema   = "instructor_schema"
}

model InstructorProfile {
  id          String   @id @default(cuid())
  userId      String   @unique
  firstName   String
  lastName    String
  photo       String?
  bio         String?
  certified   Boolean  @default(false)
  sports      String[]
  createdAt   DateTime @default(now())
  updatedAt   DateTime @updatedAt
  
  sessions    Session[]
  availability Availability[]
  
  @@schema("instructor_schema")
}

model Session {
  id              String      @id @default(cuid())
  instructorId    String
  title           String
  description     String?
  sport           String
  duration        Int
  maxParticipants Int
  price           Float
  priceType       PriceType
  meetingPoint    String
  isActive        Boolean     @default(true)
  createdAt       DateTime    @default(now())
  updatedAt       DateTime    @updatedAt
  
  instructor      InstructorProfile @relation(fields: [instructorId], references: [id])
  timeSlots       TimeSlot[]
  
  @@schema("instructor_schema")
}

model Availability {
  id           String    @id @default(cuid())
  instructorId String
  dayOfWeek    Int
  startTime    String
  endTime      String
  breakStart   String?
  breakEnd     String?
  isActive     Boolean   @default(true)
  
  instructor   InstructorProfile @relation(fields: [instructorId], references: [id])
  
  @@schema("instructor_schema")
}

model TimeSlot {
  id        String   @id @default(cuid())
  sessionId String
  startTime DateTime
  endTime   DateTime
  isBooked  Boolean  @default(false)
  
  session   Session  @relation(fields: [sessionId], references: [id])
  
  @@schema("instructor_schema")
}

enum PriceType {
  FIXED_PER_PERSON
  FIXED_PER_SESSION
  
  @@schema("instructor_schema")
}
'@
$instructorSchemaContent | Out-File -FilePath "prisma\schema.prisma" -Encoding UTF8

Pop-Location

# Configuration basique pour les autres modules
$otherModules = @("profil-pratiquants", "selection-booking", "paiement", "notifications", "messagerie")
foreach ($module in $otherModules) {
    Write-Host "Configuration Prisma basique pour: $module" -ForegroundColor Cyan
    Push-Location "modules\$module\database"
    
    npm init -y
    npm install prisma "@prisma/client"
    npx prisma init --datasource-provider postgresql
    
    $schemaName = $module -replace "-", "_" + "_schema"
    $moduleUpper = $module.ToUpper() -replace "-", "_"
    
    $basicSchemaContent = @"
generator client {
  provider = "prisma-client-js"
  output   = "./generated"
}

datasource db {
  provider = "postgresql"
  url      = env("${moduleUpper}_DATABASE_URL")
  schema   = "$schemaName"
}

// TODO: Définir les modèles pour $module
"@
    $basicSchemaContent | Out-File -FilePath "prisma\schema.prisma" -Encoding UTF8
    
    Pop-Location
}

Write-Host "Configuration des variables d'environnement..." -ForegroundColor Cyan

# 7. Variables d'environnement
$envContent = @'
# Database URLs
NEON_DATABASE_URL="postgresql://user:password@host/dbname"
AUTH_DATABASE_URL=${NEON_DATABASE_URL}?schema=auth_schema
PROFIL_PRATIQUANTS_DATABASE_URL=${NEON_DATABASE_URL}?schema=profil_pratiquants_schema
PROFIL_INSTRUCTEUR_DATABASE_URL=${NEON_DATABASE_URL}?schema=profil_instructeur_schema
SELECTION_BOOKING_DATABASE_URL=${NEON_DATABASE_URL}?schema=selection_booking_schema
PAIEMENT_DATABASE_URL=${NEON_DATABASE_URL}?schema=paiement_schema
NOTIFICATIONS_DATABASE_URL=${NEON_DATABASE_URL}?schema=notifications_schema
MESSAGERIE_DATABASE_URL=${NEON_DATABASE_URL}?schema=messagerie_schema

# NextAuth
NEXTAUTH_SECRET="your-secret-key"
NEXTAUTH_URL="http://localhost:3000"

# Stripe
STRIPE_PUBLIC_KEY="pk_test_..."
STRIPE_SECRET_KEY="sk_test_..."
STRIPE_WEBHOOK_SECRET="whsec_..."

# Redis
REDIS_URL="redis://localhost:6379"

# Email
EMAIL_FROM="noreply@yourapp.com"
SENDGRID_API_KEY="your-sendgrid-key"

# Storage
AWS_ACCESS_KEY_ID="your-aws-key"
AWS_SECRET_ACCESS_KEY="your-aws-secret"
AWS_BUCKET_NAME="your-bucket"

# API URLs
BACKEND_URL="http://localhost:8000"
FRONTEND_URL="http://localhost:3000"
'@
$envContent | Out-File -FilePath ".env.example" -Encoding UTF8
Copy-Item ".env.example" ".env"

Write-Host "Configuration Docker..." -ForegroundColor Cyan

# 8. Docker compose
$dockerComposeContent = @'
version: '3.8'

services:
  frontend:
    build:
      context: ../../frontend
      dockerfile: ../infrastructure/docker/Dockerfile.frontend
    ports:
      - "3000:3000"
    environment:
      - NODE_ENV=development
    volumes:
      - ../../frontend:/app
      - /app/node_modules
    depends_on:
      - backend
      - redis

  backend:
    build:
      context: ../../backend
      dockerfile: ../infrastructure/docker/Dockerfile.backend
    ports:
      - "8000:8000"
    environment:
      - PYTHON_ENV=development
    volumes:
      - ../../backend:/app
    depends_on:
      - postgres
      - redis

  postgres:
    image: postgres:15
    ports:
      - "5432:5432"
    environment:
      POSTGRES_DB: sports_platform
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: password
    volumes:
      - postgres_data:/var/lib/postgresql/data

  redis:
    image: redis:7-alpine
    ports:
      - "6379:6379"

volumes:
  postgres_data:
'@
$dockerComposeContent | Out-File -FilePath "infrastructure\docker\docker-compose.yml" -Encoding UTF8

# Dockerfiles
$dockerfileFrontend = @'
FROM node:18-alpine

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .

EXPOSE 3000

CMD ["npm", "run", "dev"]
'@
$dockerfileFrontend | Out-File -FilePath "infrastructure\docker\Dockerfile.frontend" -Encoding UTF8

$dockerfileBackend = @'
FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
'@
$dockerfileBackend | Out-File -FilePath "infrastructure\docker\Dockerfile.backend" -Encoding UTF8

Write-Host "Creation des scripts utilitaires..." -ForegroundColor Cyan

# 9. Scripts utilitaires
$setupScript = @'
# Script de setup (Windows PowerShell)
Write-Host "Configuration du projet Sports Platform" -ForegroundColor Green

# Installer les dépendances frontend
Write-Host "Installation des dependances frontend..." -ForegroundColor Cyan
Push-Location frontend
npm install
Pop-Location

# Installer les dépendances backend
Write-Host "Installation des dependances backend..." -ForegroundColor Cyan
Push-Location backend
& ".\venv\Scripts\Activate.ps1"
pip install -r requirements.txt
Pop-Location

# Générer les clients Prisma
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
'@
$setupScript | Out-File -FilePath "tools\scripts\setup.ps1" -Encoding UTF8

$devScript = @'
# Script de développement (Windows PowerShell)
Write-Host "Demarrage en mode developpement" -ForegroundColor Green

# Démarrer Docker Compose
Write-Host "Demarrage des services Docker..." -ForegroundColor Cyan
Push-Location infrastructure\docker
docker-compose up -d postgres redis
Pop-Location

Write-Host "Attente des services..." -ForegroundColor Cyan
Start-Sleep -Seconds 5

# Démarrer le backend
Write-Host "Demarrage du backend..." -ForegroundColor Cyan
Start-Job -ScriptBlock {
    Set-Location $using:PWD
    Push-Location backend
    & ".\venv\Scripts\Activate.ps1"
    uvicorn main:app --reload --port 8000
    Pop-Location
}

# Démarrer le frontend
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
'@
$devScript | Out-File -FilePath "tools\scripts\dev.ps1" -Encoding UTF8

Write-Host "Configuration du workspace..." -ForegroundColor Cyan

# 10. package.json
$packageJsonContent = @'
{
  "name": "sports-platform",
  "version": "1.0.0",
  "description": "Plateforme de mise en relation sports",
  "scripts": {
    "setup": "powershell -ExecutionPolicy Bypass -File ./tools/scripts/setup.ps1",
    "dev": "powershell -ExecutionPolicy Bypass -File ./tools/scripts/dev.ps1",
    "build": "npm run build:frontend",
    "build:frontend": "cd frontend && npm run build",
    "test": "npm run test:frontend && npm run test:backend",
    "test:frontend": "cd frontend && npm test",
    "test:backend": "cd backend && python -m pytest",
    "docker:up": "cd infrastructure/docker && docker-compose up -d",
    "docker:down": "cd infrastructure/docker && docker-compose down"
  },
  "workspaces": [
    "frontend",
    "modules/*/database"
  ],
  "devDependencies": {
    "@types/node": "^20.0.0",
    "typescript": "^5.0.0"
  }
}
'@
$packageJsonContent | Out-File -FilePath "package.json" -Encoding UTF8

# 11. tsconfig.json
$tsconfigContent = @'
{
  "compilerOptions": {
    "target": "ES2022",
    "lib": ["dom", "dom.iterable", "es6"],
    "allowJs": true,
    "skipLibCheck": true,
    "strict": true,
    "forceConsistentCasingInFileNames": true,
    "noEmit": true,
    "esModuleInterop": true,
    "module": "esnext",
    "moduleResolution": "bundler",
    "resolveJsonModule": true,
    "isolatedModules": true,
    "jsx": "preserve",
    "incremental": true,
    "plugins": [
      {
        "name": "next"
      }
    ],
    "baseUrl": ".",
    "paths": {
      "@/*": ["./shared/*"],
      "@/modules/*": ["./modules/*"],
      "@/frontend/*": ["./frontend/*"]
    }
  },
  "include": [
    "next-env.d.ts",
    "**/*.ts",
    "**/*.tsx",
    ".next/types/**/*.ts"
  ],
  "exclude": ["node_modules"]
}
'@
$tsconfigContent | Out-File -FilePath "tsconfig.json" -Encoding UTF8

Write-Host "Creation de la documentation..." -ForegroundColor Cyan

# 12. README
$readmeContent = @'
# Sports Platform MVP

Plateforme de mise en relation entre pratiquants sportifs et instructeurs freelance.

## Quick Start

```powershell
# Setup initial
npm run setup

# Lancer en mode dev
npm run dev
```

## Architecture

### Modules
- Authentification - Connexion + sessions
- Profil Pratiquants - Profils utilisateurs  
- Profil Instructeur - Dashboard + parametrage
- Selection Booking - Recherche + reservation
- Paiement - Stripe + transactions
- Notifications - Alertes + emails
- Messagerie - Chat temps reel

### Stack
- **Frontend**: Next.js 14+, TypeScript, Tailwind
- **Backend**: FastAPI, Python 3.11+
- **Database**: PostgreSQL (Neon) + Prisma
- **Auth**: NextAuth.js
- **Paiement**: Stripe

## Configuration

1. Configurer votre database Neon dans `.env`
2. Configurer Stripe dans `.env`
3. Lancer `npm run setup`
4. Demarrer avec `npm run dev`

## Notes Windows

Pour les problemes d'execution de scripts PowerShell:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```
'@
$readmeContent | Out-File -FilePath "README.md" -Encoding UTF8

# 13. Fichier main.py pour FastAPI
$mainPyContent = @'
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI(
    title="Sports Platform API",
    description="API pour la plateforme de mise en relation sports",
    version="1.0.0"
)

# Configuration CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:3000"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
async def root():
    return {"message": "Sports Platform API is running!"}

@app.get("/health")
async def health():
    return {"status": "healthy"}
'@
$mainPyContent | Out-File -FilePath "backend\main.py" -Encoding UTF8

Write-Host "Initialisation terminee avec succes!" -ForegroundColor Green
Write-Host ""
Write-Host "Prochaines etapes:" -ForegroundColor Yellow
Write-Host "1. Configurer votre database Neon dans .env" -ForegroundColor White
Write-Host "2. Lancer: npm run setup" -ForegroundColor White
Write-Host "3. Demarrer: npm run dev" -ForegroundColor White
Write-Host ""
Write-Host "URLs de developpement:" -ForegroundColor Yellow
Write-Host "Frontend: http://localhost:3000" -ForegroundColor White
Write-Host "Backend: http://localhost:8000" -ForegroundColor White
Write-Host ""
Write-Host "N'oubliez pas de commit:" -ForegroundColor Yellow
Write-Host "git add ." -ForegroundColor White
Write-Host 'git commit -m "Initial project setup"' -ForegroundColor White
Write-Host "git push origin main" -ForegroundColor White