# Changelog

## [0.5.0](https://github.com/scalar/galaxy-ruby/compare/v0.4.0...v0.5.0) (2026-10-07)


### ⚠ BREAKING CHANGES

* **api:** 89 breaking changes to the SDK surface.
    - Renamed SDK from `Scalar` to `ScalarGalaxy`.
    - Removed server `https://access.scalar.com`.
    - URL of environment `production` changed from `https://access.scalar.com` to `https://galaxy.scalar.com`.
    - Removed `bearer` auth scheme `BearerAuth`.
    - Removed operation `registry.listAllApiDocuments` (`GET /v1/apis`).
    - Removed operation `registry.listApiDocuments` (`GET /v1/apis/{namespace}`).
    - Removed operation `registry.createApiDocument` (`POST /v1/apis/{namespace}`).
    - Removed operation `registry.updateApiDocument` (`PATCH /v1/apis/{namespace}/{slug}`).
    - Removed operation `registry.deleteApiDocument` (`DELETE /v1/apis/{namespace}/{slug}`).
    - Removed operation `registry.retrieveApiDocumentVersion` (`GET /v1/apis/{namespace}/{slug}/version/{semver}`).
    - Removed operation `registry.updateApiDocumentVersion` (`PATCH /v1/apis/{namespace}/{slug}/version/{semver}`).
    - Removed operation `registry.deleteApiDocumentVersion` (`DELETE /v1/apis/{namespace}/{slug}/version/{semver}`).
    - Removed operation `registry.listApiDocumentVersionMetadata` (`GET /v1/apis/{namespace}/{slug}/version/{semver}/metadata`).
    - Removed operation `registry.createApiDocumentVersion` (`POST /v1/apis/{namespace}/{slug}/version`).
    - Removed operation `registry.createApiDocumentAccessGroup` (`POST /v1/apis/{namespace}/{slug}/access-group`).
    - Removed operation `registry.deleteApiDocumentAccessGroup` (`DELETE /v1/apis/{namespace}/{slug}/access-group`).
    - Removed operation `schemas.list` (`GET /v1/schemas/{namespace}`).
    - Removed operation `schemas.create` (`POST /v1/schemas/{namespace}`).
    - Removed operation `schemas.update` (`PATCH /v1/schemas/{namespace}/{slug}`).
    - Removed operation `schemas.delete` (`DELETE /v1/schemas/{namespace}/{slug}`).
    - Removed operation `schemas.version.retrieve` (`GET /v1/schemas/{namespace}/{slug}/version/{semver}`).
    - Removed operation `schemas.version.delete` (`DELETE /v1/schemas/{namespace}/{slug}/version/{semver}`).
    - Removed operation `schemas.version.create` (`POST /v1/schemas/{namespace}/{slug}/version`).
    - Removed operation `schemas.accessGroup.create` (`POST /v1/schemas/{namespace}/{slug}/access-group`).
    - Removed operation `schemas.accessGroup.delete` (`DELETE /v1/schemas/{namespace}/{slug}/access-group`).
    - Removed operation `loginPortals.retrieve` (`GET /v1/login-portals/{slug}`).
    - Removed operation `loginPortals.update` (`PATCH /v1/login-portals/{slug}`).
    - Removed operation `loginPortals.delete` (`DELETE /v1/login-portals/{slug}`).
    - Removed operation `loginPortals.create` (`POST /v1/login-portals`).
    - Removed operation `loginPortals.list` (`GET /v1/login-portals`).
    - Removed operation `rules.listRulesets` (`GET /v1/rulesets/{namespace}`).
    - Removed operation `rules.createRuleset` (`POST /v1/rulesets/{namespace}`).
    - Removed operation `rules.updateRuleset` (`PATCH /v1/rulesets/{namespace}/{slug}`).
    - Removed operation `rules.deleteRuleset` (`DELETE /v1/rulesets/{namespace}/{slug}`).
    - Removed operation `rules.retrieveRulesetDocument` (`GET /v1/rulesets/{namespace}/{slug}`).
    - Removed operation `rules.createRulesetAccessGroup` (`POST /v1/rulesets/{namespace}/{slug}/access-group`).
    - Removed operation `rules.deleteRulesetAccessGroup` (`DELETE /v1/rulesets/{namespace}/{slug}/access-group`).
    - Removed operation `themes.list` (`GET /v1/themes`).
    - Removed operation `themes.create` (`POST /v1/themes`).
    - Removed operation `themes.update` (`PATCH /v1/themes/{slug}`).
    - Removed operation `themes.replaceDocument` (`PUT /v1/themes/{slug}`).
    - Removed operation `themes.delete` (`DELETE /v1/themes/{slug}`).
    - Removed operation `themes.retrieve` (`GET /v1/themes/{slug}`).
    - Removed operation `teams.list` (`GET /v1/teams`).
    - Removed operation `scalarDocs.listGuides` (`GET /v1/guides`).
    - Removed operation `scalarDocs.createGuide` (`POST /v1/guides`).
    - Removed operation `scalarDocs.publishGuide` (`POST /v1/guides/{slug}/publish`).
    - Removed operation `namespaces.list` (`GET /v1/namespaces`).
    - Removed operation `authentication.exchangePersonalToken` (`POST /v1/auth/exchange`).
    - Removed operation `authentication.listCurrentUser` (`GET /v1/auth/me`).
    - Removed required property `user.uid`.
    - Removed required property `user.createdAt`.
    - Removed required property `user.updatedAt`.
    - Removed required property `user.email`.
    - Removed optional property `user.theme`.
    - Removed required property `user.activeTeamId`.
    - Removed required property `user.hasGithub`.
    - Removed required property `user.teams`.
    - Removed schema `400`.
    - Removed schema `401`.
    - Removed schema `403`.
    - Removed schema `404`.
    - Removed schema `422`.
    - Removed schema `500`.
    - Removed schema `api_document`.
    - Removed schema `nanoid`.
    - Removed schema `version`.
    - Removed schema `slug`.
    - Removed schema `namespace`.
    - Removed schema `managed_doc_version`.
    - Removed schema `method`.
    - Removed schema `access_group`.
    - Removed schema `schema`.
    - Removed schema `managed_schema_version`.
    - Removed schema `timestamp`.
    - Removed schema `uid`.
    - Removed schema `login_portal_email`.
    - Removed schema `login_portal_page`.
    - Removed schema `login_portal`.
    - Removed schema `rule`.
    - Removed schema `theme`.
    - Removed schema `team`.
    - Removed schema `team_name`.
    - Removed schema `team_image`.
    - Removed schema `github_project`.
    - Removed schema `active_deployment`.
    - Removed schema `github_project_repository`.
    - Removed schema `email`.
    - Removed schema `team_summary`.
