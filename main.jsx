name: Deploy API
on:
  push:
    branches: [main]
    paths: ["backend/**", ".github/workflows/backend-app-service.yml"]
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: azure/webapps-deploy@v3
        with:
          app-name: bmz-network-api
          publish-profile: ${{ secrets.AZURE_WEBAPP_PUBLISH_PROFILE }}
          package: backend
