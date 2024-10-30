# How to Deploy

## Prerequisites

1. Administrator access to an Ubuntu server
2. [OpenAI API Key](https://platform.openai.com/)
3. [Google Programmable Search Engine ID and API Key](https://developers.google.com/custom-search/v1/introduction#identify_your_application_to_google_with_api_key)
   _(optional)_
4. [Microsoft Entra ID OAuth credentials](https://learn.microsoft.com/en-us/power-apps/developer/data-platform/walkthrough-register-app-azure-active-directory#create-the-app-registration)
   _(optional)_

## Deployment

Execute the following script on an `Ubuntu` server:

```shell
#!/bin/bash

sudo apt update
sudo apt install -y ca-certificates curl gnupg lsb-release
sudo snap install docker

# Set up Docker prerequisites
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update

# Install Docker
sudo apt -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose
sudo groupadd docker
sudo usermod -aG docker $USER

# Setup the docker-compose.yml file
ENV_FILE=$HOME/.env
curl -O https://raw.githubusercontent.com/lieutenant-ecosystem/lieutenant/refs/heads/main/docker-compose.yml
sudo chown $USER:$USER $ENV_FILE
sudo chown :docker $ENV_FILE
sudo chmod 640 $ENV_FILE
sudo chmod 755 $HOME

# Start Lieutenant
sudo docker-compose --env-file $HOME/.env up -d
```

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

:::tip

Use a `.env` file located in the same directory as the `docker-compose.yml` file.

:::

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20,300,0,0" />