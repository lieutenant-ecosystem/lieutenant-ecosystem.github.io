# Open WebUI
## What is it?
[Open WebUI](https://openwebui.com/) is the main user-interface for interacting with Lieutenant.

Lieutenant will use the vanilla installation with the following environmental variables:
1. `OPENAI_API_BASE_URL`- The base URL of the `Sergeant Service` container.
2. `DATABASE_URL`- The URI of the `Relational Database` ([more info](https://docs.peewee-orm.com/en/latest/peewee/playhouse.html#db-url)).

## Architecture
![Ecosystem Architecture](/img/diagrams/OpenWebUIArchitecture.svg)

<details>
<summary>More information:</summary>
1. [Open WebUI documentation](https://docs.openwebui.com/)
2. [Sergeant Service](/docs/Sergeant%20Service/home)
</details>

## Notes
:::warning

If you are using `Microsoft Entra ID` for authentication, please ensure that the user's `Email Address` field is completed in their Entra ID `Properties`.
