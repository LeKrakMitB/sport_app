<<<<<<< HEAD
﻿# Sports Platform MVP

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
=======
# sport_app
Mise en relation de pratiquants et de sportifs
>>>>>>> 6cb30561a66afb90655a1b930b0c79f2bb7ea64b
