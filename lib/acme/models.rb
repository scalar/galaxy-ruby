# frozen_string_literal: true

module Scalar
  [Scalar::Internal::Type::BaseModel, *Scalar::Internal::Type::BaseModel.subclasses].each do |cls|
    cls.define_sorbet_constant!(:OrHash) { T.type_alias { T.any(cls, Scalar::Internal::AnyHash) } }
  end

  Scalar::Internal::Util
    .walk_namespaces(Scalar::Models)
    .each do |mod|
      case mod
      in Scalar::Internal::Type::Enum | Scalar::Internal::Type::Union
        mod.constants.each do |name|
          case mod.const_get(name)
          in true | false
            mod.define_sorbet_constant!(:TaggedBoolean) { T.type_alias { T::Boolean } }
            mod.define_sorbet_constant!(:OrBoolean) { T.type_alias { T::Boolean } }
          in Integer
            mod.define_sorbet_constant!(:TaggedInteger) { T.type_alias { Integer } }
            mod.define_sorbet_constant!(:OrInteger) { T.type_alias { Integer } }
          in Float
            mod.define_sorbet_constant!(:TaggedFloat) { T.type_alias { Float } }
            mod.define_sorbet_constant!(:OrFloat) { T.type_alias { Float } }
          in Symbol
            mod.define_sorbet_constant!(:TaggedSymbol) { T.type_alias { Symbol } }
            mod.define_sorbet_constant!(:OrSymbol) { T.type_alias { T.any(Symbol, String) } }
          else
          end
        end
      else
      end
    end

  Scalar::Internal::Util
    .walk_namespaces(Scalar::Models)
    .lazy
    .grep(Scalar::Internal::Type::Union)
    .each do |mod|
      const = :Variants
      next if mod.sorbet_constant_defined?(const)

      mod.define_sorbet_constant!(const) { T.type_alias { mod.to_sorbet_type } }
    end

  AccessGroup = Scalar::Models::AccessGroup

  AuthenticationExchangePersonalTokenParams = Scalar::Models::AuthenticationExchangePersonalTokenParams

  AuthenticationListCurrentUserParams = Scalar::Models::AuthenticationListCurrentUserParams

  LoginPortalCreateParams = Scalar::Models::LoginPortalCreateParams

  LoginPortalDeleteParams = Scalar::Models::LoginPortalDeleteParams

  LoginPortalEmail = Scalar::Models::LoginPortalEmail

  LoginPortalListParams = Scalar::Models::LoginPortalListParams

  LoginPortalPage = Scalar::Models::LoginPortalPage

  LoginPortalRetrieveParams = Scalar::Models::LoginPortalRetrieveParams

  LoginPortalUpdateParams = Scalar::Models::LoginPortalUpdateParams

  ManagedDocVersion = Scalar::Models::ManagedDocVersion

  Namespace = Scalar::Models::Namespace

  NamespaceListParams = Scalar::Models::NamespaceListParams

  Nanoid = Scalar::Models::Nanoid

  RegistryCreateAPIDocumentAccessGroupParams = Scalar::Models::RegistryCreateAPIDocumentAccessGroupParams

  RegistryCreateAPIDocumentParams = Scalar::Models::RegistryCreateAPIDocumentParams

  RegistryCreateAPIDocumentVersionParams = Scalar::Models::RegistryCreateAPIDocumentVersionParams

  RegistryDeleteAPIDocumentAccessGroupParams = Scalar::Models::RegistryDeleteAPIDocumentAccessGroupParams

  RegistryDeleteAPIDocumentParams = Scalar::Models::RegistryDeleteAPIDocumentParams

  RegistryDeleteAPIDocumentVersionParams = Scalar::Models::RegistryDeleteAPIDocumentVersionParams

  RegistryListAllAPIDocumentsParams = Scalar::Models::RegistryListAllAPIDocumentsParams

  RegistryListAPIDocumentsParams = Scalar::Models::RegistryListAPIDocumentsParams

  RegistryListAPIDocumentVersionMetadataParams = Scalar::Models::RegistryListAPIDocumentVersionMetadataParams

  RegistryRetrieveAPIDocumentVersionParams = Scalar::Models::RegistryRetrieveAPIDocumentVersionParams

  RegistryUpdateAPIDocumentParams = Scalar::Models::RegistryUpdateAPIDocumentParams

  RegistryUpdateAPIDocumentVersionParams = Scalar::Models::RegistryUpdateAPIDocumentVersionParams

  RuleCreateRulesetAccessGroupParams = Scalar::Models::RuleCreateRulesetAccessGroupParams

  RuleCreateRulesetParams = Scalar::Models::RuleCreateRulesetParams

  RuleDeleteRulesetAccessGroupParams = Scalar::Models::RuleDeleteRulesetAccessGroupParams

  RuleDeleteRulesetParams = Scalar::Models::RuleDeleteRulesetParams

  RuleListRulesetsParams = Scalar::Models::RuleListRulesetsParams

  RuleRetrieveRulesetDocumentParams = Scalar::Models::RuleRetrieveRulesetDocumentParams

  RuleUpdateRulesetParams = Scalar::Models::RuleUpdateRulesetParams

  ScalarDocCreateGuideParams = Scalar::Models::ScalarDocCreateGuideParams

  ScalarDocListGuidesParams = Scalar::Models::ScalarDocListGuidesParams

  ScalarDocPublishGuideParams = Scalar::Models::ScalarDocPublishGuideParams

  SchemaCreateParams = Scalar::Models::SchemaCreateParams

  SchemaDeleteParams = Scalar::Models::SchemaDeleteParams

  SchemaListParams = Scalar::Models::SchemaListParams

  Schemas = Scalar::Models::Schemas

  SchemaUpdateParams = Scalar::Models::SchemaUpdateParams

  Slug = Scalar::Models::Slug

  TeamListParams = Scalar::Models::TeamListParams

  ThemeCreateParams = Scalar::Models::ThemeCreateParams

  ThemeDeleteParams = Scalar::Models::ThemeDeleteParams

  ThemeListParams = Scalar::Models::ThemeListParams

  ThemeReplaceDocumentParams = Scalar::Models::ThemeReplaceDocumentParams

  ThemeRetrieveParams = Scalar::Models::ThemeRetrieveParams

  ThemeUpdateParams = Scalar::Models::ThemeUpdateParams

  Timestamp = Scalar::Models::Timestamp

  UID = Scalar::Models::UID

  Value400 = Scalar::Models::Value400

  Value401 = Scalar::Models::Value401

  Value403 = Scalar::Models::Value403

  Value404 = Scalar::Models::Value404

  Value422 = Scalar::Models::Value422

  Value500 = Scalar::Models::Value500

  Version = Scalar::Models::Version
end
