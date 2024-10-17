# How to Deploy

## Infrastructure

Use the `Docker Compose` file below:
```yaml
version: '3.8'
services:

  open-webui:
    image: ghcr.io/lieutenant-ecosystem/open-webui:${ENVIRONMENT}
    restart: always
    ports:
      - "8080:8080"
    depends_on:
      - relational_database
      - sergeant_service
    environment:
      - ENV=${ENV}
      - GOOGLE_PSE_API_KEY=${GOOGLE_PSE_API_KEY}
      - GOOGLE_PSE_ENGINE_ID=${GOOGLE_PSE_ENGINE_ID}
      - MICROSOFT_CLIENT_ID=${MICROSOFT_CLIENT_ID}
      - MICROSOFT_CLIENT_SECRET=${MICROSOFT_CLIENT_SECRET}
      - MICROSOFT_CLIENT_TENANT_ID=${MICROSOFT_CLIENT_TENANT_ID}
      - OPENAI_API_BASE_URL=http://sergeant_service:8000
      - DATABASE_URL=postgresql://openwebui:unsecuredpassword@relational_database:5432/openwebui

  relational_database:
    image: postgres:latest
    environment:
      POSTGRES_DB: openwebui
      POSTGRES_USER: openwebui
      POSTGRES_PASSWORD: unsecuredpassword
    volumes:
      - postgres_data:/var/lib/postgresql/data
    ports:
      - "5432:5432"

  sergeant_service:
    image: ghcr.io/lieutenant-ecosystem/sergeant-service:${ENVIRONMENT}
    ports:
      - "8000:8000"
    extra_hosts:
      - "host.docker.internal:host-gateway"
    environment:
      - OPENAI_API_KEY=${OPENAI_API_KEY}

  gateway:
    image: cloudflare/cloudflared:latest
    command: tunnel --no-autoupdate run --token ${CLOUDFLARE_TUNNEL_TOKEN}
    network_mode: "host"
    environment:
      - CLOUDFLARE_TUNNEL_TOKEN=${CLOUDFLARE_TUNNEL_TOKEN}


volumes:
  postgres_data:

```

## Configurations

| Key                          | Description                                                                                                                                                                              |
|------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `ENV`                        | Either `prod` or `dev`                                                                                                                                                                   |
| `OPENAI_API_KEY`             | OpenAI API Key                                                                                                                                                                           |
| `GOOGLE_PSE_API_KEY`         | Google Programmable Search Engine API Key ([guide](https://developers.google.com/custom-search/v1/introduction#identify_your_application_to_google_with_api_key))                        |
| `GOOGLE_PSE_ENGINE_ID`       | Google Programmable Search Engine ID                                                                                                                                                     |
| `MICROSOFT_CLIENT_ID`        | Microsoft Entra ID Client ID ([guide](https://learn.microsoft.com/en-us/power-apps/developer/data-platform/walkthrough-register-app-azure-active-directory#create-the-app-registration)) |
| `MICROSOFT_CLIENT_SECRET`    | Microsoft Entra ID Client Secret                                                                                                                                                         |
| `MICROSOFT_CLIENT_TENANT_ID` | Microsoft Entra ID Tenant ID                                                                                                                                                             |