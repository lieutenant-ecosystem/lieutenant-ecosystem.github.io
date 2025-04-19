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

| Key                                      | Description                                                                                                                                 | Mandatory                                                             |
|------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------|
| `ENVIRONMENT`                            | Either `latest`, `beta` or `dev`                                                                                                            | <span class="material-symbols-outlined">check_circle</span>           |
| `SERGEANT_SERVICE_DATA_DIR`              | The `Sergant Service` data directory                                                                                                        | <span class="material-symbols-outlined">check_circle</span>           |
| `VECTOR_EMBEDDING_SERVICE_DATA_DIR`      | The `Vector Embedding Service` data directory                                                                                               | <span class="material-symbols-outlined">check_circle</span>           |
| `INTELLIGENCE_SERVICE_DATA_DIR`          | The `Intelligence Service` data directory                                                                                                   | <span class="material-symbols-outlined">check_circle</span>           |
| `DATABASE_URL`                           | The SQLAlchemy database URL ([guide](https://github.com/lieutenant-ecosystem/lieutenant)) for `Open WebUI`                                  | <span class="material-symbols-outlined">radio_button_unchecked</span> |
| `VECTOR_EMBEDDING_SERVICE_DATABASE_URL`  | The _asynchronous_ SQLAlchemy database URL ([guide](https://github.com/lieutenant-ecosystem/lieutenant)) for the `Vector Embedding Service` | <span class="material-symbols-outlined">radio_button_unchecked</span> |
| `OPENAI_API_KEY`                         | `OpenAI` API Key                                                                                                                            | <span class="material-symbols-outlined">radio_button_unchecked</span> |
| `OPENAI_COMPATIBLE_API_BASE_URL`         | The custom `OpenAI` API compatible endpoint                                                                                                 | <span class="material-symbols-outlined">radio_button_unchecked</span> |
| `OPENAI_COMPATIBLE_API_KEY`              | The custom `OpenAI` API compatible endpoint's API Key                                                                                       | <span class="material-symbols-outlined">radio_button_unchecked</span> |
| `MICROSOFT_CLIENT_ID`                    | `Microsoft Entra ID` Client ID                                                                                                              | <span class="material-symbols-outlined">radio_button_unchecked</span> |
| `MICROSOFT_CLIENT_SECRET`                | `Microsoft Entra ID` Client Secret                                                                                                          | <span class="material-symbols-outlined">radio_button_unchecked</span> |
| `MICROSOFT_CLIENT_TENANT_ID`             | `Microsoft Entra ID` Tenant ID                                                                                                              | <span class="material-symbols-outlined">radio_button_unchecked</span> |
| `VECTOR_EMBEDDING_BASE_URL`              | The `OpenAI` compatible vector embedding service's URL                                                                                      | <span class="material-symbols-outlined">radio_button_unchecked</span> |
| `VECTOR_EMBEDDING_API_KEY`               | The `Vector Embedding Service`'s API Key                                                                                                    | <span class="material-symbols-outlined">radio_button_unchecked</span> |
| `VECTOR_EMBEDDING_SERVICE_DEFAULT_MODEL` | The `Vector Embedding Service`'s default embedding model                                                                                    | <span class="material-symbols-outlined">radio_button_unchecked</span> |
| `SENTRY_DSN`                             | The `Sentry` DSN                                                                                                                            | <span class="material-symbols-outlined">radio_button_unchecked</span> |

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20,300,0,0" />

### How to deploy with an OpenAI?

Set the following environmental variables:

1. `OPENAI_API_KEY`

### How to deploy with an OpenAI compatible LLM endpoint?

Set the following environmental variables:

1. `OPENAI_COMPATIBLE_API_BASE_URL`
2. `OPENAI_COMPATIBLE_API_KEY`

### How to set an OpenAI compatible embedding service endpoint?

Set the following environmental variables:

1. `VECTOR_EMBEDDING_BASE_URL`
2. `VECTOR_EMBEDDING_API_KEY`
3. `VECTOR_EMBEDDING_SERVICE_DEFAULT_MODEL`

### How to set up authentication with `Microsoft Entra ID`?

Set the following environmental variables:

1. `MICROSOFT_CLIENT_TENANT_ID`
2. `MICROSOFT_CLIENT_ID`
3. `MICROSOFT_CLIENT_SECRET`

:::tip

`Microsoft Entra ID` authentication is enabled by default out of the box, for the best security.
Set the `ENABLE_LOGIN_FORM` environment variable to `True` in the `Open WebUI` container to activate the default authentication.

:::

## Deployment

### Prerequisites

1. Set up the respective environmental variables.
2. Set up the configuration files in `$HOME/app_data/$SERVICE_FOLDER_NAME/data`.
    1. As defaults, you can copy the `/data` folders in the repository.
   2. `$SERVICE_FOLDER_NAME` is the parent folder name of the `/data` folder in the repository _(e.g: `sergeant_service`)_.

### Command to Deploy

#### Kubernetes

```shell
sudo curl -sSL "https://raw.githubusercontent.com/lieutenant-ecosystem/lieutenant/refs/heads/${ENVIRONMENT/latest/main}/deploy.sh" | bash -s ${ENVIRONMENT/latest/main}
```

#### Docker Compose

```shell
sudo curl -sSL "https://raw.githubusercontent.com/lieutenant-ecosystem/lieutenant/refs/heads/${ENVIRONMENT/latest/main}/infrastructure/docker/deploy.sh" | bash -s ${ENVIRONMENT/latest/main}
```