* **api:** 53 breaking changes to the SDK surface.
    - Renamed SDK from `ScalarGalaxy` to `Scalar`.
    - Removed server `https://galaxy.scalar.com`.
    - Removed server `{protocol}://void.scalar.com/{path}`.
    - URL of environment `production` changed from `https://galaxy.scalar.com` to `https://access.scalar.com`.
    - Removed environment `void`.
    - Removed `bearer` auth scheme `bearerAuth`.
    - Removed `basic` auth scheme `basicAuth`.
    - Removed `apiKey` auth scheme `apiKeyHeader`.
    - Removed `apiKey` auth scheme `apiKeyQuery`.
    - Removed `apiKey` auth scheme `apiKeyCookie`.
    - Removed `oauth2` auth scheme `oAuth2`.
    - Removed `oauth2` auth scheme `openIdConnect`.
    - Removed operation `planets.listAllData` (`GET /planets`).
    - Removed operation `planets.create` (`POST /planets`).
    - Removed operation `planets.retrieve` (`GET /planets/{planetId}`).
    - Removed operation `planets.update` (`PUT /planets/{planetId}`).
    - Removed operation `planets.delete` (`DELETE /planets/{planetId}`).
    - Removed operation `planets.delteImage` (`POST /planets/{planetId}/image`).
    - Removed operation `celestialBodies.create` (`POST /celestial-bodies`).
    - Removed operation `authentication.createUser` (`POST /user/signup`).
    - Removed operation `authentication.createToken` (`POST /auth/token`).
    - Removed operation `authentication.listMe` (`GET /me`).
    - Added required property `user.uid`.
    - Added required property `user.createdAt`.
    - Added required property `user.updatedAt`.
    - Added required property `user.email`.
    - Added required property `user.activeTeamId`.
    - Added required property `user.hasGithub`.
    - Added required property `user.teams`.
    - Removed optional property `user.id`.
    - Removed optional property `user.name`.
    - Removed schema `credentials`.
    - Removed schema `token`.
    - Removed schema `celestial_body`.
    - Removed schema `planet`.
    - Removed schema `satellite`.
    - Removed schema `paginated_resource`.
    - Removed schema `ListAllDataResponseHeaders`.
    - Removed schema `CreateResponseHeaders`.
    - Removed schema `CreateStatus400ResponseHeaders`.
    - Removed schema `RetrieveResponseHeaders`.
    - Removed schema `UpdateStatus400ResponseHeaders`.
    - Removed schema `DelteImageResponseHeaders`.
    - Removed schema `DelteImageStatus400ResponseHeaders`.
    - Removed schema `CreateUserResponseHeaders`.
    - Removed schema `CreateUserStatus400ResponseHeaders`.
    - Removed schema `CreateTokenResponseHeaders`.
    - Removed schema `CreateTokenStatus400ResponseHeaders`.
    - Removed schema `CreateTokenStatus429ResponseHeaders`.
    - Removed schema `ListMeResponseHeaders`.
    - Removed webhook `Unwrap` (`newPlanet`).
    - Removed webhook `RequestBodySuccessCallbackUrl` (`{$request.body#/successCallbackUrl}`).
    - Removed webhook `RequestBodyFailureCallbackUrl` (`{$request.body#/failureCallbackUrl}`).

