# Infrastructure Terraform - Projet TP

## Cloud Provider
- **Cloud**: Google Cloud Platform (GCP)
- **Région principale**: europe-west1 (Belgique)
- **Région secondaire**: europe-west9 (Paris)

## Conventions de nommage

### Format général
`PREFIX-ENVIRONMENT-RESOURCETYPE-NAME`

Exemples:
- Bucket: `cilag-dev-bucket-app-static`
- VPC: `cilag-prod-vpc-main`
- Subnet: `cilag-staging-subnet-public-a`

### Préfixes
- **cilag**: Préfixe d'organisation

### Environnements
- **dev**: Développement
- **staging**: Pré-production
- **prod**: Production

## Tags/Labels obligatoires

Toutes les ressources doivent avoir ces labels:

`yaml
App: "nom-de-lapplication"
Environment: "dev|staging|prod"
Owner: "equipe-ou-personne"
CostCenter: "centre-de-cout"
ManagedBy: "terraform"
`

## Structure du projet

`
Infrastructure-Terraform/
├── modules/              # Modules Terraform réutilisables
│   ├── network/         # Module réseau (VPC, subnets)
│   ├── app_static/      # Module stockage statique
│   └── logging/         # Module journalisation
└── env/                 # Configurations par environnement
    ├── dev/
    ├── staging/
    └── prod/
`

## Workflow Git

1. Créer une branche depuis `main`
2. Effectuer les modifications
3. Tester avec `terraform plan`
4. Créer une Pull Request
5. Revue de code requise
6. Merge après approbation
