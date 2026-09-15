# Scalar Ruby API

Complete reference of every operation, grouped by resource. See [the README](./README.md) for usage and configuration.

## Contents

- [`Registry`](#registry)
  - [List all API Documents](#list-all-api-documents)
  - [List API Documents in a namespace](#list-api-documents-in-a-namespace)
  - [Create API Document](#create-api-document)
  - [Update API Document metadata](#update-api-document-metadata)
  - [Delete API Document](#delete-api-document)
  - [Get API Document](#get-api-document)
  - [Update API Document version](#update-api-document-version)
  - [Delete API Document version](#delete-api-document-version)
  - [Get API Document version metadata](#get-api-document-version-metadata)
  - [Create API Document version](#create-api-document-version)
  - [Add access group](#add-access-group)
  - [Remove access group](#remove-access-group)
- [`Schemas`](#schemas)
  - [List all shared components](#list-all-shared-components)
  - [Create a shared component](#create-a-shared-component)
  - [Update shared component metadata](#update-shared-component-metadata)
  - [Delete a shared component](#delete-a-shared-component)
  - [`Schemas Version`](#schemas-version)
    - [Get a shared component document](#get-a-shared-component-document)
    - [Delete a shared component version](#delete-a-shared-component-version)
    - [Create a shared component version](#create-a-shared-component-version)
  - [`Schemas AccessGroup`](#schemas-accessgroup)
    - [Add shared component access group](#add-shared-component-access-group)
    - [Remove shared component access group](#remove-shared-component-access-group)
- [`LoginPortals`](#loginportals)
  - [Get a login portal](#get-a-login-portal)
  - [Update portal metadata](#update-portal-metadata)
  - [Delete a login portal](#delete-a-login-portal)
  - [Create a portal](#create-a-portal)
  - [List all portals](#list-all-portals)
- [`Rules`](#rules)
  - [List all rules](#list-all-rules)
  - [Create a rule](#create-a-rule)
  - [Update rule metadata](#update-rule-metadata)
  - [Delete a rule](#delete-a-rule)
  - [Get a rule](#get-a-rule)
  - [Add rule access group](#add-rule-access-group)
  - [Remove rule access group](#remove-rule-access-group)
- [`Themes`](#themes)
  - [List all themes](#list-all-themes)
  - [Create a theme](#create-a-theme)
  - [Update theme metadata](#update-theme-metadata)
  - [Update theme document](#update-theme-document)
  - [Delete a theme](#delete-a-theme)
  - [Get a theme](#get-a-theme)
- [`Teams`](#teams)
  - [List teams](#list-teams)
- [`ScalarDocs`](#scalardocs)
  - [List all projects](#list-all-projects)
  - [Create a project](#create-a-project)
  - [Publish a project](#publish-a-project)
- [`Namespaces`](#namespaces)
  - [List namespaces](#list-namespaces)
- [`Authentication`](#authentication)
  - [Exchange token](#exchange-token)
  - [Get current user](#get-current-user)

## Setup

```ruby
require "acme"

client = Scalar::Client.new(
  bearer_auth: ENV["BEARER_AUTH"], # defaults to the BEARER_AUTH env var
)
```

## `Registry`

Registry

### List all API Documents

List all API documents across every namespace the caller can access.

| Direction | Type |
| --- | --- |
| Request | [`RegistryListAllAPIDocumentsParams`](././lib/acme/models/registry_list_all_api_documents_params.rb) |
| Response | [`RegistryListAllAPIDocumentsResponseItem`](././lib/acme/models/registry_list_all_api_documents_response.rb) |

```ruby
response = client.registry.list_all_api_documents

puts response.inspect
```

### List API Documents in a namespace

List API documents in a namespace.

| Direction | Type |
| --- | --- |
| Request | [`RegistryListAPIDocumentsParams`](././lib/acme/models/registry_list_api_documents_params.rb) |
| Response | [`RegistryListAPIDocumentsResponseItem`](././lib/acme/models/registry_list_api_documents_response.rb) |

```ruby
response = client.registry.list_api_documents("namespace")

puts response.inspect
```

### Create API Document

Create an API document.

| Direction | Type |
| --- | --- |
| Request | [`RegistryCreateAPIDocumentParams`](././lib/acme/models/registry_create_api_document_params.rb) |
| Response | [`RegistryCreateAPIDocumentResponse`](././lib/acme/models/registry_create_api_document_response.rb) |

```ruby
response = client.registry.create_api_document("namespace", { document: "", slug: "", title: "", version: "x", description: "", is_private: false, ruleset: "" })

puts response.inspect
```

### Update API Document metadata

Update metadata for an API document.

| Direction | Type |
| --- | --- |
| Request | [`RegistryUpdateAPIDocumentParams`](././lib/acme/models/registry_update_api_document_params.rb) |

```ruby
response = client.registry.update_api_document("slug", { namespace: "namespace", description: "", is_private: false, ruleset: "", title: "" })

puts response.inspect
```

### Delete API Document

Delete an API document and all versions.

| Direction | Type |
| --- | --- |
| Request | [`RegistryDeleteAPIDocumentParams`](././lib/acme/models/registry_delete_api_document_params.rb) |

```ruby
response = client.registry.delete_api_document("slug", { namespace: "namespace" })

puts response.inspect
```

### Get API Document

Get a specific API document version.

| Direction | Type |
| --- | --- |
| Request | [`RegistryRetrieveAPIDocumentVersionParams`](././lib/acme/models/registry_retrieve_api_document_version_params.rb) |

```ruby
response = client.registry.retrieve_api_document_version("semver", { namespace: "namespace", slug: "slug" })

puts response.inspect
```

### Update API Document version

Update the registry file content for an API document version.

| Direction | Type |
| --- | --- |
| Request | [`RegistryUpdateAPIDocumentVersionParams`](././lib/acme/models/registry_update_api_document_version_params.rb) |
| Response | [`RegistryUpdateAPIDocumentVersionResponse`](././lib/acme/models/registry_update_api_document_version_response.rb) |

```ruby
response = client.registry.update_api_document_version("semver", { namespace: "namespace", slug: "slug", document: "", last_known_version_sha: "" })

puts response.inspect
```

### Delete API Document version

Delete a specific API document version.

| Direction | Type |
| --- | --- |
| Request | [`RegistryDeleteAPIDocumentVersionParams`](././lib/acme/models/registry_delete_api_document_version_params.rb) |

```ruby
response = client.registry.delete_api_document_version("semver", { namespace: "namespace", slug: "slug" })

puts response.inspect
```

### Get API Document version metadata

Get metadata (uid, content shas, version sha, tags) for a specific API document version.

| Direction | Type |
| --- | --- |
| Request | [`RegistryListAPIDocumentVersionMetadataParams`](././lib/acme/models/registry_list_api_document_version_metadata_params.rb) |
| Response | [`ManagedDocVersion`](././lib/acme/models/managed_doc_version.rb) |

```ruby
response = client.registry.list_api_document_version_metadata("semver", { namespace: "namespace", slug: "slug" })

puts response.inspect
```

### Create API Document version

Create a new API document version.

| Direction | Type |
| --- | --- |
| Request | [`RegistryCreateAPIDocumentVersionParams`](././lib/acme/models/registry_create_api_document_version_params.rb) |
| Response | [`ManagedDocVersion`](././lib/acme/models/managed_doc_version.rb) |

```ruby
response = client.registry.create_api_document_version("slug", { namespace: "namespace", document: "", version: "x", force: false, last_known_version_sha: "" })

puts response.inspect
```

### Add access group

Add an access group to an API document.

| Direction | Type |
| --- | --- |
| Request | [`RegistryCreateAPIDocumentAccessGroupParams`](././lib/acme/models/registry_create_api_document_access_group_params.rb) |

```ruby
response = client.registry.create_api_document_access_group("slug", { access_group_slug: "xxx", namespace: "namespace" })

puts response.inspect
```

### Remove access group

Remove an access group from an API document.

| Direction | Type |
| --- | --- |
| Request | [`RegistryDeleteAPIDocumentAccessGroupParams`](././lib/acme/models/registry_delete_api_document_access_group_params.rb) |

```ruby
response = client.registry.delete_api_document_access_group("slug", { access_group_slug: "xxx", namespace: "namespace" })

puts response.inspect
```

## `Schemas`

Schemas

### List all shared components

List schemas in a namespace.

| Direction | Type |
| --- | --- |
| Request | [`SchemaListParams`](././lib/acme/models/schema_list_params.rb) |
| Response | [`SchemaListResponseItem`](././lib/acme/models/schema_list_response.rb) |

```ruby
response = client.schemas.list("namespace")

puts response.inspect
```

### Create a shared component

Create a schema in a namespace.

| Direction | Type |
| --- | --- |
| Request | [`SchemaCreateParams`](././lib/acme/models/schema_create_params.rb) |
| Response | [`UID`](././lib/acme/models/uid.rb) |

```ruby
response = client.schemas.create("namespace", { document: "", slug: "", title: "", version: "x", description: "", is_private: false })

puts response.inspect
```

### Update shared component metadata

Update schema metadata.

| Direction | Type |
| --- | --- |
| Request | [`SchemaUpdateParams`](././lib/acme/models/schema_update_params.rb) |

```ruby
response = client.schemas.update("slug", { namespace: "namespace", description: "", is_private: false, title: "" })

puts response.inspect
```

### Delete a shared component

Delete a schema and all related versions.

| Direction | Type |
| --- | --- |
| Request | [`SchemaDeleteParams`](././lib/acme/models/schema_delete_params.rb) |

```ruby
response = client.schemas.delete("slug", { namespace: "namespace" })

puts response.inspect
```

### `Schemas Version`

Schemas

#### Get a shared component document

Get a specific schema version document.

| Direction | Type |
| --- | --- |
| Request | [`VersionRetrieveParams`](././lib/acme/models/schemas/version_retrieve_params.rb) |

```ruby
response = client.schemas.version.retrieve("semver", { namespace: "namespace", slug: "slug" })

puts response.inspect
```

#### Delete a shared component version

Delete a schema version.

| Direction | Type |
| --- | --- |
| Request | [`VersionDeleteParams`](././lib/acme/models/schemas/version_delete_params.rb) |

```ruby
response = client.schemas.version.delete("semver", { namespace: "namespace", slug: "slug" })

puts response.inspect
```

#### Create a shared component version

Create a schema version.

| Direction | Type |
| --- | --- |
| Request | [`VersionCreateParams`](././lib/acme/models/schemas/version_create_params.rb) |
| Response | [`UID`](././lib/acme/models/uid.rb) |

```ruby
response = client.schemas.version.create("slug", { namespace: "namespace", document: "", version: "x" })

puts response.inspect
```

### `Schemas AccessGroup`

Schemas

#### Add shared component access group

Add an access group to a schema.

| Direction | Type |
| --- | --- |
| Request | [`AccessGroupCreateParams`](././lib/acme/models/schemas/access_group_create_params.rb) |

```ruby
response = client.schemas.access_group.create("slug", { access_group_slug: "xxx", namespace: "namespace" })

puts response.inspect
```

#### Remove shared component access group

Remove an access group from a schema.

| Direction | Type |
| --- | --- |
| Request | [`AccessGroupDeleteParams`](././lib/acme/models/schemas/access_group_delete_params.rb) |

```ruby
response = client.schemas.access_group.delete("slug", { access_group_slug: "xxx", namespace: "namespace" })

puts response.inspect
```

## `LoginPortals`

Login Portals

### Get a login portal

Get a login portal by slug.

| Direction | Type |
| --- | --- |
| Request | [`LoginPortalRetrieveParams`](././lib/acme/models/login_portal_retrieve_params.rb) |
| Response | [`LoginPortalRetrieveResponse`](././lib/acme/models/login_portal_retrieve_response.rb) |

```ruby
response = client.login_portals.retrieve("slug")

puts response.inspect
```

### Update portal metadata

Update metadata for a login portal.

| Direction | Type |
| --- | --- |
| Request | [`LoginPortalUpdateParams`](././lib/acme/models/login_portal_update_params.rb) |

```ruby
response = client.login_portals.update("slug", { title: "" })

puts response.inspect
```

### Delete a login portal

Delete a login portal.

| Direction | Type |
| --- | --- |
| Request | [`LoginPortalDeleteParams`](././lib/acme/models/login_portal_delete_params.rb) |

```ruby
response = client.login_portals.delete("slug")

puts response.inspect
```

### Create a portal

Create a login portal for the current team.

| Direction | Type |
| --- | --- |
| Request | [`LoginPortalCreateParams`](././lib/acme/models/login_portal_create_params.rb) |
| Response | [`UID`](././lib/acme/models/uid.rb) |

```ruby
response = client.login_portals.create({ email: { "logo" => "", "logoSize" => "100", "buttonText" => "Login", "message" => "Click to access private documentation hosted by scalar.com", "title" => "Private Docs", "mainColor" => "\#2a2f45", "mainBackground" => "\#f6f6f6", "cardColor" => "2a2f45", "cardBackground" => "\#fff", "buttonColor" => "\#fff", "buttonBackground" => "\#0f0f0f" }, page: { "title" => "Scalar Private Docs", "description" => "Login to access your documentation", "head" => "", "script" => "", "theme" => "", "companyName" => "", "logo" => "", "logoURL" => "", "favicon" => "", "termsLink" => "", "privacyLink" => "", "formTitle" => "Scalar Private Docs", "formDescription" => "Login to access your documentation", "formImage" => "" }, slug: "", title: "" })

puts response.inspect
```

### List all portals

List all login portals for the current team.

| Direction | Type |
| --- | --- |
| Request | [`LoginPortalListParams`](././lib/acme/models/login_portal_list_params.rb) |
| Response | [`LoginPortalListResponseItem`](././lib/acme/models/login_portal_list_response.rb) |

```ruby
response = client.login_portals.list

puts response.inspect
```

## `Rules`

Rules

### List all rules

List all rulesets in a namespace.

| Direction | Type |
| --- | --- |
| Request | [`RuleListRulesetsParams`](././lib/acme/models/rule_list_rulesets_params.rb) |
| Response | [`RuleListRulesetsResponseItem`](././lib/acme/models/rule_list_rulesets_response.rb) |

```ruby
response = client.rules.list_rulesets("namespace")

puts response.inspect
```

### Create a rule

Create a rule in a namespace.

| Direction | Type |
| --- | --- |
| Request | [`RuleCreateRulesetParams`](././lib/acme/models/rule_create_ruleset_params.rb) |
| Response | [`UID`](././lib/acme/models/uid.rb) |

```ruby
response = client.rules.create_ruleset("namespace", { document: "", slug: "", title: "", description: "", is_private: false })

puts response.inspect
```

### Update rule metadata

Update rule metadata by slug.

| Direction | Type |
| --- | --- |
| Request | [`RuleUpdateRulesetParams`](././lib/acme/models/rule_update_ruleset_params.rb) |

```ruby
response = client.rules.update_ruleset("path_slug", { path_namespace: "path_namespace", description: "", is_private: false, body_namespace: "", body_slug: "", title: "" })

puts response.inspect
```

### Delete a rule

Delete a rule by slug.

| Direction | Type |
| --- | --- |
| Request | [`RuleDeleteRulesetParams`](././lib/acme/models/rule_delete_ruleset_params.rb) |

```ruby
response = client.rules.delete_ruleset("slug", { namespace: "namespace" })

puts response.inspect
```

### Get a rule

Get a rule document by slug.

| Direction | Type |
| --- | --- |
| Request | [`RuleRetrieveRulesetDocumentParams`](././lib/acme/models/rule_retrieve_ruleset_document_params.rb) |

```ruby
response = client.rules.retrieve_ruleset_document("slug", { namespace: "namespace" })

puts response.inspect
```

### Add rule access group

Grant an access group to a rule.

| Direction | Type |
| --- | --- |
| Request | [`RuleCreateRulesetAccessGroupParams`](././lib/acme/models/rule_create_ruleset_access_group_params.rb) |

```ruby
response = client.rules.create_ruleset_access_group("slug", { access_group_slug: "xxx", namespace: "namespace" })

puts response.inspect
```

### Remove rule access group

Remove an access group from a rule.

| Direction | Type |
| --- | --- |
| Request | [`RuleDeleteRulesetAccessGroupParams`](././lib/acme/models/rule_delete_ruleset_access_group_params.rb) |

```ruby
response = client.rules.delete_ruleset_access_group("slug", { access_group_slug: "xxx", namespace: "namespace" })

puts response.inspect
```

## `Themes`

Themes

### List all themes

List all team themes.

| Direction | Type |
| --- | --- |
| Request | [`ThemeListParams`](././lib/acme/models/theme_list_params.rb) |
| Response | [`ThemeListResponseItem`](././lib/acme/models/theme_list_response.rb) |

```ruby
response = client.themes.list

puts response.inspect
```

### Create a theme

Create a team theme.

| Direction | Type |
| --- | --- |
| Request | [`ThemeCreateParams`](././lib/acme/models/theme_create_params.rb) |
| Response | [`UID`](././lib/acme/models/uid.rb) |

```ruby
response = client.themes.create({ document: "", name: "", slug: "", description: "" })

puts response.inspect
```

### Update theme metadata

Update theme metadata.

| Direction | Type |
| --- | --- |
| Request | [`ThemeUpdateParams`](././lib/acme/models/theme_update_params.rb) |

```ruby
response = client.themes.update("slug", { description: "", name: "" })

puts response.inspect
```

### Update theme document

Replace the theme document.

| Direction | Type |
| --- | --- |
| Request | [`ThemeReplaceDocumentParams`](././lib/acme/models/theme_replace_document_params.rb) |

```ruby
response = client.themes.replace_document("slug", { document: "" })

puts response.inspect
```

### Delete a theme

Delete a theme by slug.

| Direction | Type |
| --- | --- |
| Request | [`ThemeDeleteParams`](././lib/acme/models/theme_delete_params.rb) |

```ruby
response = client.themes.delete("slug")

puts response.inspect
```

### Get a theme

Get the theme document by slug.

| Direction | Type |
| --- | --- |
| Request | [`ThemeRetrieveParams`](././lib/acme/models/theme_retrieve_params.rb) |

```ruby
response = client.themes.retrieve("slug")

puts response.inspect
```

## `Teams`

Teams

### List teams

List all available teams

| Direction | Type |
| --- | --- |
| Request | [`TeamListParams`](././lib/acme/models/team_list_params.rb) |
| Response | [`TeamListResponseItem`](././lib/acme/models/team_list_response.rb) |

```ruby
response = client.teams.list

puts response.inspect
```

## `ScalarDocs`

Scalar Docs

### List all projects

List all guide projects.

| Direction | Type |
| --- | --- |
| Request | [`ScalarDocListGuidesParams`](././lib/acme/models/scalar_doc_list_guides_params.rb) |
| Response | [`ScalarDocListGuidesResponseItem`](././lib/acme/models/scalar_doc_list_guides_response.rb) |

```ruby
response = client.scalar_docs.list_guides

puts response.inspect
```

### Create a project

Create a guide project.

| Direction | Type |
| --- | --- |
| Request | [`ScalarDocCreateGuideParams`](././lib/acme/models/scalar_doc_create_guide_params.rb) |
| Response | [`ScalarDocCreateGuideResponse`](././lib/acme/models/scalar_doc_create_guide_response.rb) |

```ruby
response = client.scalar_docs.create_guide({ allowed_domains: [], allowed_users: [], is_private: false, name: "", slug: "xxx" })

puts response.inspect
```

### Publish a project

Start a new publish process.

| Direction | Type |
| --- | --- |
| Request | [`ScalarDocPublishGuideParams`](././lib/acme/models/scalar_doc_publish_guide_params.rb) |
| Response | [`ScalarDocPublishGuideResponse`](././lib/acme/models/scalar_doc_publish_guide_response.rb) |

```ruby
response = client.scalar_docs.publish_guide("slug")

puts response.inspect
```

## `Namespaces`

Namespaces

### List namespaces

Get all namespaces for the current team

| Direction | Type |
| --- | --- |
| Request | [`NamespaceListParams`](././lib/acme/models/namespace_list_params.rb) |

```ruby
response = client.namespaces.list

puts response.inspect
```

## `Authentication`

Authentication

### Exchange token

Exchange an API key for an access token.

| Direction | Type |
| --- | --- |
| Request | [`AuthenticationExchangePersonalTokenParams`](././lib/acme/models/authentication_exchange_personal_token_params.rb) |
| Response | [`AuthenticationExchangePersonalTokenResponse`](././lib/acme/models/authentication_exchange_personal_token_response.rb) |

```ruby
response = client.authentication.exchange_personal_token({ personal_token: "" })

puts response.inspect
```

### Get current user

Get the authenticated user, including their available teams and theme.

| Direction | Type |
| --- | --- |
| Request | [`AuthenticationListCurrentUserParams`](././lib/acme/models/authentication_list_current_user_params.rb) |
| Response | [`AuthenticationListCurrentUserResponse`](././lib/acme/models/authentication_list_current_user_response.rb) |

```ruby
response = client.authentication.list_current_user

puts response.inspect
```
