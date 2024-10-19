# Sergeant Service
## What is a Sergeant?
A `Sergeant` is a large language model designed to perform specific tasks.

## What is it?
`Sergeant Service` handles all interactions with the `Sergeants`.

## Architecture
![Sergeant Service](/img/diagrams/SergeantServiceArchitecture.svg)

## How to Authenticate
Use `Bearer Token Authentication` by obtaining the `JWT Token` from the `Open WebUI` ([guide](https://docs.openwebui.com/api/#-retrieval-augmented-generation-rag)).

:::danger

Requests that do not include the `X-Forwarded-For` header are treated as coming from `Lieutenant`'s private network rather than the secure tunnel. As a result, these requests can pass through without the need for authentication.

:::