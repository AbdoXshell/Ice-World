
# Ice-World

## 1) Description
- Site statique (HTML/CSS/JS) : page d’atterrissage pour une boutique de glace (section hero, produits populaires, promos, avantages, formulaire d’abonnement, liens sociaux).
- Outils : Git (GitLab + miroir GitHub), Docker, CI/CD (GitLab CI + GitHub Actions).
- Objectif : pipeline Build → Test → Deploy vers Pages.

## 2) Étapes suivies
- Création du repo et structure des fichiers (`index.html`, `styles.css`, `main.js`, dossier `assets/`).
- Docker : `Dockerfile` basé sur nginx:alpine, tests :
  - `docker build -t ice-world .`
  - `docker run -d -p 8080:80 --name ice-world ice-world`
- CI/CD :
  - GitLab : `.gitlab-ci.yml` avec build (docker:dind), test simple, puis pages (déploiement).
  - GitHub : `.github/workflows/ci.yml` avec build-and-test puis deploy vers GitHub Pages.

## 3) Exécution
- Local : ouvrir `index.html` ou lancer `python -m http.server 8000` puis http://localhost:8000
- Docker : mêmes commandes build/run ci-dessus.
- Tout push sur `main` déclenche la pipeline (GitLab et GitHub).

## 4) Problèmes rencontrés et solutions
- Commande rsync en échec dans Pages : ajusté `rsync` dans `.gitlab-ci.yml` pour exclure les fichiers de config et partir de la racine.
- Alerte VS Code sur le schéma YAML GitLab : ignorée côté éditeur, validée via Lint GitLab.
- `docker run` échouait parfois à cause d’un conteneur existant : suppression avant relance (`docker rm -f ice-world`).
- GitHub Actions signalait le champ `enablement` : supprimé et utilisé les valeurs par défaut pour le déploiement.

## 5) Liens et résultats
- GitHub Pages : https://abdoxshell.github.io/Ice-World/
- GitHub Actions (dernier run) : https://github.com/AbdoXshell/Ice-World/actions/runs/20113126585 (capture : screenshots/pipeline-github.png)
- GitLab Pipeline : https://gitlab.com/abdoxshell1-group/Ice-World/-/pipelines/2207893935/ (capture : screenshots/pipeline-gitlab.png)
- Fichiers de build : `Dockerfile`, `.dockerignore`, `.nojekyll`, `.gitlab-ci.yml`, `.github/workflows/ci.yml`.
- Captures : `screenshots/pipeline-github.png`, `screenshots/site.png`, `screenshots/site-pages.png`.
