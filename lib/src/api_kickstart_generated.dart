// Generated code - Do not edit manually
library;

import 'api_utils.dart';
import 'api_generated.dart' hide FusionauthClient;

// ignore_for_file: deprecated_member_use_from_same_package

/// This is a FusionAuth server. Find out more at [https://fusionauth.io](https://fusionauth.io). You need to [set up an API key](https://fusionauth.io/docs/v1/tech/apis/authentication#managing-api-keys) in the FusionAuth instance you are using to test out the API calls.
class FusionauthKickstart {
  final _client = KickstartClient();

  FusionauthKickstart();

  List<Map<String, dynamic>> get requests => _client.requests;

  /// Adds a user to an existing family. The family Id must be specified.
  void addUserToFamilyWithId(
      {required String familyId,
      String? tenantIdScope,
      required FamilyRequest body}) {
    _client.record(
      'put',
      'api/user/family/{familyId}',
      pathParameters: {
        'familyId': familyId,
      },
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Creates a family with the user Id in the request as the owner and sole
  /// member of the family. You can optionally specify an Id for the family, if
  /// not provided one will be generated.
  void createFamilyWithId(
      {required String familyId,
      String? tenantIdScope,
      required FamilyRequest body}) {
    _client.record(
      'post',
      'api/user/family/{familyId}',
      pathParameters: {
        'familyId': familyId,
      },
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Re-sends the verification email to the user. OR Re-sends the verification
  /// email to the user. If the Application has configured a specific email
  /// template this will be used instead of the tenant configuration. OR
  /// Generate a new Email Verification Id to be used with the Verify Email API.
  /// This API will not attempt to send an email to the User. This API may be
  /// used to collect the verificationId for use with a third party system.
  void updateUserVerifyEmail(
      {String? email, String? applicationId, String? sendVerifyEmail}) {
    _client.record(
      'put',
      'api/user/verify-email',
      queryParameters: {
        if (email != null) 'email': email,
        if (applicationId != null) 'applicationId': applicationId,
        if (sendVerifyEmail != null) 'sendVerifyEmail': sendVerifyEmail,
      },
    );
  }

  /// Administratively verify a user's email address. Use this method to bypass
  /// email verification for the user.  The request body will contain the userId
  /// to be verified. An API key is required when sending the userId in the
  /// request body. OR Confirms a user's email address.   The request body will
  /// contain the verificationId. You may also be required to send a one-time
  /// use code based upon your configuration. When  the tenant is configured to
  /// gate a user until their email address is verified, this procedures
  /// requires two values instead of one.  The verificationId is a high entropy
  /// value and the one-time use code is a low entropy value that is easily
  /// entered in a user interactive form. The  two values together are able to
  /// confirm a user's email address and mark the user's email address as
  /// verified.
  void createUserVerifyEmail({required VerifyEmailRequest body}) {
    _client.record(
      'post',
      'api/user/verify-email',
      body: body.toJson(),
    );
  }

  /// Handles login via third-parties including Social login, external OAuth and
  /// OpenID Connect, and other login systems.
  void identityProviderLoginWithId(
      {String? tenantIdScope, required IdentityProviderLoginRequest body}) {
    _client.record(
      'post',
      'api/identity-provider/login',
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Confirms a user's registration.   The request body will contain the
  /// verificationId. You may also be required to send a one-time use code based
  /// upon your configuration. When  the application is configured to gate a
  /// user until their registration is verified, this procedures requires two
  /// values instead of one.  The verificationId is a high entropy value and the
  /// one-time use code is a low entropy value that is easily entered in a user
  /// interactive form. The  two values together are able to confirm a user's
  /// registration and mark the user's registration as verified.
  void verifyUserRegistrationWithId({required VerifyRegistrationRequest body}) {
    _client.record(
      'post',
      'api/user/verify-registration',
      body: body.toJson(),
    );
  }

  /// Generate a new Application Registration Verification Id to be used with
  /// the Verify Registration API. This API will not attempt to send an email to
  /// the User. This API may be used to collect the verificationId for use with
  /// a third party system. OR Re-sends the application registration
  /// verification email to the user.
  void updateUserVerifyRegistration(
      {String? email, String? sendVerifyPasswordEmail, String? applicationId}) {
    _client.record(
      'put',
      'api/user/verify-registration',
      queryParameters: {
        if (email != null) 'email': email,
        if (sendVerifyPasswordEmail != null)
          'sendVerifyPasswordEmail': sendVerifyPasswordEmail,
        if (applicationId != null) 'applicationId': applicationId,
      },
    );
  }

  /// Send a passwordless authentication code in an email to complete login.
  void sendPasswordlessCodeWithId({required PasswordlessSendRequest body}) {
    _client.record(
      'post',
      'api/passwordless/send',
      body: body.toJson(),
    );
  }

  /// Creates a connector.  You can optionally specify an Id for the connector,
  /// if not provided one will be generated.
  void createConnectorWithId(
      {required String connectorId, required ConnectorRequest body}) {
    _client.record(
      'post',
      'api/connector/{connectorId}',
      pathParameters: {
        'connectorId': connectorId,
      },
      body: body.toJson(),
    );
  }

  /// Updates, via PATCH, the connector with the given Id.
  void patchConnectorWithId(
      {required String connectorId, required ConnectorRequest body}) {
    _client.record(
      'patch',
      'api/connector/{connectorId}',
      pathParameters: {
        'connectorId': connectorId,
      },
      body: body.toJson(),
    );
  }

  /// Updates the connector with the given Id.
  void updateConnectorWithId(
      {required String connectorId, required ConnectorRequest body}) {
    _client.record(
      'put',
      'api/connector/{connectorId}',
      pathParameters: {
        'connectorId': connectorId,
      },
      body: body.toJson(),
    );
  }

  /// Creates a connector.  You can optionally specify an Id for the connector,
  /// if not provided one will be generated.
  void createConnector({required ConnectorRequest body}) {
    _client.record(
      'post',
      'api/connector',
      body: body.toJson(),
    );
  }

  /// Reactivates the user action with the given Id. OR Updates the user action
  /// with the given Id.
  void updateUserActionWithId(
      {String? reactivate,
      required String userActionId,
      String? tenantIdScope,
      required UserActionRequest body}) {
    _client.record(
      'put',
      'api/user-action/{userActionId}',
      pathParameters: {
        'userActionId': userActionId,
      },
      queryParameters: {
        if (reactivate != null) 'reactivate': reactivate,
      },
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Updates, via PATCH, the user action with the given Id.
  void patchUserActionWithId(
      {required String userActionId,
      String? tenantIdScope,
      required UserActionRequest body}) {
    _client.record(
      'patch',
      'api/user-action/{userActionId}',
      pathParameters: {
        'userActionId': userActionId,
      },
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Creates a user action. This action cannot be taken on a user until this
  /// call successfully returns. Anytime after that the user action can be
  /// applied to any user.
  void createUserActionWithId(
      {required String userActionId,
      String? tenantIdScope,
      required UserActionRequest body}) {
    _client.record(
      'post',
      'api/user-action/{userActionId}',
      pathParameters: {
        'userActionId': userActionId,
      },
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Creates an IP Access Control List. You can optionally specify an Id on
  /// this create request, if one is not provided one will be generated.
  void createIPAccessControlListWithId(
      {required String accessControlListId,
      required IPAccessControlListRequest body}) {
    _client.record(
      'post',
      'api/ip-acl/{accessControlListId}',
      pathParameters: {
        'accessControlListId': accessControlListId,
      },
      body: body.toJson(),
    );
  }

  /// Updates the IP Access Control List with the given Id.
  void updateIPAccessControlListWithId(
      {required String accessControlListId,
      required IPAccessControlListRequest body}) {
    _client.record(
      'put',
      'api/ip-acl/{accessControlListId}',
      pathParameters: {
        'accessControlListId': accessControlListId,
      },
      body: body.toJson(),
    );
  }

  /// Creates an IP Access Control List. You can optionally specify an Id on
  /// this create request, if one is not provided one will be generated.
  void createIPAccessControlList({required IPAccessControlListRequest body}) {
    _client.record(
      'post',
      'api/ip-acl',
      body: body.toJson(),
    );
  }

  /// Sends out an email to a parent that they need to register and create a
  /// family or need to log in and add a child to their existing family.
  void sendFamilyRequestEmailWithId({required FamilyEmailRequest body}) {
    _client.record(
      'post',
      'api/user/family/request',
      body: body.toJson(),
    );
  }

  /// Takes an action on a user. The user being actioned is called the
  /// "actionee" and the user taking the action is called the "actioner". Both
  /// user ids are required in the request object.
  void actionUserWithId({required ActionRequest body}) {
    _client.record(
      'post',
      'api/user/action',
      body: body.toJson(),
    );
  }

  /// Creates a webhook. You can optionally specify an Id for the webhook, if
  /// not provided one will be generated.
  void createWebhookWithId(
      {required String webhookId, required WebhookRequest body}) {
    _client.record(
      'post',
      'api/webhook/{webhookId}',
      pathParameters: {
        'webhookId': webhookId,
      },
      body: body.toJson(),
    );
  }

  /// Updates the webhook with the given Id.
  void updateWebhookWithId(
      {required String webhookId, required WebhookRequest body}) {
    _client.record(
      'put',
      'api/webhook/{webhookId}',
      pathParameters: {
        'webhookId': webhookId,
      },
      body: body.toJson(),
    );
  }

  /// Creates a webhook. You can optionally specify an Id for the webhook, if
  /// not provided one will be generated.
  void createWebhook({required WebhookRequest body}) {
    _client.record(
      'post',
      'api/webhook',
      body: body.toJson(),
    );
  }

  /// Creates a Lambda. You can optionally specify an Id for the lambda, if not
  /// provided one will be generated.
  void createLambdaWithId(
      {required String lambdaId, required LambdaRequest body}) {
    _client.record(
      'post',
      'api/lambda/{lambdaId}',
      pathParameters: {
        'lambdaId': lambdaId,
      },
      body: body.toJson(),
    );
  }

  /// Updates the lambda with the given Id.
  void updateLambdaWithId(
      {required String lambdaId, required LambdaRequest body}) {
    _client.record(
      'put',
      'api/lambda/{lambdaId}',
      pathParameters: {
        'lambdaId': lambdaId,
      },
      body: body.toJson(),
    );
  }

  /// Updates, via PATCH, the lambda with the given Id.
  void patchLambdaWithId(
      {required String lambdaId, required LambdaRequest body}) {
    _client.record(
      'patch',
      'api/lambda/{lambdaId}',
      pathParameters: {
        'lambdaId': lambdaId,
      },
      body: body.toJson(),
    );
  }

  /// Creates a user. You can optionally specify an Id for the user, if not
  /// provided one will be generated.
  void createUser({String? tenantIdScope, required UserRequest body}) {
    _client.record(
      'post',
      'api/user',
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Start a passwordless login request by generating a passwordless code. This
  /// code can be sent to the User using the Send Passwordless Code API or using
  /// a mechanism outside of FusionAuth. The passwordless login is completed by
  /// using the Passwordless Login API with this code.
  void startPasswordlessLoginWithId({required PasswordlessStartRequest body}) {
    _client.record(
      'post',
      'api/passwordless/start',
      body: body.toJson(),
    );
  }

  /// Creates a new role for an application. You must specify the Id of the
  /// application you are creating the role for. You can optionally specify an
  /// Id for the role inside the ApplicationRole object itself, if not provided
  /// one will be generated.
  void createApplicationRoleWithId(
      {required String applicationId,
      required String roleId,
      String? tenantIdScope,
      required ApplicationRequest body}) {
    _client.record(
      'post',
      'api/application/{applicationId}/role/{roleId}',
      pathParameters: {
        'applicationId': applicationId,
        'roleId': roleId,
      },
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Updates the application role with the given Id for the application.
  void updateApplicationRoleWithId(
      {required String applicationId,
      required String roleId,
      String? tenantIdScope,
      required ApplicationRequest body}) {
    _client.record(
      'put',
      'api/application/{applicationId}/role/{roleId}',
      pathParameters: {
        'applicationId': applicationId,
        'roleId': roleId,
      },
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Updates, via PATCH, the application role with the given Id for the
  /// application.
  void patchApplicationRoleWithId(
      {required String applicationId,
      required String roleId,
      String? tenantIdScope,
      required ApplicationRequest body}) {
    _client.record(
      'patch',
      'api/application/{applicationId}/role/{roleId}',
      pathParameters: {
        'applicationId': applicationId,
        'roleId': roleId,
      },
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Creates a new role for an application. You must specify the Id of the
  /// application you are creating the role for. You can optionally specify an
  /// Id for the role inside the ApplicationRole object itself, if not provided
  /// one will be generated.
  void createApplicationRole(
      {required String applicationId,
      String? tenantIdScope,
      required ApplicationRequest body}) {
    _client.record(
      'post',
      'api/application/{applicationId}/role',
      pathParameters: {
        'applicationId': applicationId,
      },
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Updates, via PATCH, the custom OAuth scope with the given Id for the
  /// application.
  void patchOAuthScopeWithId(
      {required String applicationId,
      required String scopeId,
      String? tenantIdScope,
      required ApplicationOAuthScopeRequest body}) {
    _client.record(
      'patch',
      'api/application/{applicationId}/scope/{scopeId}',
      pathParameters: {
        'applicationId': applicationId,
        'scopeId': scopeId,
      },
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Updates the OAuth scope with the given Id for the application.
  void updateOAuthScopeWithId(
      {required String applicationId,
      required String scopeId,
      String? tenantIdScope,
      required ApplicationOAuthScopeRequest body}) {
    _client.record(
      'put',
      'api/application/{applicationId}/scope/{scopeId}',
      pathParameters: {
        'applicationId': applicationId,
        'scopeId': scopeId,
      },
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Creates a new custom OAuth scope for an application. You must specify the
  /// Id of the application you are creating the scope for. You can optionally
  /// specify an Id for the OAuth scope on the URL, if not provided one will be
  /// generated.
  void createOAuthScopeWithId(
      {required String applicationId,
      required String scopeId,
      String? tenantIdScope,
      required ApplicationOAuthScopeRequest body}) {
    _client.record(
      'post',
      'api/application/{applicationId}/scope/{scopeId}',
      pathParameters: {
        'applicationId': applicationId,
        'scopeId': scopeId,
      },
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// The Logout API is intended to be used to remove the refresh token and
  /// access token cookies if they exist on the client and revoke the refresh
  /// token stored. This API does nothing if the request does not contain an
  /// access token or refresh token cookies. OR The Logout API is intended to be
  /// used to remove the refresh token and access token cookies if they exist on
  /// the client and revoke the refresh token stored. This API takes the refresh
  /// token in the JSON body.
  void createLogout(
      {String? global, String? refreshToken, required LogoutRequest body}) {
    _client.record(
      'post',
      'api/logout',
      queryParameters: {
        if (global != null) 'global': global,
        if (refreshToken != null) 'refreshToken': refreshToken,
      },
      body: body.toJson(),
    );
  }

  /// Creates an API key. You can optionally specify a unique Id for the key, if
  /// not provided one will be generated. an API key can only be created with
  /// equal or lesser authority. An API key cannot create another API key unless
  /// it is granted  to that API key.  If an API key is locked to a tenant, it
  /// can only create API Keys for that same tenant. OR Updates an
  /// authentication API key by given id
  void createApiKeyWithId(
      {required String keyId, required APIKeyRequest body}) {
    _client.record(
      'post',
      'api/api-key/{keyId}',
      pathParameters: {
        'keyId': keyId,
      },
      body: body.toJson(),
    );
  }

  /// Creates a Lambda. You can optionally specify an Id for the lambda, if not
  /// provided one will be generated.
  void createLambda({required LambdaRequest body}) {
    _client.record(
      'post',
      'api/lambda',
      body: body.toJson(),
    );
  }

  /// Creates a messenger.  You can optionally specify an Id for the messenger,
  /// if not provided one will be generated.
  void createMessengerWithId(
      {required String messengerId, required MessengerRequest body}) {
    _client.record(
      'post',
      'api/messenger/{messengerId}',
      pathParameters: {
        'messengerId': messengerId,
      },
      body: body.toJson(),
    );
  }

  /// Updates, via PATCH, the messenger with the given Id.
  void patchMessengerWithId(
      {required String messengerId, required MessengerRequest body}) {
    _client.record(
      'patch',
      'api/messenger/{messengerId}',
      pathParameters: {
        'messengerId': messengerId,
      },
      body: body.toJson(),
    );
  }

  /// Updates the messenger with the given Id.
  void updateMessengerWithId(
      {required String messengerId, required MessengerRequest body}) {
    _client.record(
      'put',
      'api/messenger/{messengerId}',
      pathParameters: {
        'messengerId': messengerId,
      },
      body: body.toJson(),
    );
  }

  /// Creates a messenger.  You can optionally specify an Id for the messenger,
  /// if not provided one will be generated.
  void createMessenger({required MessengerRequest body}) {
    _client.record(
      'post',
      'api/messenger',
      body: body.toJson(),
    );
  }

  /// Updates, via PATCH, the Entity Type with the given Id.
  void patchEntityTypeWithId(
      {required String entityTypeId, required EntityTypeRequest body}) {
    _client.record(
      'patch',
      'api/entity/type/{entityTypeId}',
      pathParameters: {
        'entityTypeId': entityTypeId,
      },
      body: body.toJson(),
    );
  }

  /// Updates the Entity Type with the given Id.
  void updateEntityTypeWithId(
      {required String entityTypeId, required EntityTypeRequest body}) {
    _client.record(
      'put',
      'api/entity/type/{entityTypeId}',
      pathParameters: {
        'entityTypeId': entityTypeId,
      },
      body: body.toJson(),
    );
  }

  /// Creates a Entity Type. You can optionally specify an Id for the Entity
  /// Type, if not provided one will be generated.
  void createEntityTypeWithId(
      {required String entityTypeId, required EntityTypeRequest body}) {
    _client.record(
      'post',
      'api/entity/type/{entityTypeId}',
      pathParameters: {
        'entityTypeId': entityTypeId,
      },
      body: body.toJson(),
    );
  }

  /// Link an external user from a 3rd party identity provider to a FusionAuth
  /// user.
  void createUserLinkWithId({required IdentityProviderLinkRequest body}) {
    _client.record(
      'post',
      'api/identity-provider/link',
      body: body.toJson(),
    );
  }

  /// Updates, via PATCH, the consent with the given Id.
  void patchConsentWithId(
      {required String consentId,
      String? tenantIdScope,
      required ConsentRequest body}) {
    _client.record(
      'patch',
      'api/consent/{consentId}',
      pathParameters: {
        'consentId': consentId,
      },
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Creates a user consent type. You can optionally specify an Id for the
  /// consent type, if not provided one will be generated.
  void createConsentWithId(
      {required String consentId,
      String? tenantIdScope,
      required ConsentRequest body}) {
    _client.record(
      'post',
      'api/consent/{consentId}',
      pathParameters: {
        'consentId': consentId,
      },
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Updates the consent with the given Id.
  void updateConsentWithId(
      {required String consentId,
      String? tenantIdScope,
      required ConsentRequest body}) {
    _client.record(
      'put',
      'api/consent/{consentId}',
      pathParameters: {
        'consentId': consentId,
      },
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Creates a form.  You can optionally specify an Id for the form, if not
  /// provided one will be generated.
  void createFormWithId({required String formId, required FormRequest body}) {
    _client.record(
      'post',
      'api/form/{formId}',
      pathParameters: {
        'formId': formId,
      },
      body: body.toJson(),
    );
  }

  /// Updates the form with the given Id.
  void updateFormWithId({required String formId, required FormRequest body}) {
    _client.record(
      'put',
      'api/form/{formId}',
      pathParameters: {
        'formId': formId,
      },
      body: body.toJson(),
    );
  }

  /// Creates a form.  You can optionally specify an Id for the form, if not
  /// provided one will be generated.
  void createForm({required FormRequest body}) {
    _client.record(
      'post',
      'api/form',
      body: body.toJson(),
    );
  }

  /// Modifies a temporal user action by changing the expiration of the action
  /// and optionally adding a comment to the action.
  void modifyActionWithId(
      {required String actionId, required ActionRequest body}) {
    _client.record(
      'put',
      'api/user/action/{actionId}',
      pathParameters: {
        'actionId': actionId,
      },
      body: body.toJson(),
    );
  }

  /// Exchange a refresh token for a new JWT.
  void exchangeRefreshTokenForJWTWithId({required RefreshRequest body}) {
    _client.record(
      'post',
      'api/jwt/refresh',
      body: body.toJson(),
    );
  }

  /// Searches group members with the specified criteria and pagination.
  void searchGroupMembersWithId({required GroupMemberSearchRequest body}) {
    _client.record(
      'post',
      'api/group/member/search',
      body: body.toJson(),
    );
  }

  /// Inspect an access token issued as the result of the User based grant such
  /// as the Authorization Code Grant, Implicit Grant, the User Credentials
  /// Grant or the Refresh Grant. OR Inspect an access token issued as the
  /// result of the Client Credentials Grant.
  void createIntrospect() {
    _client.record(
      'post',
      'oauth2/introspect',
    );
  }

  /// Retrieves the users for the given search criteria and pagination.
  void searchUsersByQueryWithId({required SearchRequest body}) {
    _client.record(
      'post',
      'api/user/search',
      body: body.toJson(),
    );
  }

  /// Reactivates the user with the given Id. OR Updates the user with the given
  /// Id.
  void updateUserWithId(
      {String? reactivate,
      required String userId,
      String? tenantIdScope,
      required UserRequest body}) {
    _client.record(
      'put',
      'api/user/{userId}',
      pathParameters: {
        'userId': userId,
      },
      queryParameters: {
        if (reactivate != null) 'reactivate': reactivate,
      },
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Creates a user. You can optionally specify an Id for the user, if not
  /// provided one will be generated.
  void createUserWithId(
      {required String userId,
      String? tenantIdScope,
      required UserRequest body}) {
    _client.record(
      'post',
      'api/user/{userId}',
      pathParameters: {
        'userId': userId,
      },
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Updates, via PATCH, the user with the given Id.
  void patchUserWithId(
      {required String userId,
      String? tenantIdScope,
      required UserRequest body}) {
    _client.record(
      'patch',
      'api/user/{userId}',
      pathParameters: {
        'userId': userId,
      },
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Enable two-factor authentication for a user.
  void enableTwoFactorWithId(
      {required String userId, required TwoFactorRequest body}) {
    _client.record(
      'post',
      'api/user/two-factor/{userId}',
      pathParameters: {
        'userId': userId,
      },
      body: body.toJson(),
    );
  }

  /// Send a Two Factor authentication code to allow the completion of Two
  /// Factor authentication.
  void sendTwoFactorCodeForLoginUsingMethodWithId(
      {required String twoFactorId, required TwoFactorSendRequest body}) {
    _client.record(
      'post',
      'api/two-factor/send/{twoFactorId}',
      pathParameters: {
        'twoFactorId': twoFactorId,
      },
      body: body.toJson(),
    );
  }

  /// Searches applications with the specified criteria and pagination.
  void searchApplicationsWithId({required ApplicationSearchRequest body}) {
    _client.record(
      'post',
      'api/application/search',
      body: body.toJson(),
    );
  }

  /// Updates, via PATCH, the application with the given Id.
  void patchApplicationWithId(
      {required String applicationId,
      String? tenantIdScope,
      required ApplicationRequest body}) {
    _client.record(
      'patch',
      'api/application/{applicationId}',
      pathParameters: {
        'applicationId': applicationId,
      },
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Creates an application. You can optionally specify an Id for the
  /// application, if not provided one will be generated.
  void createApplicationWithId(
      {required String applicationId,
      String? tenantIdScope,
      required ApplicationRequest body}) {
    _client.record(
      'post',
      'api/application/{applicationId}',
      pathParameters: {
        'applicationId': applicationId,
      },
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Updates the application with the given Id. OR Reactivates the application
  /// with the given Id.
  void updateApplicationWithId(
      {required String applicationId,
      String? tenantIdScope,
      String? reactivate,
      required ApplicationRequest body}) {
    _client.record(
      'put',
      'api/application/{applicationId}',
      pathParameters: {
        'applicationId': applicationId,
      },
      queryParameters: {
        if (reactivate != null) 'reactivate': reactivate,
      },
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Updates the Entity with the given Id.
  void updateEntityWithId(
      {required String entityId,
      String? tenantIdScope,
      required EntityRequest body}) {
    _client.record(
      'put',
      'api/entity/{entityId}',
      pathParameters: {
        'entityId': entityId,
      },
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Creates an Entity. You can optionally specify an Id for the Entity. If not
  /// provided one will be generated.
  void createEntityWithId(
      {required String entityId,
      String? tenantIdScope,
      required EntityRequest body}) {
    _client.record(
      'post',
      'api/entity/{entityId}',
      pathParameters: {
        'entityId': entityId,
      },
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Updates the theme with the given Id.
  void updateThemeWithId(
      {required String themeId, required ThemeRequest body}) {
    _client.record(
      'put',
      'api/theme/{themeId}',
      pathParameters: {
        'themeId': themeId,
      },
      body: body.toJson(),
    );
  }

  /// Creates a Theme. You can optionally specify an Id for the theme, if not
  /// provided one will be generated.
  void createThemeWithId(
      {required String themeId, required ThemeRequest body}) {
    _client.record(
      'post',
      'api/theme/{themeId}',
      pathParameters: {
        'themeId': themeId,
      },
      body: body.toJson(),
    );
  }

  /// Updates, via PATCH, the theme with the given Id.
  void patchThemeWithId({required String themeId, required ThemeRequest body}) {
    _client.record(
      'patch',
      'api/theme/{themeId}',
      pathParameters: {
        'themeId': themeId,
      },
      body: body.toJson(),
    );
  }

  /// Searches the login records with the specified criteria and pagination.
  void searchLoginRecordsWithId({required LoginRecordSearchRequest body}) {
    _client.record(
      'post',
      'api/system/login-record/search',
      body: body.toJson(),
    );
  }

  /// Updates, via PATCH, the user action reason with the given Id.
  void patchUserActionReasonWithId(
      {required String userActionReasonId,
      required UserActionReasonRequest body}) {
    _client.record(
      'patch',
      'api/user-action-reason/{userActionReasonId}',
      pathParameters: {
        'userActionReasonId': userActionReasonId,
      },
      body: body.toJson(),
    );
  }

  /// Updates the user action reason with the given Id.
  void updateUserActionReasonWithId(
      {required String userActionReasonId,
      required UserActionReasonRequest body}) {
    _client.record(
      'put',
      'api/user-action-reason/{userActionReasonId}',
      pathParameters: {
        'userActionReasonId': userActionReasonId,
      },
      body: body.toJson(),
    );
  }

  /// Creates a user reason. This user action reason cannot be used when
  /// actioning a user until this call completes successfully. Anytime after
  /// that the user action reason can be used.
  void createUserActionReasonWithId(
      {required String userActionReasonId,
      required UserActionReasonRequest body}) {
    _client.record(
      'post',
      'api/user-action-reason/{userActionReasonId}',
      pathParameters: {
        'userActionReasonId': userActionReasonId,
      },
      body: body.toJson(),
    );
  }

  /// Import a WebAuthn credential
  void importWebAuthnCredentialWithId(
      {required WebAuthnCredentialImportRequest body}) {
    _client.record(
      'post',
      'api/webauthn/import',
      body: body.toJson(),
    );
  }

  /// Updates the email template with the given Id.
  void updateEmailTemplateWithId(
      {required String emailTemplateId,
      String? tenantIdScope,
      required EmailTemplateRequest body}) {
    _client.record(
      'put',
      'api/email/template/{emailTemplateId}',
      pathParameters: {
        'emailTemplateId': emailTemplateId,
      },
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Updates, via PATCH, the email template with the given Id.
  void patchEmailTemplateWithId(
      {required String emailTemplateId,
      String? tenantIdScope,
      required EmailTemplateRequest body}) {
    _client.record(
      'patch',
      'api/email/template/{emailTemplateId}',
      pathParameters: {
        'emailTemplateId': emailTemplateId,
      },
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Creates an email template. You can optionally specify an Id for the
  /// template, if not provided one will be generated.
  void createEmailTemplateWithId(
      {required String emailTemplateId,
      String? tenantIdScope,
      required EmailTemplateRequest body}) {
    _client.record(
      'post',
      'api/email/template/{emailTemplateId}',
      pathParameters: {
        'emailTemplateId': emailTemplateId,
      },
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Creates an email template. You can optionally specify an Id for the
  /// template, if not provided one will be generated.
  void createEmailTemplate(
      {String? tenantIdScope, required EmailTemplateRequest body}) {
    _client.record(
      'post',
      'api/email/template',
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Updates, via PATCH, the tenant with the given Id.
  void patchTenantWithId(
      {required String tenantId,
      String? tenantIdScope,
      required TenantRequest body}) {
    _client.record(
      'patch',
      'api/tenant/{tenantId}',
      pathParameters: {
        'tenantId': tenantId,
      },
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Updates the tenant with the given Id.
  void updateTenantWithId(
      {required String tenantId,
      String? tenantIdScope,
      required TenantRequest body}) {
    _client.record(
      'put',
      'api/tenant/{tenantId}',
      pathParameters: {
        'tenantId': tenantId,
      },
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Creates a tenant. You can optionally specify an Id for the tenant, if not
  /// provided one will be generated.
  void createTenantWithId(
      {required String tenantId,
      String? tenantIdScope,
      required TenantRequest body}) {
    _client.record(
      'post',
      'api/tenant/{tenantId}',
      pathParameters: {
        'tenantId': tenantId,
      },
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Changes a user's password using their identity (loginId and password).
  /// Using a loginId instead of the changePasswordId bypasses the email
  /// verification and allows a password to be changed directly without first
  /// calling the #forgotPassword method.
  void changePasswordByIdentityWithId({required ChangePasswordRequest body}) {
    _client.record(
      'post',
      'api/user/change-password',
      body: body.toJson(),
    );
  }

  /// Updates the key with the given Id.
  void updateKeyWithId({required String keyId, required KeyRequest body}) {
    _client.record(
      'put',
      'api/key/{keyId}',
      pathParameters: {
        'keyId': keyId,
      },
      body: body.toJson(),
    );
  }

  /// Creates a single User consent.
  void createUserConsentWithId(
      {required String userConsentId, required UserConsentRequest body}) {
    _client.record(
      'post',
      'api/user/consent/{userConsentId}',
      pathParameters: {
        'userConsentId': userConsentId,
      },
      body: body.toJson(),
    );
  }

  /// Updates a single User consent by Id.
  void updateUserConsentWithId(
      {required String userConsentId, required UserConsentRequest body}) {
    _client.record(
      'put',
      'api/user/consent/{userConsentId}',
      pathParameters: {
        'userConsentId': userConsentId,
      },
      body: body.toJson(),
    );
  }

  /// Updates, via PATCH, a single User consent by Id.
  void patchUserConsentWithId(
      {required String userConsentId, required UserConsentRequest body}) {
    _client.record(
      'patch',
      'api/user/consent/{userConsentId}',
      pathParameters: {
        'userConsentId': userConsentId,
      },
      body: body.toJson(),
    );
  }

  /// Creates a family with the user Id in the request as the owner and sole
  /// member of the family. You can optionally specify an Id for the family, if
  /// not provided one will be generated.
  void createFamily({String? tenantIdScope, required FamilyRequest body}) {
    _client.record(
      'post',
      'api/user/family',
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Updates, via PATCH, the available integrations.
  void patchIntegrationsWithId({required IntegrationRequest body}) {
    _client.record(
      'patch',
      'api/integration',
      body: body.toJson(),
    );
  }

  /// Updates the available integrations.
  void updateIntegrationsWithId({required IntegrationRequest body}) {
    _client.record(
      'put',
      'api/integration',
      body: body.toJson(),
    );
  }

  /// Creates a single User consent.
  void createUserConsent({required UserConsentRequest body}) {
    _client.record(
      'post',
      'api/user/consent',
      body: body.toJson(),
    );
  }

  /// Searches tenants with the specified criteria and pagination.
  void searchTenantsWithId({required TenantSearchRequest body}) {
    _client.record(
      'post',
      'api/tenant/search',
      body: body.toJson(),
    );
  }

  /// Updates the registration for the user with the given Id and the
  /// application defined in the request.
  void updateRegistrationWithId(
      {required String userId,
      String? tenantIdScope,
      required RegistrationRequest body}) {
    _client.record(
      'put',
      'api/user/registration/{userId}',
      pathParameters: {
        'userId': userId,
      },
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Registers a user for an application. If you provide the User and the
  /// UserRegistration object on this request, it will create the user as well
  /// as register them for the application. This is called a Full Registration.
  /// However, if you only provide the UserRegistration object, then the user
  /// must already exist and they will be registered for the application. The
  /// user Id can also be provided and it will either be used to look up an
  /// existing user or it will be used for the newly created User.
  void registerWithId(
      {required String userId,
      String? tenantIdScope,
      required RegistrationRequest body}) {
    _client.record(
      'post',
      'api/user/registration/{userId}',
      pathParameters: {
        'userId': userId,
      },
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Updates, via PATCH, the registration for the user with the given Id and
  /// the application defined in the request.
  void patchRegistrationWithId(
      {required String userId,
      String? tenantIdScope,
      required RegistrationRequest body}) {
    _client.record(
      'patch',
      'api/user/registration/{userId}',
      pathParameters: {
        'userId': userId,
      },
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Exchanges an OAuth authorization code and code_verifier for an access
  /// token. Makes a request to the Token endpoint to exchange the authorization
  /// code returned from the Authorize endpoint and a code_verifier for an
  /// access token. OR Make a Client Credentials grant request to obtain an
  /// access token. OR Exchange a Refresh Token for an Access Token. If you will
  /// be using the Refresh Token Grant, you will make a request to the Token
  /// endpoint to exchange the user’s refresh token for an access token. OR
  /// Exchange User Credentials for a Token. If you will be using the Resource
  /// Owner Password Credential Grant, you will make a request to the Token
  /// endpoint to exchange the user’s email and password for an access token. OR
  /// Exchanges an OAuth authorization code for an access token. Makes a request
  /// to the Token endpoint to exchange the authorization code returned from the
  /// Authorize endpoint for an access token.
  void createToken() {
    _client.record(
      'post',
      'oauth2/token',
    );
  }

  /// Searches the IP Access Control Lists with the specified criteria and
  /// pagination.
  void searchIPAccessControlListsWithId(
      {required IPAccessControlListSearchRequest body}) {
    _client.record(
      'post',
      'api/ip-acl/search',
      body: body.toJson(),
    );
  }

  /// Start a WebAuthn authentication ceremony by generating a new challenge for
  /// the user
  void startWebAuthnLoginWithId({required WebAuthnStartRequest body}) {
    _client.record(
      'post',
      'api/webauthn/start',
      body: body.toJson(),
    );
  }

  /// Updates, via PATCH, the group with the given Id.
  void patchGroupWithId(
      {required String groupId,
      String? tenantIdScope,
      required GroupRequest body}) {
    _client.record(
      'patch',
      'api/group/{groupId}',
      pathParameters: {
        'groupId': groupId,
      },
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Creates a group. You can optionally specify an Id for the group, if not
  /// provided one will be generated.
  void createGroupWithId(
      {required String groupId,
      String? tenantIdScope,
      required GroupRequest body}) {
    _client.record(
      'post',
      'api/group/{groupId}',
      pathParameters: {
        'groupId': groupId,
      },
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Updates the group with the given Id.
  void updateGroupWithId(
      {required String groupId,
      String? tenantIdScope,
      required GroupRequest body}) {
    _client.record(
      'put',
      'api/group/{groupId}',
      pathParameters: {
        'groupId': groupId,
      },
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Begins the forgot password sequence, which kicks off an email to the user
  /// so that they can reset their password.
  void forgotPasswordWithId({required ForgotPasswordRequest body}) {
    _client.record(
      'post',
      'api/user/forgot-password',
      body: body.toJson(),
    );
  }

  /// Creates an audit log with the message and user name (usually an email).
  /// Audit logs should be written anytime you make changes to the FusionAuth
  /// database. When using the FusionAuth App web interface, any changes are
  /// automatically written to the audit log. However, if you are accessing the
  /// API, you must write the audit logs yourself.
  void createAuditLogWithId({required AuditLogRequest body}) {
    _client.record(
      'post',
      'api/system/audit-log',
      body: body.toJson(),
    );
  }

  /// Creates a preview of the message template provided in the request,
  /// normalized to a given locale.
  void retrieveMessageTemplatePreviewWithId(
      {required PreviewMessageTemplateRequest body}) {
    _client.record(
      'post',
      'api/message/template/preview',
      body: body.toJson(),
    );
  }

  /// Updates, via PATCH, the message template with the given Id.
  void patchMessageTemplateWithId(
      {required String messageTemplateId,
      required MessageTemplateRequest body}) {
    _client.record(
      'patch',
      'api/message/template/{messageTemplateId}',
      pathParameters: {
        'messageTemplateId': messageTemplateId,
      },
      body: body.toJson(),
    );
  }

  /// Updates the message template with the given Id.
  void updateMessageTemplateWithId(
      {required String messageTemplateId,
      required MessageTemplateRequest body}) {
    _client.record(
      'put',
      'api/message/template/{messageTemplateId}',
      pathParameters: {
        'messageTemplateId': messageTemplateId,
      },
      body: body.toJson(),
    );
  }

  /// Creates an message template. You can optionally specify an Id for the
  /// template, if not provided one will be generated.
  void createMessageTemplateWithId(
      {required String messageTemplateId,
      required MessageTemplateRequest body}) {
    _client.record(
      'post',
      'api/message/template/{messageTemplateId}',
      pathParameters: {
        'messageTemplateId': messageTemplateId,
      },
      body: body.toJson(),
    );
  }

  /// Creates an message template. You can optionally specify an Id for the
  /// template, if not provided one will be generated.
  void createMessageTemplate({required MessageTemplateRequest body}) {
    _client.record(
      'post',
      'api/message/template',
      body: body.toJson(),
    );
  }

  /// Creates a Theme. You can optionally specify an Id for the theme, if not
  /// provided one will be generated.
  void createTheme({required ThemeRequest body}) {
    _client.record(
      'post',
      'api/theme',
      body: body.toJson(),
    );
  }

  /// Creates a member in a group.
  void createGroupMembersWithId({required MemberRequest body}) {
    _client.record(
      'post',
      'api/group/member',
      body: body.toJson(),
    );
  }

  /// Creates a member in a group.
  void updateGroupMembersWithId({required MemberRequest body}) {
    _client.record(
      'put',
      'api/group/member',
      body: body.toJson(),
    );
  }

  /// Sends a ping to FusionAuth indicating that the user was automatically
  /// logged into an application. When using FusionAuth's SSO or your own, you
  /// should call this if the user is already logged in centrally, but accesses
  /// an application where they no longer have a session. This helps correctly
  /// track login counts, times and helps with reporting.
  void loginPingWithRequestWithId(
      {String? tenantIdScope, required LoginPingRequest body}) {
    _client.record(
      'put',
      'api/login',
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Authenticates a user to FusionAuth.   This API optionally requires an API
  /// key. See `Application.loginConfiguration.requireAuthentication`.
  void loginWithId({String? tenantIdScope, required LoginRequest body}) {
    _client.record(
      'post',
      'api/login',
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Updates, via PATCH, the identity provider with the given Id.
  void patchIdentityProviderWithId(
      {required String identityProviderId,
      required IdentityProviderRequest body}) {
    _client.record(
      'patch',
      'api/identity-provider/{identityProviderId}',
      pathParameters: {
        'identityProviderId': identityProviderId,
      },
      body: body.toJson(),
    );
  }

  /// Creates an identity provider. You can optionally specify an Id for the
  /// identity provider, if not provided one will be generated.
  void createIdentityProviderWithId(
      {required String identityProviderId,
      required IdentityProviderRequest body}) {
    _client.record(
      'post',
      'api/identity-provider/{identityProviderId}',
      pathParameters: {
        'identityProviderId': identityProviderId,
      },
      body: body.toJson(),
    );
  }

  /// Updates the identity provider with the given Id.
  void updateIdentityProviderWithId(
      {required String identityProviderId,
      required IdentityProviderRequest body}) {
    _client.record(
      'put',
      'api/identity-provider/{identityProviderId}',
      pathParameters: {
        'identityProviderId': identityProviderId,
      },
      body: body.toJson(),
    );
  }

  /// Complete a login request using a passwordless code
  void passwordlessLoginWithId({required PasswordlessLoginRequest body}) {
    _client.record(
      'post',
      'api/passwordless/login',
      body: body.toJson(),
    );
  }

  /// Updates an API key by given id
  void updateAPIKeyWithId(
      {required String apiKeyId, required APIKeyRequest body}) {
    _client.record(
      'put',
      'api/api-key/{apiKeyId}',
      pathParameters: {
        'apiKeyId': apiKeyId,
      },
      body: body.toJson(),
    );
  }

  /// Updates the system configuration.
  void updateSystemConfigurationWithId(
      {required SystemConfigurationRequest body}) {
    _client.record(
      'put',
      'api/system-configuration',
      body: body.toJson(),
    );
  }

  /// Updates, via PATCH, the system configuration.
  void patchSystemConfigurationWithId(
      {required SystemConfigurationRequest body}) {
    _client.record(
      'patch',
      'api/system-configuration',
      body: body.toJson(),
    );
  }

  /// Changes a user's password using the change password Id. This usually
  /// occurs after an email has been sent to the user and they clicked on a link
  /// to reset their password.  As of version 1.32.2, prefer sending the
  /// changePasswordId in the request body. To do this, omit the first
  /// parameter, and set the value in the request body.
  void changePasswordWithId(
      {required String changePasswordId, required ChangePasswordRequest body}) {
    _client.record(
      'post',
      'api/user/change-password/{changePasswordId}',
      pathParameters: {
        'changePasswordId': changePasswordId,
      },
      body: body.toJson(),
    );
  }

  /// Creates an API key. You can optionally specify a unique Id for the key, if
  /// not provided one will be generated. an API key can only be created with
  /// equal or lesser authority. An API key cannot create another API key unless
  /// it is granted  to that API key.  If an API key is locked to a tenant, it
  /// can only create API Keys for that same tenant.
  void createAPIKey({required APIKeyRequest body}) {
    _client.record(
      'post',
      'api/api-key',
      body: body.toJson(),
    );
  }

  /// Creates an application. You can optionally specify an Id for the
  /// application, if not provided one will be generated.
  void createApplication(
      {String? tenantIdScope, required ApplicationRequest body}) {
    _client.record(
      'post',
      'api/application',
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Searches email templates with the specified criteria and pagination.
  void searchEmailTemplatesWithId({required EmailTemplateSearchRequest body}) {
    _client.record(
      'post',
      'api/email/template/search',
      body: body.toJson(),
    );
  }

  /// Searches webhooks with the specified criteria and pagination.
  void searchWebhooksWithId({required WebhookSearchRequest body}) {
    _client.record(
      'post',
      'api/webhook/search',
      body: body.toJson(),
    );
  }

  /// Complete a WebAuthn authentication ceremony by validating the signature
  /// against the previously generated challenge without logging the user in
  void completeWebAuthnAssertionWithId({required WebAuthnLoginRequest body}) {
    _client.record(
      'post',
      'api/webauthn/assert',
      body: body.toJson(),
    );
  }

  /// Complete a WebAuthn registration ceremony by validating the client request
  /// and saving the new credential
  void completeWebAuthnRegistrationWithId(
      {required WebAuthnRegisterCompleteRequest body}) {
    _client.record(
      'post',
      'api/webauthn/register/complete',
      body: body.toJson(),
    );
  }

  /// Searches lambdas with the specified criteria and pagination.
  void searchLambdasWithId({required LambdaSearchRequest body}) {
    _client.record(
      'post',
      'api/lambda/search',
      body: body.toJson(),
    );
  }

  /// Creates a user action. This action cannot be taken on a user until this
  /// call successfully returns. Anytime after that the user action can be
  /// applied to any user.
  void createUserAction(
      {String? tenantIdScope, required UserActionRequest body}) {
    _client.record(
      'post',
      'api/user-action',
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Start a WebAuthn registration ceremony by generating a new challenge for
  /// the user
  void startWebAuthnRegistrationWithId(
      {required WebAuthnRegisterStartRequest body}) {
    _client.record(
      'post',
      'api/webauthn/register/start',
      body: body.toJson(),
    );
  }

  /// Searches user comments with the specified criteria and pagination.
  void searchUserCommentsWithId({required UserCommentSearchRequest body}) {
    _client.record(
      'post',
      'api/user/comment/search',
      body: body.toJson(),
    );
  }

  /// It's a JWT vending machine!  Issue a new access token (JWT) with the
  /// provided claims in the request. This JWT is not scoped to a tenant or
  /// user, it is a free form  token that will contain what claims you provide.
  /// <p> The iat, exp and jti claims will be added by FusionAuth, all other
  /// claims must be provided by the caller.  If a TTL is not provided in the
  /// request, the TTL will be retrieved from the default Tenant or the Tenant
  /// specified on the request either  by way of the X-FusionAuth-TenantId
  /// request header, or a tenant scoped API key.
  void vendJWTWithId({required JWTVendRequest body}) {
    _client.record(
      'post',
      'api/jwt/vend',
      body: body.toJson(),
    );
  }

  /// Searches keys with the specified criteria and pagination.
  void searchKeysWithId({required KeySearchRequest body}) {
    _client.record(
      'post',
      'api/key/search',
      body: body.toJson(),
    );
  }

  /// Updates the form field with the given Id.
  void updateFormFieldWithId(
      {required String fieldId, required FormFieldRequest body}) {
    _client.record(
      'put',
      'api/form/field/{fieldId}',
      pathParameters: {
        'fieldId': fieldId,
      },
      body: body.toJson(),
    );
  }

  /// Creates a form field.  You can optionally specify an Id for the form, if
  /// not provided one will be generated.
  void createFormFieldWithId(
      {required String fieldId, required FormFieldRequest body}) {
    _client.record(
      'post',
      'api/form/field/{fieldId}',
      pathParameters: {
        'fieldId': fieldId,
      },
      body: body.toJson(),
    );
  }

  /// Import an existing RSA or EC key pair or an HMAC secret.
  void importKeyWithId({required String keyId, required KeyRequest body}) {
    _client.record(
      'post',
      'api/key/import/{keyId}',
      pathParameters: {
        'keyId': keyId,
      },
      body: body.toJson(),
    );
  }

  /// Import an existing RSA or EC key pair or an HMAC secret.
  void importKey({required KeyRequest body}) {
    _client.record(
      'post',
      'api/key/import',
      body: body.toJson(),
    );
  }

  /// Creates an identity provider. You can optionally specify an Id for the
  /// identity provider, if not provided one will be generated.
  void createIdentityProvider({required IdentityProviderRequest body}) {
    _client.record(
      'post',
      'api/identity-provider',
      body: body.toJson(),
    );
  }

  /// Searches consents with the specified criteria and pagination.
  void searchConsentsWithId({required ConsentSearchRequest body}) {
    _client.record(
      'post',
      'api/consent/search',
      body: body.toJson(),
    );
  }

  /// Begins a login request for a 3rd party login that requires user
  /// interaction such as HYPR.
  void startIdentityProviderLoginWithId(
      {required IdentityProviderStartLoginRequest body}) {
    _client.record(
      'post',
      'api/identity-provider/start',
      body: body.toJson(),
    );
  }

  /// Updates the permission with the given Id for the entity type.
  void updateEntityTypePermissionWithId(
      {required String entityTypeId,
      required String permissionId,
      required EntityTypeRequest body}) {
    _client.record(
      'put',
      'api/entity/type/{entityTypeId}/permission/{permissionId}',
      pathParameters: {
        'entityTypeId': entityTypeId,
        'permissionId': permissionId,
      },
      body: body.toJson(),
    );
  }

  /// Creates a new permission for an entity type. You must specify the Id of
  /// the entity type you are creating the permission for. You can optionally
  /// specify an Id for the permission inside the EntityTypePermission object
  /// itself, if not provided one will be generated.
  void createEntityTypePermissionWithId(
      {required String entityTypeId,
      required String permissionId,
      required EntityTypeRequest body}) {
    _client.record(
      'post',
      'api/entity/type/{entityTypeId}/permission/{permissionId}',
      pathParameters: {
        'entityTypeId': entityTypeId,
        'permissionId': permissionId,
      },
      body: body.toJson(),
    );
  }

  /// Generate two-factor recovery codes for a user. Generating two-factor
  /// recovery codes will invalidate any existing recovery codes.
  void generateTwoFactorRecoveryCodesWithId(String userId) {
    _client.record(
      'post',
      'api/user/two-factor/recovery-code/{userId}',
      pathParameters: {
        'userId': userId,
      },
    );
  }

  /// Send a Two Factor authentication code to assist in setting up Two Factor
  /// authentication or disabling.
  void sendTwoFactorCodeForEnableDisableWithId(
      {required TwoFactorSendRequest body}) {
    _client.record(
      'post',
      'api/two-factor/send',
      body: body.toJson(),
    );
  }

  /// Registers a user for an application. If you provide the User and the
  /// UserRegistration object on this request, it will create the user as well
  /// as register them for the application. This is called a Full Registration.
  /// However, if you only provide the UserRegistration object, then the user
  /// must already exist and they will be registered for the application. The
  /// user Id can also be provided and it will either be used to look up an
  /// existing user or it will be used for the newly created User.
  void register({String? tenantIdScope, required RegistrationRequest body}) {
    _client.record(
      'post',
      'api/user/registration',
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Creates a form field.  You can optionally specify an Id for the form, if
  /// not provided one will be generated.
  void createFormField({required FormFieldRequest body}) {
    _client.record(
      'post',
      'api/form/field',
      body: body.toJson(),
    );
  }

  /// Searches the entity types with the specified criteria and pagination.
  void searchEntityTypesWithId({required EntityTypeSearchRequest body}) {
    _client.record(
      'post',
      'api/entity/type/search',
      body: body.toJson(),
    );
  }

  /// Creates a new permission for an entity type. You must specify the Id of
  /// the entity type you are creating the permission for. You can optionally
  /// specify an Id for the permission inside the EntityTypePermission object
  /// itself, if not provided one will be generated.
  void createEntityTypePermission(
      {required String entityTypeId, required EntityTypeRequest body}) {
    _client.record(
      'post',
      'api/entity/type/{entityTypeId}/permission',
      pathParameters: {
        'entityTypeId': entityTypeId,
      },
      body: body.toJson(),
    );
  }

  /// Creates a new custom OAuth scope for an application. You must specify the
  /// Id of the application you are creating the scope for. You can optionally
  /// specify an Id for the OAuth scope on the URL, if not provided one will be
  /// generated.
  void createOAuthScope(
      {required String applicationId,
      String? tenantIdScope,
      required ApplicationOAuthScopeRequest body}) {
    _client.record(
      'post',
      'api/application/{applicationId}/scope',
      pathParameters: {
        'applicationId': applicationId,
      },
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Creates or updates an Entity Grant. This is when a User/Entity is granted
  /// permissions to an Entity.
  void upsertEntityGrantWithId(
      {required String entityId,
      String? tenantIdScope,
      required EntityGrantRequest body}) {
    _client.record(
      'post',
      'api/entity/{entityId}/grant',
      pathParameters: {
        'entityId': entityId,
      },
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Creates a user consent type. You can optionally specify an Id for the
  /// consent type, if not provided one will be generated.
  void createConsent({String? tenantIdScope, required ConsentRequest body}) {
    _client.record(
      'post',
      'api/consent',
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Searches identity providers with the specified criteria and pagination.
  void searchIdentityProvidersWithId(
      {required IdentityProviderSearchRequest body}) {
    _client.record(
      'post',
      'api/identity-provider/search',
      body: body.toJson(),
    );
  }

  /// Creates a user reason. This user action reason cannot be used when
  /// actioning a user until this call completes successfully. Anytime after
  /// that the user action reason can be used.
  void createUserActionReason({required UserActionReasonRequest body}) {
    _client.record(
      'post',
      'api/user-action-reason',
      body: body.toJson(),
    );
  }

  /// Searches the event logs with the specified criteria and pagination.
  void searchEventLogsWithId({required EventLogSearchRequest body}) {
    _client.record(
      'post',
      'api/system/event-log/search',
      body: body.toJson(),
    );
  }

  /// Searches themes with the specified criteria and pagination.
  void searchThemesWithId({required ThemeSearchRequest body}) {
    _client.record(
      'post',
      'api/theme/search',
      body: body.toJson(),
    );
  }

  /// Creates a group. You can optionally specify an Id for the group, if not
  /// provided one will be generated.
  void createGroup({String? tenantIdScope, required GroupRequest body}) {
    _client.record(
      'post',
      'api/group',
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Approve a device grant.
  void approveDeviceWithId() {
    _client.record(
      'post',
      'oauth2/device/approve',
    );
  }

  /// Searches entities with the specified criteria and pagination.
  void searchEntitiesWithId({required EntitySearchRequest body}) {
    _client.record(
      'post',
      'api/entity/search',
      body: body.toJson(),
    );
  }

  /// Activates the FusionAuth Reactor using a license Id and optionally a
  /// license text (for air-gapped deployments)
  void activateReactorWithId({required ReactorRequest body}) {
    _client.record(
      'post',
      'api/reactor',
      body: body.toJson(),
    );
  }

  /// Generate a new RSA or EC key pair or an HMAC secret.
  void generateKeyWithId({required String keyId, required KeyRequest body}) {
    _client.record(
      'post',
      'api/key/generate/{keyId}',
      pathParameters: {
        'keyId': keyId,
      },
      body: body.toJson(),
    );
  }

  /// Generate a new RSA or EC key pair or an HMAC secret.
  void generateKey({required KeyRequest body}) {
    _client.record(
      'post',
      'api/key/generate',
      body: body.toJson(),
    );
  }

  /// Searches the audit logs with the specified criteria and pagination.
  void searchAuditLogsWithId({required AuditLogSearchRequest body}) {
    _client.record(
      'post',
      'api/system/audit-log/search',
      body: body.toJson(),
    );
  }

  /// Start a Two-Factor login request by generating a two-factor identifier.
  /// This code can then be sent to the Two Factor Send  API
  /// (/api/two-factor/send)in order to send a one-time use code to a user. You
  /// can also use one-time use code returned  to send the code out-of-band. The
  /// Two-Factor login is completed by making a request to the Two-Factor Login
  /// API (/api/two-factor/login). with the two-factor identifier and the
  /// one-time use code.  This API is intended to allow you to begin a
  /// Two-Factor login outside a normal login that originated from the Login API
  /// (/api/login).
  void startTwoFactorLoginWithId({required TwoFactorStartRequest body}) {
    _client.record(
      'post',
      'api/two-factor/start',
      body: body.toJson(),
    );
  }

  /// Searches groups with the specified criteria and pagination.
  void searchGroupsWithId({required GroupSearchRequest body}) {
    _client.record(
      'post',
      'api/group/search',
      body: body.toJson(),
    );
  }

  /// Creates a preview of the email template provided in the request. This
  /// allows you to preview an email template that hasn't been saved to the
  /// database yet. The entire email template does not need to be provided on
  /// the request. This will create the preview based on whatever is given.
  void retrieveEmailTemplatePreviewWithId({required PreviewRequest body}) {
    _client.record(
      'post',
      'api/email/template/preview',
      body: body.toJson(),
    );
  }

  /// Creates a tenant. You can optionally specify an Id for the tenant, if not
  /// provided one will be generated.
  void createTenant({String? tenantIdScope, required TenantRequest body}) {
    _client.record(
      'post',
      'api/tenant',
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Adds a comment to the user's account.
  void commentOnUserWithId(
      {String? tenantIdScope, required UserCommentRequest body}) {
    _client.record(
      'post',
      'api/user/comment',
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Searches the webhook event logs with the specified criteria and
  /// pagination.
  void searchWebhookEventLogsWithId(
      {required WebhookEventLogSearchRequest body}) {
    _client.record(
      'post',
      'api/system/webhook-event-log/search',
      body: body.toJson(),
    );
  }

  /// Reconcile a User to FusionAuth using JWT issued from another Identity
  /// Provider.
  void reconcileJWTWithId({required IdentityProviderLoginRequest body}) {
    _client.record(
      'post',
      'api/jwt/reconcile',
      body: body.toJson(),
    );
  }

  /// Complete login using a 2FA challenge
  void twoFactorLoginWithId({required TwoFactorLoginRequest body}) {
    _client.record(
      'post',
      'api/two-factor/login',
      body: body.toJson(),
    );
  }

  /// Requests Elasticsearch to delete and rebuild the index for FusionAuth
  /// users or entities. Be very careful when running this request as it will
  /// increase the CPU and I/O load on your database until the operation
  /// completes. Generally speaking you do not ever need to run this operation
  /// unless  instructed by FusionAuth support, or if you are migrating a
  /// database another system and you are not brining along the Elasticsearch
  /// index.   You have been warned.
  void reindexWithId({required ReindexRequest body}) {
    _client.record(
      'post',
      'api/system/reindex',
      body: body.toJson(),
    );
  }

  /// Sends a ping to FusionAuth indicating that the user was automatically
  /// logged into an application. When using FusionAuth's SSO or your own, you
  /// should call this if the user is already logged in centrally, but accesses
  /// an application where they no longer have a session. This helps correctly
  /// track login counts, times and helps with reporting.
  void loginPingWithId(
      {String? callerIpAddress,
      required String userId,
      required String applicationId,
      String? tenantIdScope}) {
    _client.record(
      'put',
      'api/login/{userId}/{applicationId}',
      pathParameters: {
        'userId': userId,
        'applicationId': applicationId,
      },
      queryParameters: {
        if (callerIpAddress != null) 'callerIPAddress': callerIpAddress,
      },
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
    );
  }

  /// Creates a Entity Type. You can optionally specify an Id for the Entity
  /// Type, if not provided one will be generated.
  void createEntityType({required EntityTypeRequest body}) {
    _client.record(
      'post',
      'api/entity/type',
      body: body.toJson(),
    );
  }

  /// Creates an Entity. You can optionally specify an Id for the Entity. If not
  /// provided one will be generated.
  void createEntity({String? tenantIdScope, required EntityRequest body}) {
    _client.record(
      'post',
      'api/entity',
      headers: {
        if (tenantIdScope != null) 'X-FusionAuth-TenantId': tenantIdScope,
      },
      body: body.toJson(),
    );
  }

  /// Bulk imports refresh tokens. This request performs minimal validation and
  /// runs batch inserts of refresh tokens with the expectation that each token
  /// represents a user that already exists and is registered for the
  /// corresponding FusionAuth Application. This is done to increases the insert
  /// performance.  Therefore, if you encounter an error due to a database key
  /// violation, the response will likely offer a generic explanation. If you
  /// encounter an error, you may optionally enable additional validation to
  /// receive a JSON response body with specific validation errors. This will
  /// slow the request down but will allow you to identify the cause of the
  /// failure. See the validateDbConstraints request parameter.
  void importRefreshTokensWithId({required RefreshTokenImportRequest body}) {
    _client.record(
      'post',
      'api/user/refresh-token/import',
      body: body.toJson(),
    );
  }

  /// Searches Entity Grants with the specified criteria and pagination.
  void searchEntityGrantsWithId({required EntityGrantSearchRequest body}) {
    _client.record(
      'post',
      'api/entity/grant/search',
      body: body.toJson(),
    );
  }

  /// Bulk imports users. This request performs minimal validation and runs
  /// batch inserts of users with the expectation that each user does not yet
  /// exist and each registration corresponds to an existing FusionAuth
  /// Application. This is done to increases the insert performance.  Therefore,
  /// if you encounter an error due to a database key violation, the response
  /// will likely offer a generic explanation. If you encounter an error, you
  /// may optionally enable additional validation to receive a JSON response
  /// body with specific validation errors. This will slow the request down but
  /// will allow you to identify the cause of the failure. See the
  /// validateDbConstraints request parameter.
  void importUsersWithId({required ImportRequest body}) {
    _client.record(
      'post',
      'api/user/import',
      body: body.toJson(),
    );
  }

  /// Complete a WebAuthn authentication ceremony by validating the signature
  /// against the previously generated challenge and then login the user in
  void completeWebAuthnLoginWithId({required WebAuthnLoginRequest body}) {
    _client.record(
      'post',
      'api/webauthn/login',
      body: body.toJson(),
    );
  }

  /// Send an email using an email template id. You can optionally provide
  /// `requestData` to access key value pairs in the email template.
  void sendEmailWithId(
      {required String emailTemplateId, required SendRequest body}) {
    _client.record(
      'post',
      'api/email/send/{emailTemplateId}',
      pathParameters: {
        'emailTemplateId': emailTemplateId,
      },
      body: body.toJson(),
    );
  }
}
