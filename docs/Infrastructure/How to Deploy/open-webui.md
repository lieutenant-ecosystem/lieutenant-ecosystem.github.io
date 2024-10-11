# Open WebUI

## How to Deploy
1. Add the following environmental variables:
    1. `ENV`  - _Either_ `prod` _or_ `dev`
    2. `DATABASE_URL`  - _The Database URL Connection String_ ([guide](https://docs.peewee-orm.com/en/latest/peewee/playhouse.html#db-url))
    3. `OPENAI_API_KEY`  - _OpenAI API Key_
    4. `GOOGLE_PSE_API_KEY`  - _Google Programmable Search Engine API Key_ ([guide](https://developers.google.com/custom-search/v1/introduction#identify_your_application_to_google_with_api_key))
    5. `GOOGLE_PSE_ENGINE_ID`  - _Google Programmable Search Engine ID_
    6. `MICROSOFT_CLIENT_ID`  - _Microsoft Entra ID Client ID_ ([guide](https://learn.microsoft.com/en-us/power-apps/developer/data-platform/walkthrough-register-app-azure-active-directory#create-the-app-registration))
    7. `MICROSOFT_CLIENT_SECRET`  - _Microsoft Entra ID Client Secret_
    8. `MICROSOFT_CLIENT_TENANT_ID`  - _Microsoft Entra ID Tenant ID_
2. Bind your host port to the container's port number`8080`

---

## How to Deploy on an Azure Container App Instance
### Pre-requisite
The image is built and deployed as on the [GitHub Container Registry](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry#authenticating-with-a-personal-access-token-classic) or on [Docker Hub](https://docs.github.com/en/actions/use-cases-and-examples/publishing-packages/publishing-docker-images#publishing-images-to-docker-hub).

### How to Deploy
1. Create a new Azure Container App Instance with the following settings:
    1. `Deployment Source`  : `Container Image`
    2. `Image Source`  : `Docker Hub or other registries`
    3. `Image type`  : `Public`
    4. `Registry login server`  : `${REGISTRY LOGIN SERVER}`
    5. `Image and tag`  : `{IMAGE}:{TAG}`
    6. `CPU and Memory`  : `0.25 CPu cores, 0.5 Gi memory`  _(or above)_
    7. `Ingress`  : `Enabled`
    8. `Ingress traffic`  : `Accepting traffic from anywhere`
    9. `Target port`  : `8080`
2. Set the environmental variables above.
3. Go to the Container App instance settings -> `Application`  -> `Scale`
    1. Change the `Max replicas`  to `1`
4. Authorize the Entra ID callback URI:
    1. Go to `Overview`  and copy the `Application Url`
    2. Go to `App Registrations`  _(Azure Entra ID)_ -> `All applications`  -> `[Your Application]`  -> `Manage`  -> `Authentication`
    3. Add a `Web Redirect URI`  with `[Your Application URL]/oauth/microsoft/callback`  as the `URI` 
 