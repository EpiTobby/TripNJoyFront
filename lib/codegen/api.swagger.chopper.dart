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
  Future<Response<List<ProfileModel>>> _idProfilesGet({required num? id}) {
    final $url = '/${id}/profiles';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<ProfileModel>, ProfileModel>($request);
  }

  @override
  Future<Response<ProfileModel>> _idProfilesPost(
      {required num? id, required ProfileCreationRequest? body}) {
    final $url = '/${id}/profiles';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<ProfileModel, ProfileModel>($request);
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
  Future<Response<List<PlaceResponse>>> _placesAddressPost(
      {required PlacesFromAddressRequest? body}) {
    final $url = '/places/address';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<List<PlaceResponse>, PlaceResponse>($request);
  }

  @override
  Future<Response<dynamic>> _matchmakingPost(
      {required num? userId, required ProfileCreationRequest? body}) {
    final $url = '/matchmaking';
    final $params = <String, dynamic>{'user_id': userId};
    final $body = body;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _matchmakingPatch(
      {required num? userId, required num? profileId}) {
    final $url = '/matchmaking';
    final $params = <String, dynamic>{
      'user_id': userId,
      'profile_id': profileId
    };
    final $request =
        Request('PATCH', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<ActivityModel>>> _groupsGroupIdPlanningGet(
      {required num? groupId}) {
    final $url = '/groups/${groupId}/planning';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<ActivityModel>, ActivityModel>($request);
  }

  @override
  Future<Response<ActivityModel>> _groupsGroupIdPlanningPost(
      {required num? groupId, required CreateActivityRequest? body}) {
    final $url = '/groups/${groupId}/planning';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<ActivityModel, ActivityModel>($request);
  }

  @override
  Future<Response<GroupModel>> _groupsPrivateIdPost(
      {required num? id, required CreatePrivateGroupRequest? body}) {
    final $url = '/groups/private/${id}';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<GroupModel, GroupModel>($request);
  }

  @override
  Future<Response<dynamic>> _groupsPrivateGroupUserPost(
      {required num? group, required ModelWithEmail? body}) {
    final $url = '/groups/private/${group}/user';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<ChannelModel>>> _channelsGroupGet(
      {required num? group}) {
    final $url = '/channels/${group}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<ChannelModel>, ChannelModel>($request);
  }

  @override
  Future<Response<ChannelModel>> _channelsGroupPost(
      {required num? group, required CreateChannelRequest? body}) {
    final $url = '/channels/${group}';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<ChannelModel, ChannelModel>($request);
  }

  @override
  Future<Response<dynamic>> _authIdResendPost({required num? id}) {
    final $url = '/auth/${id}/resend';
    final $request = Request('POST', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<AuthTokenResponse>> _authRegisterPost(
      {required UserCreationRequest? body}) {
    final $url = '/auth/register';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<AuthTokenResponse, AuthTokenResponse>($request);
  }

  @override
  Future<Response<LoginResponse>> _authLoginPost(
      {required LoginRequest? body}) {
    final $url = '/auth/login';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<LoginResponse, LoginResponse>($request);
  }

  @override
  Future<Response<GoogleAuthResponse>> _authGooglePost(
      {required GoogleRequest? body}) {
    final $url = '/auth/google';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<GoogleAuthResponse, GoogleAuthResponse>($request);
  }

  @override
  Future<Response<dynamic>> _authForgotPasswordPost(
      {required ForgotPasswordRequest? body}) {
    final $url = '/auth/forgot/password';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _idProfilesProfileUpdatePatch(
      {required num? id,
      required num? profile,
      required ProfileUpdateRequest? body}) {
    final $url = '/${id}/profiles/${profile}/update';
    final $body = body;
    final $request = Request('PATCH', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _usersIdUpdatePatch(
      {required num? id, required UserUpdateRequest? body}) {
    final $url = '/users/${id}/update';
    final $body = body;
    final $request = Request('PATCH', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _groupsGroupJoinIdPatch(
      {required num? group, required num? id}) {
    final $url = '/groups/${group}/join/${id}';
    final $request = Request('PATCH', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _groupsGroupDeclineIdPatch(
      {required num? group, required num? id}) {
    final $url = '/groups/${group}/decline/${id}';
    final $request = Request('PATCH', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _groupsGroupIdPlanningActivityIdDelete(
      {required num? groupId, required num? activityId}) {
    final $url = '/groups/${groupId}/planning/${activityId}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<ActivityModel>> _groupsGroupIdPlanningActivityIdPatch(
      {required num? groupId,
      required num? activityId,
      required UpdateActivityRequest? body}) {
    final $url = '/groups/${groupId}/planning/${activityId}';
    final $body = body;
    final $request = Request('PATCH', $url, client.baseUrl, body: $body);
    return client.send<ActivityModel, ActivityModel>($request);
  }

  @override
  Future<Response<dynamic>> _groupsGroupIdPlanningActivityIdLeavePatch(
      {required num? groupId, required num? activityId, required num? userId}) {
    final $url = '/groups/${groupId}/planning/${activityId}/leave';
    final $params = <String, dynamic>{'userId': userId};
    final $request =
        Request('PATCH', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _groupsGroupIdPlanningActivityIdJoinPatch(
      {required num? groupId, required num? activityId, required num? userId}) {
    final $url = '/groups/${groupId}/planning/${activityId}/join';
    final $params = <String, dynamic>{'userId': userId};
    final $request =
        Request('PATCH', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _groupsPrivateGroupDelete({required num? group}) {
    final $url = '/groups/private/${group}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _groupsPrivateGroupPatch(
      {required num? group, required UpdateGroupRequest? body}) {
    final $url = '/groups/private/${group}';
    final $body = body;
    final $request = Request('PATCH', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<MessageResponse>> _chatMessageIdPinnedPatch(
      {required num? messageId, bool? pin}) {
    final $url = '/chat/${messageId}/pinned';
    final $params = <String, dynamic>{'pin': pin};
    final $request =
        Request('PATCH', $url, client.baseUrl, parameters: $params);
    return client.send<MessageResponse, MessageResponse>($request);
  }

  @override
  Future<Response<dynamic>> _channelsIdDelete({required num? id}) {
    final $url = '/channels/${id}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _channelsIdPatch(
      {required num? id, required UpdateChannelRequest? body}) {
    final $url = '/channels/${id}';
    final $body = body;
    final $request = Request('PATCH', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _authIdPasswordPatch(
      {required num? id, required UpdatePasswordRequest? body}) {
    final $url = '/auth/${id}/password';
    final $body = body;
    final $request = Request('PATCH', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<LoginResponse>> _authIdEmailPatch(
      {required num? id, required UpdateEmailRequest? body}) {
    final $url = '/auth/${id}/email';
    final $body = body;
    final $request = Request('PATCH', $url, client.baseUrl, body: $body);
    return client.send<LoginResponse, LoginResponse>($request);
  }

  @override
  Future<Response<dynamic>> _authIdConfirmationPatch(
      {required num? id, required ConfirmationCodeModel? body}) {
    final $url = '/auth/${id}/confirmation';
    final $body = body;
    final $request = Request('PATCH', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<UserIdResponse>> _authValidationPasswordPatch(
      {required ValidateCodePasswordRequest? body}) {
    final $url = '/auth/validation/password';
    final $body = body;
    final $request = Request('PATCH', $url, client.baseUrl, body: $body);
    return client.send<UserIdResponse, UserIdResponse>($request);
  }

  @override
  Future<Response<List<ProfileModel>>> _idProfilesActiveGet() {
    final $url = '/{id}/profiles/active';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<ProfileModel>, ProfileModel>($request);
  }

  @override
  Future<Response<List<UserEntity>>> _usersGet() {
    final $url = '/users';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<UserEntity>, UserEntity>($request);
  }

  @override
  Future<Response<UserModel>> _usersIdGet({required num? id}) {
    final $url = '/users/${id}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<UserModel, UserModel>($request);
  }

  @override
  Future<Response<dynamic>> _usersIdDelete(
      {required num? id, required DeleteUserRequest? body}) {
    final $url = '/users/${id}';
    final $body = body;
    final $request = Request('DELETE', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<UserModel>> _usersMeGet() {
    final $url = '/users/me';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<UserModel, UserModel>($request);
  }

  @override
  Future<Response<List<String>>> _placesCategoriesGet() {
    final $url = '/places/categories';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<String>, String>($request);
  }

  @override
  Future<Response<MatchMakingResult>> _matchmakingTaskIdGet(
      {required num? taskId}) {
    final $url = '/matchmaking/${taskId}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<MatchMakingResult, MatchMakingResult>($request);
  }

  @override
  Future<Response<List<GroupModel>>> _groupsIdGet({required num? id}) {
    final $url = '/groups/${id}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<GroupModel>, GroupModel>($request);
  }

  @override
  Future<Response<GroupMemberModel>> _groupsGroupIdUsersUserIdGet(
      {required num? groupId, required num? userId}) {
    final $url = '/groups/${groupId}/users/${userId}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<GroupMemberModel, GroupMemberModel>($request);
  }

  @override
  Future<Response<List<GroupModel>>> _groupsInvitesIdGet({required num? id}) {
    final $url = '/groups/invites/${id}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<GroupModel>, GroupModel>($request);
  }

  @override
  Future<Response<List<MessageResponse>>> _chatChannelIdGet(
      {required num? channelId, int? page}) {
    final $url = '/chat/${channelId}';
    final $params = <String, dynamic>{'page': page};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<List<MessageResponse>, MessageResponse>($request);
  }

  @override
  Future<Response<List<MessageResponse>>> _chatChannelIdPinnedGet(
      {required num? channelId}) {
    final $url = '/chat/${channelId}/pinned';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<MessageResponse>, MessageResponse>($request);
  }

  @override
  Future<Response<dynamic>> _idProfilesProfileDelete(
      {required num? id, required num? profile}) {
    final $url = '/${id}/profiles/${profile}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _usersIdAdminDelete(
      {required num? id, required DeleteUserByAdminRequest? body}) {
    final $url = '/users/${id}/admin';
    final $body = body;
    final $request = Request('DELETE', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _groupsGroupUserIdDelete(
      {required num? group, required num? id}) {
    final $url = '/groups/${group}/user/${id}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _groupsPrivateGroupUserIdDelete(
      {required num? group, required num? id}) {
    final $url = '/groups/private/${group}/user/${id}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
