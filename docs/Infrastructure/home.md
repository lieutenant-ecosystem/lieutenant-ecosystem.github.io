# How to Deploy

## Prerequisites
1. Administrator access to an Ubuntu server
2. [OpenAI API Key](https://platform.openai.com/)
3. [Google Programmable Search Engine ID and API Key](https://developers.google.com/custom-search/v1/introduction#identify_your_application_to_google_with_api_key)
   _(optional)_
4. [Microsoft Entra ID OAuth credentials](https://learn.microsoft.com/en-us/power-apps/developer/data-platform/walkthrough-register-app-azure-active-directory#create-the-app-registration)
   _(optional)_
5. [Sentry DSN](https://docs.sentry.io/platforms/python/integrations/fastapi/) _(optional)_


## Configuration Environmental Variables
| Key                          | Description                                 | Mandatory                                                             |
|------------------------------|---------------------------------------------|-----------------------------------------------------------------------|
| `ENVIRONMENT`                | Either `latest`, `beta` or `dev`            | <span class="material-symbols-outlined">check_circle</span>           |
| `OPENAI_API_KEY`             | `OpenAI` API Key                            | <span class="material-symbols-outlined">check_circle</span>           |
| `GOOGLE_PSE_API_KEY`         | `Google Programmable Search Engine` API Key | <span class="material-symbols-outlined">radio_button_unchecked</span> |
| `GOOGLE_PSE_ENGINE_ID`       | `Google Programmable Search Engine` ID      | <span class="material-symbols-outlined">radio_button_unchecked</span> |
| `MICROSOFT_CLIENT_ID`        | `Microsoft Entra ID` Client ID              | <span class="material-symbols-outlined">radio_button_unchecked</span> |
| `MICROSOFT_CLIENT_SECRET`    | `Microsoft Entra ID` Client Secret          | <span class="material-symbols-outlined">radio_button_unchecked</span> |
| `MICROSOFT_CLIENT_TENANT_ID` | `Microsoft Entra ID` Tenant ID              | <span class="material-symbols-outlined">radio_button_unchecked</span> |
| `SENTRY_DSN`                 | The `Sentry` DSN                            | <span class="material-symbols-outlined">radio_button_unchecked</span> |

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20,300,0,0" /> 

## Deployment
Execute the following script on an `Ubuntu` server to initialize the environment after setting up the environmental variables:
```shell
#!/bin/bash

# Initialize the system
sudo apt update && sudo apt full-upgrade -y

# Initialize Docker
sudo snap install docker

# Deploy the cluster
curl -s https://raw.githubusercontent.com/lieutenant-ecosystem/lieutenant/refs/heads/main/compose.yml |  sudo -E docker-compose -f - up -d
```