### Features

* **api:** update SDK name (+132 more changes) ([ab418b2](https://github.com/scalar/galaxy-ruby/commit/ab418b29738fa7a739dcbe538fbac68b2216c995))
* **api:** update SDK name (+133 more changes) ([95af6d9](https://github.com/scalar/galaxy-ruby/commit/95af6d947670e9819f479f0f9810eaf4590f285d))


### Chores

* **api:** regenerate SDK ([296e2fe](https://github.com/scalar/galaxy-ruby/commit/296e2fe1c8b029c13401b6f06a3aa37400b9cd7f))
* **api:** update generated SDK content ([d3cf8aa](https://github.com/scalar/galaxy-ruby/commit/d3cf8aa08ea8df077f331839be5b24fddc7bd89a))

## [0.4.0](https://github.com/scalar/galaxy-ruby/compare/v0.3.1...v0.4.0) (2026-09-15)


### ⚠ BREAKING CHANGES

* **api:** 3 breaking changes to the SDK surface.
    - Property `planet.habitabilityIndex` type changed from `number<float>` to `number<float>`.
    - Property `planet.physicalProperties` type changed from `object` to `object`.
    - Property `planet.atmosphere` type changed from `Array<object>` to `Array<object>`.

### Features

* **api:** update property planet.habitabilityIndex (+3 more changes) ([0eec358](https://github.com/scalar/galaxy-ruby/commit/0eec3582bffe0684b4396a6c2e0863ad75665b23))


### Chores

* **api:** regenerate SDK ([8d78019](https://github.com/scalar/galaxy-ruby/commit/8d7801996c969c91f4099c3fe5975bc0e65ef6c1))

## [0.3.1](https://github.com/scalar/galaxy-ruby/compare/v0.3.0...v0.3.1) (2026-08-31)


### Chores

* **api:** regenerate SDK ([c5ce746](https://github.com/scalar/galaxy-ruby/commit/c5ce74622826433d321f8b77d294f90ec9e8472a))
* **api:** update generated SDK content ([c95aaf6](https://github.com/scalar/galaxy-ruby/commit/c95aaf64ee83cd6a0b56be2e987b17df32424caa))

## [0.3.0](https://github.com/scalar/galaxy-ruby/compare/v0.2.0...v0.3.0) (2026-08-28)


### Features

* **api:** initial SDK generation ([f5c29ae](https://github.com/scalar/galaxy-ruby/commit/f5c29ae59487047b27a0bfa78927f34e2f11f3db))

## [0.2.0](https://github.com/scalar/galaxy-ruby/compare/v0.1.0...v0.2.0) (2026-08-28)


### Features

* **api:** initial SDK generation ([f5c29ae](https://github.com/scalar/galaxy-ruby/commit/f5c29ae59487047b27a0bfa78927f34e2f11f3db))
