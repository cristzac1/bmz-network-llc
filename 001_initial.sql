name: Deploy Frontend
on:
  push:
    branches: [main]
    paths: ["frontend/**", ".github/workflows/frontend-static-web-app.yml"]
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: Azure/static-web-apps-deploy@v1
        with:
          azure_static_web_apps_api_token: ${{ secrets.AZURE_STATIC_WEB_APPS_API_TOKEN }}
          repo_token: ${{ secrets.GITHUB_TOKEN }}
          action: upload
          app_location: /frontend
          output_location: dist
        env:
          VITE_API_URL: ${{ vars.VITE_API_URL }}
