// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$Api extends Api {
  _$Api([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = Api;

  @override
  Future<Response<List<GroupResponse>>> _groupsIdGet({required num? id}) {
    final $url = '/groups/${id}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<GroupResponse>, GroupResponse>($request);
  }

  @override
  Future<Response<dynamic>> _usersAuthIdPasswordPatch(
      {required num? id, required UpdatePasswordRequest? body}) {
    final $url = '/users/auth/${id}/password';
    final $body = body;
    final $request = Request('PATCH', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<BooleanResponse>> _profilesProfilesExistsProfileIdGet(
      {required num? profileId}) {
    final $url = '/profiles/profiles/exists/${profileId}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<BooleanResponse, BooleanResponse>($request);
  }

  @override
  Future<Response<List<ProfileModel>>> _profilesProfilesGet({String? userId}) {
    final $url = '/profiles/profiles/';
    final $headers = {
      if (userId != null) 'userId': userId,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<List<ProfileModel>, ProfileModel>($request);
  }

  @override
  Future<Response<List<ReportResponse>>> _reportsReportsIdGet(
      {required num? id}) {
    final $url = '/reports/reports/${id}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<ReportResponse>, ReportResponse>($request);
  }

  @override
  Future<Response<ReportResponse>> _reportsReportsIdPatch(
      {String? userId, required num? id, required UpdateReportRequest? body}) {
    final $url = '/reports/reports/${id}';
    final $headers = {
      if (userId != null) 'userId': userId,
    };

    final $body = body;
    final $request =
        Request('PATCH', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<ReportResponse, ReportResponse>($request);
  }

  @override
  Future<Response<GroupInfoModel>> _groupsInfoIdGet({required num? id}) {
    final $url = '/groups/info/${id}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<GroupInfoModel, GroupInfoModel>($request);
  }

  @override
  Future<Response<ScanResponse>> _expensesScanPost(
      {required ScanRequest? body}) {
    final $url = '/expenses/scan';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<ScanResponse, ScanResponse>($request);
  }

  @override
  Future<Response<ExpenseModel>> _expensesExpensesGroupPurchaserUserPost(
      {required num? group,
      required num? user,
      required ExpenseRequest? body}) {
    final $url = '/expenses/expenses/${group}/purchaser/${user}';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<ExpenseModel, ExpenseModel>($request);
  }

  @override
  Future<Response<GroupResponse>> _groupsPrivatePost(
      {String? userId, required CreatePrivateGroupRequest? body}) {
    final $url = '/groups/private/';
    final $headers = {
      if (userId != null) 'userId': userId,
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<GroupResponse, GroupResponse>($request);
  }

  @override
  Future<Response<dynamic>> _groupsPrivateGroupUserPost(
      {required num? group, String? username, required ModelWithEmail? body}) {
    final $url = '/groups/private/${group}/user';
    final $headers = {
      if (username != null) 'username': username,
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<SurveyModel>>> _chatSurveysChannelIdGet(
      {String? userId, required num? id}) {
    final $url = '/chat/surveys/channel/${id}';
    final $headers = {
      if (userId != null) 'userId': userId,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<List<SurveyModel>, SurveyModel>($request);
  }

  @override
  Future<Response<dynamic>> _usersUsersIdAdminDelete(
      {String? role,
      required num? id,
      required DeleteUserByAdminRequest? body}) {
    final $url = '/users/users/${id}/admin';
    final $headers = {
      if (role != null) 'role': role,
    };

    final $body = body;
    final $request =
        Request('DELETE', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<ExpenseModel>>
      _expensesExpensesGroupIdExpenseIdPurchaserUserPut(
          {required num? groupId,
          required num? expenseId,
          required num? user,
          required ExpenseRequest? body}) {
    final $url = '/expenses/expenses/${groupId}/${expenseId}/purchaser/${user}';
    final $body = body;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<ExpenseModel, ExpenseModel>($request);
  }

  @override
  Future<Response<dynamic>> _usersAuthIdResendPost({required num? id}) {
    final $url = '/users/auth/${id}/resend';
    final $request = Request('POST', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<SurveyModel>> _chatSurveysVoteIdPost(
      {String? userId, required num? id, required VoteSurveyRequest? body}) {
    final $url = '/chat/surveys/vote/${id}';
    final $headers = {
      if (userId != null) 'userId': userId,
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<SurveyModel, SurveyModel>($request);
  }

  @override
  Future<Response<dynamic>> _chatSurveysVoteIdDelete(
      {String? userId, required num? id}) {
    final $url = '/chat/surveys/vote/${id}';
    final $headers = {
      if (userId != null) 'userId': userId,
    };

    final $request = Request('DELETE', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<GroupResponse>> _groupsPost(
      {String? roles, required CreatePublicGroupRequest? body}) {
    final $url = '/groups/';
    final $headers = {
      if (roles != null) 'roles': roles,
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<GroupResponse, GroupResponse>($request);
  }

  @override
  Future<Response<dynamic>> _groupsGroupJoinPatch(
      {required num? group, String? userId}) {
    final $url = '/groups/${group}/join/';
    final $headers = {
      if (userId != null) 'userId': userId,
    };

    final $request = Request('PATCH', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<UserModel>> _usersAuthRegisterAdminPost(
      {String? roles, required UserCreationRequest? body}) {
    final $url = '/users/auth/register/admin';
    final $headers = {
      if (roles != null) 'roles': roles,
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<UserModel, UserModel>($request);
  }

  @override
  Future<Response<String>> _groupsPrivateGroupQrcodeGet(
      {required num? group, String? userId}) {
    final $url = '/groups/private/${group}/qrcode';
    final $headers = {
      if (userId != null) 'userId': userId,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<String, String>($request);
  }

  @override
  Future<Response<List<UserResponse>>> _usersUsersGet({String? roles}) {
    final $url = '/users/users';
    final $headers = {
      if (roles != null) 'roles': roles,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<List<UserResponse>, UserResponse>($request);
  }

  @override
  Future<Response<dynamic>> _groupsPrivateGroupUserIdDelete(
      {required num? group, String? username, required num? id}) {
    final $url = '/groups/private/${group}/user/${id}';
    final $headers = {
      if (username != null) 'username': username,
    };

    final $request = Request('DELETE', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<ProfileModel>> _profilesProfilesGroupGroupIdPost(
      {String? roles,
      required num? groupId,
      required ProfileCreationRequest? body}) {
    final $url = '/profiles/profiles/group/${groupId}';
    final $headers = {
      if (roles != null) 'roles': roles,
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<ProfileModel, ProfileModel>($request);
  }

  @override
  Future<Response<dynamic>> _notificationsNotificationsIdDelete(
      {required num? id, String? userId}) {
    final $url = '/notifications/notifications/${id}';
    final $headers = {
      if (userId != null) 'userId': userId,
    };

    final $request = Request('DELETE', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _reportsReportsIdAdminDelete(
      {String? roles, required num? id}) {
    final $url = '/reports/reports/${id}/admin';
    final $headers = {
      if (roles != null) 'roles': roles,
    };

    final $request = Request('DELETE', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<ReportResponse>> _reportsReportsPost(
      {String? userId, required SubmitReportRequest? body}) {
    final $url = '/reports/reports';
    final $headers = {
      if (userId != null) 'userId': userId,
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<ReportResponse, ReportResponse>($request);
  }

  @override
  Future<Response<dynamic>> _chatChannelsIdDelete(
      {String? userId, required num? id}) {
    final $url = '/chat/channels/${id}';
    final $headers = {
      if (userId != null) 'userId': userId,
    };

    final $request = Request('DELETE', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _chatChannelsIdPatch(
      {String? userId, required num? id, required UpdateChannelRequest? body}) {
    final $url = '/chat/channels/${id}';
    final $headers = {
      if (userId != null) 'userId': userId,
    };

    final $body = body;
    final $request =
        Request('PATCH', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _groupsGroupDeclinePatch(
      {required num? group, String? userId}) {
    final $url = '/groups/${group}/decline/';
    final $headers = {
      if (userId != null) 'userId': userId,
    };

    final $request = Request('PATCH', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<GroupResponse>>> _groupsInvitesIdGet(
      {required num? id}) {
    final $url = '/groups/invites/${id}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<GroupResponse>, GroupResponse>($request);
  }

  @override
  Future<Response<List<DebtDetailsResponse>>>
      _expensesExpensesGroupUserUserDebtsDetailsGet(
          {required num? group, required num? user}) {
    final $url = '/expenses/expenses/${group}/user/${user}/debts/details';
    final $request = Request('GET', $url, client.baseUrl);
    return client
        .send<List<DebtDetailsResponse>, DebtDetailsResponse>($request);
  }

  @override
  Future<Response<dynamic>> _groupsGroupPatch(
      {required num? group, required UpdatePublicGroupRequest? body}) {
    final $url = '/groups/${group}';
    final $body = body;
    final $request = Request('PATCH', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<NotificationModel>>> _notificationsNotificationsGet(
      {String? userId}) {
    final $url = '/notifications/notifications/';
    final $headers = {
      if (userId != null) 'userId': userId,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<List<NotificationModel>, NotificationModel>($request);
  }

  @override
  Future<Response<dynamic>> _usersUsersDelete(
      {String? userId, required DeleteUserRequest? body}) {
    final $url = '/users/users/';
    final $headers = {
      if (userId != null) 'userId': userId,
    };

    final $body = body;
    final $request =
        Request('DELETE', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<num>>> _groupsOpenGet() {
    final $url = '/groups/open';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<num>, num>($request);
  }

  @override
  Future<Response<dynamic>> _planningGroupsGroupIdPlanningActivityIdJoinPatch(
      {required num? groupId, required num? activityId, required num? userId}) {
    final $url = '/planning/groups/${groupId}/planning/${activityId}/join';
    final $params = <String, dynamic>{'userId': userId};
    final $request =
        Request('PATCH', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<RecommendationResponse>>> _reportsRecommendationsIdGet(
      {required num? id}) {
    final $url = '/reports/recommendations/${id}';
    final $request = Request('GET', $url, client.baseUrl);
    return client
        .send<List<RecommendationResponse>, RecommendationResponse>($request);
  }

  @override
  Future<Response<dynamic>> _reportsRecommendationsIdDelete(
      {required num? id}) {
    final $url = '/reports/recommendations/${id}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<UserResponse>> _usersUsersMeGet({String? username}) {
    final $url = '/users/users/me';
    final $headers = {
      if (username != null) 'username': username,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<UserResponse, UserResponse>($request);
  }

  @override
  Future<Response<dynamic>> _groupsPrivateGroupDelete(
      {required num? group, String? username}) {
    final $url = '/groups/private/${group}';
    final $headers = {
      if (username != null) 'username': username,
    };

    final $request = Request('DELETE', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _groupsPrivateGroupPatch(
      {required num? group,
      String? username,
      required UpdatePrivateGroupRequest? body}) {
    final $url = '/groups/private/${group}';
    final $headers = {
      if (username != null) 'username': username,
    };

    final $body = body;
    final $request =
        Request('PATCH', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _groupsGroupUserDelete(
      {required num? group, String? userId}) {
    final $url = '/groups/${group}/user/';
    final $headers = {
      if (userId != null) 'userId': userId,
    };

    final $request = Request('DELETE', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<String>>> _placesCategoriesGet() {
    final $url = '/places/categories';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<String>, String>($request);
  }

  @override
  Future<Response<BooleanResponse>> _groupsIsInGroupGet(
      {required num? groupId, required num? userId}) {
    final $url = '/groups/isInGroup';
    final $params = <String, dynamic>{'groupId': groupId, 'userId': userId};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<BooleanResponse, BooleanResponse>($request);
  }

  @override
  Future<Response<LoginResponse>> _usersAuthIdEmailPatch(
      {required num? id, required UpdateEmailRequest? body}) {
    final $url = '/users/auth/${id}/email';
    final $body = body;
    final $request = Request('PATCH', $url, client.baseUrl, body: $body);
    return client.send<LoginResponse, LoginResponse>($request);
  }

  @override
  Future<Response<dynamic>> _usersUsersUpdatePatch(
      {String? userId, required UserUpdateRequest? body}) {
    final $url = '/users/users/update';
    final $headers = {
      if (userId != null) 'userId': userId,
    };

    final $body = body;
    final $request =
        Request('PATCH', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<CheckJwtResponse>> _usersAuthJwtcheckPost(
      {required CheckJwtRequest? body}) {
    final $url = '/users/auth/jwtcheck';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<CheckJwtResponse, CheckJwtResponse>($request);
  }

  @override
  Future<Response<dynamic>> _profilesProfilesProfileUpdatePatch(
      {String? userId,
      required num? profile,
      required ProfileUpdateRequest? body}) {
    final $url = '/profiles/profiles/${profile}/update';
    final $headers = {
      if (userId != null) 'userId': userId,
    };

    final $body = body;
    final $request =
        Request('PATCH', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<UserIdResponse>> _usersAuthValidationPasswordPatch(
      {required ValidateCodePasswordRequest? body}) {
    final $url = '/users/auth/validation/password';
    final $body = body;
    final $request = Request('PATCH', $url, client.baseUrl, body: $body);
    return client.send<UserIdResponse, UserIdResponse>($request);
  }

  @override
  Future<Response<List<ChannelModel>>> _chatChannelsGroupGet(
      {String? userId, required num? group}) {
    final $url = '/chat/channels/${group}';
    final $headers = {
      if (userId != null) 'userId': userId,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<List<ChannelModel>, ChannelModel>($request);
  }

  @override
  Future<Response<ChannelModel>> _chatChannelsGroupPost(
      {String? userId,
      required num? group,
      required CreateChannelRequest? body}) {
    final $url = '/chat/channels/${group}';
    final $headers = {
      if (userId != null) 'userId': userId,
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<ChannelModel, ChannelModel>($request);
  }

  @override
  Future<Response<LoginResponse>> _usersAuthLoginPost(
      {required LoginRequest? body}) {
    final $url = '/users/auth/login';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<LoginResponse, LoginResponse>($request);
  }

  @override
  Future<Response<List<ReportResponse>>> _reportsReportsAdminIdGet(
      {String? roles, required num? id}) {
    final $url = '/reports/reports/admin/${id}';
    final $headers = {
      if (roles != null) 'roles': roles,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<List<ReportResponse>, ReportResponse>($request);
  }

  @override
  Future<Response<AuthTokenResponse>> _usersAuthRegisterPost(
      {required UserCreationRequest? body}) {
    final $url = '/users/auth/register';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<AuthTokenResponse, AuthTokenResponse>($request);
  }

  @override
  Future<Response<dynamic>> _planningGroupsGroupIdPlanningActivityIdDelete(
      {String? userId, required num? groupId, required num? activityId}) {
    final $url = '/planning/groups/${groupId}/planning/${activityId}';
    final $headers = {
      if (userId != null) 'userId': userId,
    };

    final $request = Request('DELETE', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<ActivityResponse>>
      _planningGroupsGroupIdPlanningActivityIdPatch(
          {String? userId,
          required num? groupId,
          required num? activityId,
          required UpdateActivityRequest? body}) {
    final $url = '/planning/groups/${groupId}/planning/${activityId}';
    final $headers = {
      if (userId != null) 'userId': userId,
    };

    final $body = body;
    final $request =
        Request('PATCH', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<ActivityResponse, ActivityResponse>($request);
  }

  @override
  Future<Response<dynamic>> _expensesExpensesGroupIdExpenseIdDelete(
      {required num? groupId, required num? expenseId}) {
    final $url = '/expenses/expenses/${groupId}/${expenseId}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<SurveyModel>> _chatSurveysIdGet(
      {String? userId, required num? id}) {
    final $url = '/chat/surveys/${id}';
    final $headers = {
      if (userId != null) 'userId': userId,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<SurveyModel, SurveyModel>($request);
  }

  @override
  Future<Response<SurveyModel>> _chatSurveysIdPost(
      {String? userId, required num? id, required PostSurveyRequest? body}) {
    final $url = '/chat/surveys/${id}';
    final $headers = {
      if (userId != null) 'userId': userId,
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<SurveyModel, SurveyModel>($request);
  }

  @override
  Future<Response<dynamic>> _chatSurveysIdDelete(
      {String? userId, required num? id}) {
    final $url = '/chat/surveys/${id}';
    final $headers = {
      if (userId != null) 'userId': userId,
    };

    final $request = Request('DELETE', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<SurveyModel>> _chatSurveysIdPatch(
      {String? userId, required num? id, required UpdateSurveyRequest? body}) {
    final $url = '/chat/surveys/${id}';
    final $headers = {
      if (userId != null) 'userId': userId,
    };

    final $body = body;
    final $request =
        Request('PATCH', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<SurveyModel, SurveyModel>($request);
  }

  @override
  Future<Response<GroupMemberModel>> _groupsIdUsersUserIdGet(
      {required num? id, required num? userId}) {
    final $url = '/groups/${id}/users/${userId}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<GroupMemberModel, GroupMemberModel>($request);
  }

  @override
  Future<Response<List<ExpenseModel>>> _expensesExpensesGroupGet(
      {required num? group}) {
    final $url = '/expenses/expenses/${group}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<ExpenseModel>, ExpenseModel>($request);
  }

  @override
  Future<Response<dynamic>> _planningGroupsGroupIdPlanningActivityIdLeavePatch(
      {required num? groupId, required num? activityId, required num? userId}) {
    final $url = '/planning/groups/${groupId}/planning/${activityId}/leave';
    final $params = <String, dynamic>{'userId': userId};
    final $request =
        Request('PATCH', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _profilesMatchmakingPost(
      {required num? userId, required ProfileCreationRequest? body}) {
    final $url = '/profiles/matchmaking';
    final $params = <String, dynamic>{'user_id': userId};
    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _profilesMatchmakingPatch(
      {required num? userId, required num? profileId}) {
    final $url = '/profiles/matchmaking';
    final $params = <String, dynamic>{
      'user_id': userId,
      'profile_id': profileId
    };
    final $request =
        Request('PATCH', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<PlaceResponse>>> _placesCoordinatesPost(
      {required PlacesFromCoordinatesRequest? body}) {
    final $url = '/places/coordinates';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<List<PlaceResponse>, PlaceResponse>($request);
  }

  @override
  Future<Response<dynamic>> _profilesProfilesProfileDelete(
      {String? userId, required num? profile}) {
    final $url = '/profiles/profiles/${profile}';
    final $headers = {
      if (userId != null) 'userId': userId,
    };

    final $request = Request('DELETE', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<MoneyDueResponse>>>
      _expensesExpensesGroupUserUserDebtsDueGet(
          {required num? group, required num? user}) {
    final $url = '/expenses/expenses/${group}/user/${user}/debts/due';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<MoneyDueResponse>, MoneyDueResponse>($request);
  }

  @override
  Future<Response<RecommendationResponse>> _reportsRecommendationsPost(
      {String? userId, required SubmitRecommendationRequest? body}) {
    final $url = '/reports/recommendations';
    final $headers = {
      if (userId != null) 'userId': userId,
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client
        .send<RecommendationResponse, RecommendationResponse>($request);
  }

  @override
  Future<Response<List<MessageResponse>>> _chatChatChannelIdPinnedGet(
      {required num? channelId, String? username}) {
    final $url = '/chat/chat/${channelId}/pinned';
    final $headers = {
      if (username != null) 'username': username,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<List<MessageResponse>, MessageResponse>($request);
  }

  @override
  Future<Response<List<PlaceResponse>>> _placesAddressPost(
      {required PlacesFromAddressRequest? body}) {
    final $url = '/places/address';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<List<PlaceResponse>, PlaceResponse>($request);
  }

  @override
  Future<Response<List<num>>> _groupsIdMembersGet({required num? id}) {
    final $url = '/groups/${id}/members';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<num>, num>($request);
  }

  @override
  Future<Response<List<ProfileModel>>> _profilesProfilesActiveGet(
      {String? roles}) {
    final $url = '/profiles/profiles/active';
    final $headers = {
      if (roles != null) 'roles': roles,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<List<ProfileModel>, ProfileModel>($request);
  }

  @override
  Future<Response<MatchMakingResult>> _profilesMatchmakingTaskIdGet(
      {required num? taskId}) {
    final $url = '/profiles/matchmaking/${taskId}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<MatchMakingResult, MatchMakingResult>($request);
  }

  @override
  Future<Response<List<ActivityResponse>>> _planningGroupsGroupIdPlanningGet(
      {String? userId, required num? groupId}) {
    final $url = '/planning/groups/${groupId}/planning';
    final $headers = {
      if (userId != null) 'userId': userId,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<List<ActivityResponse>, ActivityResponse>($request);
  }

  @override
  Future<Response<ActivityResponse>> _planningGroupsGroupIdPlanningPost(
      {String? userId,
      required num? groupId,
      required CreateActivityRequest? body}) {
    final $url = '/planning/groups/${groupId}/planning';
    final $headers = {
      if (userId != null) 'userId': userId,
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<ActivityResponse, ActivityResponse>($request);
  }

  @override
  Future<Response<UserResponse>> _usersUsersIdGet(
      {String? roles, required num? id}) {
    final $url = '/users/users/${id}';
    final $headers = {
      if (roles != null) 'roles': roles,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<UserResponse, UserResponse>($request);
  }

  @override
  Future<Response<dynamic>> _chatChatChannelIdGet(
      {required num? channelId, int? page, String? username}) {
    final $url = '/chat/chat/${channelId}';
    final $params = <String, dynamic>{'page': page};
    final $headers = {
      if (username != null) 'username': username,
    };

    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<GoogleAuthResponse>> _usersAuthGooglePost(
      {required GoogleRequest? body}) {
    final $url = '/users/auth/google';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<GoogleAuthResponse, GoogleAuthResponse>($request);
  }

  @override
  Future<Response<ProfileModel>> _profilesProfilesPost(
      {String? userId, required ProfileCreationRequest? body}) {
    final $url = '/profiles/profiles';
    final $headers = {
      if (userId != null) 'userId': userId,
    };

    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<ProfileModel, ProfileModel>($request);
  }

  @override
  Future<Response<GroupMemoriesResponse>> _groupsGroupIdMemoriesGet(
      {required num? groupId}) {
    final $url = '/groups/${groupId}/memories';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<GroupMemoriesResponse, GroupMemoriesResponse>($request);
  }

  @override
  Future<Response<GroupMemoriesResponse>> _groupsGroupIdMemoriesPost(
      {required num? groupId, required GroupMemoryRequest? body}) {
    final $url = '/groups/${groupId}/memories';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<GroupMemoriesResponse, GroupMemoriesResponse>($request);
  }

  @override
  Future<Response<dynamic>> _groupsPrivateGroupJoinPatch(
      {required num? group,
      String? userId,
      required JoinGroupWithoutInviteModel? body}) {
    final $url = '/groups/private/${group}/join/';
    final $headers = {
      if (userId != null) 'userId': userId,
    };

    final $body = body;
    final $request =
        Request('PATCH', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<MoneyDueResponse>>>
      _expensesExpensesGroupUserUserDebtsGet(
          {required num? group, required num? user}) {
    final $url = '/expenses/expenses/${group}/user/${user}/debts';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<MoneyDueResponse>, MoneyDueResponse>($request);
  }

  @override
  Future<Response<FirebaseTokenResponse>> _usersUsersIdFirebaseGet(
      {required num? id}) {
    final $url = '/users/users/${id}/firebase';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<FirebaseTokenResponse, FirebaseTokenResponse>($request);
  }

  @override
  Future<Response<dynamic>> _usersUsersIdFirebasePatch(
      {required num? id, String? token}) {
    final $url = '/users/users/${id}/firebase';
    final $params = <String, dynamic>{'token': token};
    final $request =
        Request('PATCH', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<BooleanResponse>> _usersUsersIdExistsGet({required num? id}) {
    final $url = '/users/users/${id}/exists';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<BooleanResponse, BooleanResponse>($request);
  }

  @override
  Future<Response<dynamic>> _groupsPrivateGroupIdPublicPatch(
      {String? username,
      required num? groupId,
      required ProfileCreationRequest? body}) {
    final $url = '/groups/private/${groupId}/public';
    final $headers = {
      if (username != null) 'username': username,
    };

    final $body = body;
    final $request =
        Request('PATCH', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<SurveyModel>>> _chatSurveysQuizzIdGet(
      {String? userId, required num? id}) {
    final $url = '/chat/surveys/quizz/${id}';
    final $headers = {
      if (userId != null) 'userId': userId,
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<List<SurveyModel>, SurveyModel>($request);
  }

  @override
  Future<Response<MessageResponse>> _chatChatMessageIdPinnedPatch(
      {required num? messageId, bool? pin}) {
    final $url = '/chat/chat/${messageId}/pinned';
    final $params = <String, dynamic>{'pin': pin};
    final $request =
        Request('PATCH', $url, client.baseUrl, parameters: $params);
    return client.send<MessageResponse, MessageResponse>($request);
  }

  @override
  Future<Response<dynamic>> _usersAuthIdConfirmationPatch(
      {required num? id, required ConfirmationCodeModel? body}) {
    final $url = '/users/auth/${id}/confirmation';
    final $body = body;
    final $request = Request('PATCH', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<BooleanResponse>> _groupsIdExistsGet({required num? id}) {
    final $url = '/groups/${id}/exists';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<BooleanResponse, BooleanResponse>($request);
  }

  @override
  Future<Response<dynamic>> _usersAuthForgotPasswordPost(
      {required ForgotPasswordRequest? body}) {
    final $url = '/users/auth/forgot/password';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<LoginResponse>> _usersAuthLoginAdminPost(
      {required LoginRequest? body}) {
    final $url = '/users/auth/login/admin';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<LoginResponse, LoginResponse>($request);
  }

  @override
  Future<Response<dynamic>> _reportsReportsIdDelete(
      {String? userId, required num? id}) {
    final $url = '/reports/reports/${id}/';
    final $headers = {
      if (userId != null) 'userId': userId,
    };

    final $request = Request('DELETE', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<BalanceResponse>>> _expensesExpensesGroupBalancesGet(
      {required num? group}) {
    final $url = '/expenses/expenses/${group}/balances';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<BalanceResponse>, BalanceResponse>($request);
  }
}
