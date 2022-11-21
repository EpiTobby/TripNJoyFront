import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';

import 'package:chopper/chopper.dart';
import 'client_mapping.dart';
import 'package:chopper/chopper.dart' as chopper;
import 'api.enums.swagger.dart' as enums;
export 'api.enums.swagger.dart';

part 'api.swagger.chopper.dart';
part 'api.swagger.g.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class Api extends ChopperService {
  static Api create({ChopperClient? client, String? baseUrl}) {
    if (client != null) {
      return _$Api(client);
    }

    final newClient = ChopperClient(
        services: [_$Api()],
        converter: $JsonSerializableConverter(),
        baseUrl: baseUrl ?? 'http://');
    return _$Api(newClient);
  }

  ///Get all the group of the user
  ///@param id
  Future<chopper.Response<List<GroupResponse>>> groupsIdGet(
      {required num? id}) {
    generatedMapping.putIfAbsent(
        GroupResponse, () => GroupResponse.fromJsonFactory);

    return _groupsIdGet(id: id);
  }

  ///Get all the group of the user
  ///@param id
  @Get(path: '/groups/{id}')
  Future<chopper.Response<List<GroupResponse>>> _groupsIdGet(
      {@Path('id') required num? id});

  ///Used to update the password
  ///@param id
  Future<chopper.Response> usersAuthIdPasswordPatch(
      {required num? id, required UpdatePasswordRequest? body}) {
    return _usersAuthIdPasswordPatch(id: id, body: body);
  }

  ///Used to update the password
  ///@param id
  @Patch(path: '/users/auth/{id}/password')
  Future<chopper.Response> _usersAuthIdPasswordPatch(
      {@Path('id') required num? id,
      @Body() required UpdatePasswordRequest? body});

  ///Check if a profile exists
  ///@param profileId
  Future<chopper.Response<BooleanResponse>> profilesProfilesExistsProfileIdGet(
      {required num? profileId}) {
    generatedMapping.putIfAbsent(
        BooleanResponse, () => BooleanResponse.fromJsonFactory);

    return _profilesProfilesExistsProfileIdGet(profileId: profileId);
  }

  ///Check if a profile exists
  ///@param profileId
  @Get(path: '/profiles/profiles/exists/{profileId}')
  Future<chopper.Response<BooleanResponse>> _profilesProfilesExistsProfileIdGet(
      {@Path('profileId') required num? profileId});

  ///Get all profiles from a user
  ///@param userId
  Future<chopper.Response<List<ProfileModel>>> profilesProfilesGet(
      {String? userId}) {
    generatedMapping.putIfAbsent(
        ProfileModel, () => ProfileModel.fromJsonFactory);

    return _profilesProfilesGet(userId: userId);
  }

  ///Get all profiles from a user
  ///@param userId
  @Get(path: '/profiles/profiles/')
  Future<chopper.Response<List<ProfileModel>>> _profilesProfilesGet(
      {@Header('userId') String? userId});

  ///Get all the report posted by a user
  ///@param id
  Future<chopper.Response<List<ReportResponse>>> reportsReportsIdGet(
      {required num? id}) {
    generatedMapping.putIfAbsent(
        ReportResponse, () => ReportResponse.fromJsonFactory);

    return _reportsReportsIdGet(id: id);
  }

  ///Get all the report posted by a user
  ///@param id
  @Get(path: '/reports/reports/{id}')
  Future<chopper.Response<List<ReportResponse>>> _reportsReportsIdGet(
      {@Path('id') required num? id});

  ///Update a report
  ///@param userId
  ///@param id
  Future<chopper.Response<ReportResponse>> reportsReportsIdPatch(
      {String? userId, required num? id, required UpdateReportRequest? body}) {
    generatedMapping.putIfAbsent(
        ReportResponse, () => ReportResponse.fromJsonFactory);

    return _reportsReportsIdPatch(userId: userId, id: id, body: body);
  }

  ///Update a report
  ///@param userId
  ///@param id
  @Patch(path: '/reports/reports/{id}')
  Future<chopper.Response<ReportResponse>> _reportsReportsIdPatch(
      {@Header('userId') String? userId,
      @Path('id') required num? id,
      @Body() required UpdateReportRequest? body});

  ///Get info about a group
  ///@param id
  Future<chopper.Response<GroupInfoModel>> groupsInfoIdGet({required num? id}) {
    generatedMapping.putIfAbsent(
        GroupInfoModel, () => GroupInfoModel.fromJsonFactory);

    return _groupsInfoIdGet(id: id);
  }

  ///Get info about a group
  ///@param id
  @Get(path: '/groups/info/{id}')
  Future<chopper.Response<GroupInfoModel>> _groupsInfoIdGet(
      {@Path('id') required num? id});

  ///
  Future<chopper.Response<ScanResponse>> expensesScanPost(
      {required ScanRequest? body}) {
    generatedMapping.putIfAbsent(
        ScanResponse, () => ScanResponse.fromJsonFactory);

    return _expensesScanPost(body: body);
  }

  ///
  @Post(path: '/expenses/scan')
  Future<chopper.Response<ScanResponse>> _expensesScanPost(
      {@Body() required ScanRequest? body});

  ///
  ///@param group
  ///@param user
  Future<chopper.Response<ExpenseModel>> expensesExpensesGroupPurchaserUserPost(
      {required num? group,
      required num? user,
      required ExpenseRequest? body}) {
    generatedMapping.putIfAbsent(
        ExpenseModel, () => ExpenseModel.fromJsonFactory);

    return _expensesExpensesGroupPurchaserUserPost(
        group: group, user: user, body: body);
  }

  ///
  ///@param group
  ///@param user
  @Post(path: '/expenses/expenses/{group}/purchaser/{user}')
  Future<chopper.Response<ExpenseModel>>
      _expensesExpensesGroupPurchaserUserPost(
          {@Path('group') required num? group,
          @Path('user') required num? user,
          @Body() required ExpenseRequest? body});

  ///Create a private group
  ///@param userId
  Future<chopper.Response<GroupResponse>> groupsPrivatePost(
      {String? userId, required CreatePrivateGroupRequest? body}) {
    generatedMapping.putIfAbsent(
        GroupResponse, () => GroupResponse.fromJsonFactory);

    return _groupsPrivatePost(userId: userId, body: body);
  }

  ///Create a private group
  ///@param userId
  @Post(path: '/groups/private/')
  Future<chopper.Response<GroupResponse>> _groupsPrivatePost(
      {@Header('userId') String? userId,
      @Body() required CreatePrivateGroupRequest? body});

  ///Add user to private group
  ///@param group
  ///@param username
  Future<chopper.Response> groupsPrivateGroupUserPost(
      {required num? group, String? username, required ModelWithEmail? body}) {
    return _groupsPrivateGroupUserPost(
        group: group, username: username, body: body);
  }

  ///Add user to private group
  ///@param group
  ///@param username
  @Post(path: '/groups/private/{group}/user')
  Future<chopper.Response> _groupsPrivateGroupUserPost(
      {@Path('group') required num? group,
      @Header('username') String? username,
      @Body() required ModelWithEmail? body});

  ///Get all the surveys in a channel
  ///@param userId
  ///@param id
  Future<chopper.Response<List<SurveyModel>>> chatSurveysChannelIdGet(
      {String? userId, required num? id}) {
    generatedMapping.putIfAbsent(
        SurveyModel, () => SurveyModel.fromJsonFactory);

    return _chatSurveysChannelIdGet(userId: userId, id: id);
  }

  ///Get all the surveys in a channel
  ///@param userId
  ///@param id
  @Get(path: '/chat/surveys/channel/{id}')
  Future<chopper.Response<List<SurveyModel>>> _chatSurveysChannelIdGet(
      {@Header('userId') String? userId, @Path('id') required num? id});

  ///
  ///@param role
  ///@param id
  Future<chopper.Response> usersUsersIdAdminDelete(
      {String? role,
      required num? id,
      required DeleteUserByAdminRequest? body}) {
    return _usersUsersIdAdminDelete(role: role, id: id, body: body);
  }

  ///
  ///@param role
  ///@param id
  @Delete(path: '/users/users/{id}/admin')
  Future<chopper.Response> _usersUsersIdAdminDelete(
      {@Header('role') String? role,
      @Path('id') required num? id,
      @Body() required DeleteUserByAdminRequest? body});

  ///
  ///@param groupId
  ///@param expenseId
  ///@param user
  Future<chopper.Response<ExpenseModel>>
      expensesExpensesGroupIdExpenseIdPurchaserUserPut(
          {required num? groupId,
          required num? expenseId,
          required num? user,
          required ExpenseRequest? body}) {
    generatedMapping.putIfAbsent(
        ExpenseModel, () => ExpenseModel.fromJsonFactory);

    return _expensesExpensesGroupIdExpenseIdPurchaserUserPut(
        groupId: groupId, expenseId: expenseId, user: user, body: body);
  }

  ///
  ///@param groupId
  ///@param expenseId
  ///@param user
  @Put(path: '/expenses/expenses/{groupId}/{expenseId}/purchaser/{user}')
  Future<chopper.Response<ExpenseModel>>
      _expensesExpensesGroupIdExpenseIdPurchaserUserPut(
          {@Path('groupId') required num? groupId,
          @Path('expenseId') required num? expenseId,
          @Path('user') required num? user,
          @Body() required ExpenseRequest? body});

  ///Will send a new confirmation code to the user
  ///@param id
  Future<chopper.Response> usersAuthIdResendPost({required num? id}) {
    return _usersAuthIdResendPost(id: id);
  }

  ///Will send a new confirmation code to the user
  ///@param id
  @Post(path: '/users/auth/{id}/resend', optionalBody: true)
  Future<chopper.Response> _usersAuthIdResendPost(
      {@Path('id') required num? id});

  ///Vote for a survey
  ///@param userId
  ///@param id
  Future<chopper.Response<SurveyModel>> chatSurveysVoteIdPost(
      {String? userId, required num? id, required VoteSurveyRequest? body}) {
    generatedMapping.putIfAbsent(
        SurveyModel, () => SurveyModel.fromJsonFactory);

    return _chatSurveysVoteIdPost(userId: userId, id: id, body: body);
  }

  ///Vote for a survey
  ///@param userId
  ///@param id
  @Post(path: '/chat/surveys/vote/{id}')
  Future<chopper.Response<SurveyModel>> _chatSurveysVoteIdPost(
      {@Header('userId') String? userId,
      @Path('id') required num? id,
      @Body() required VoteSurveyRequest? body});

  ///Deletes a vote for a survey
  ///@param userId
  ///@param id
  Future<chopper.Response> chatSurveysVoteIdDelete(
      {String? userId, required num? id}) {
    return _chatSurveysVoteIdDelete(userId: userId, id: id);
  }

  ///Deletes a vote for a survey
  ///@param userId
  ///@param id
  @Delete(path: '/chat/surveys/vote/{id}')
  Future<chopper.Response> _chatSurveysVoteIdDelete(
      {@Header('userId') String? userId, @Path('id') required num? id});

  ///
  ///@param roles
  Future<chopper.Response<GroupResponse>> groupsPost(
      {String? roles, required CreatePublicGroupRequest? body}) {
    generatedMapping.putIfAbsent(
        GroupResponse, () => GroupResponse.fromJsonFactory);

    return _groupsPost(roles: roles, body: body);
  }

  ///
  ///@param roles
  @Post(path: '/groups/')
  Future<chopper.Response<GroupResponse>> _groupsPost(
      {@Header('roles') String? roles,
      @Body() required CreatePublicGroupRequest? body});

  ///Accept the invitation to the group
  ///@param group
  ///@param userId
  Future<chopper.Response> groupsGroupJoinPatch(
      {required num? group, String? userId}) {
    return _groupsGroupJoinPatch(group: group, userId: userId);
  }

  ///Accept the invitation to the group
  ///@param group
  ///@param userId
  @Patch(path: '/groups/{group}/join/', optionalBody: true)
  Future<chopper.Response> _groupsGroupJoinPatch(
      {@Path('group') required num? group, @Header('userId') String? userId});

  ///Create a new admin account. Will send a confirmation mail to the given address
  ///@param roles
  Future<chopper.Response<UserModel>> usersAuthRegisterAdminPost(
      {String? roles, required UserCreationRequest? body}) {
    generatedMapping.putIfAbsent(UserModel, () => UserModel.fromJsonFactory);

    return _usersAuthRegisterAdminPost(roles: roles, body: body);
  }

  ///Create a new admin account. Will send a confirmation mail to the given address
  ///@param roles
  @Post(path: '/users/auth/register/admin')
  Future<chopper.Response<UserModel>> _usersAuthRegisterAdminPost(
      {@Header('roles') String? roles,
      @Body() required UserCreationRequest? body});

  ///Get the QR code to join a private group
  ///@param group
  ///@param userId
  Future<chopper.Response<String>> groupsPrivateGroupQrcodeGet(
      {required num? group, String? userId}) {
    return _groupsPrivateGroupQrcodeGet(group: group, userId: userId);
  }

  ///Get the QR code to join a private group
  ///@param group
  ///@param userId
  @Get(path: '/groups/private/{group}/qrcode')
  Future<chopper.Response<String>> _groupsPrivateGroupQrcodeGet(
      {@Path('group') required num? group, @Header('userId') String? userId});

  ///
  ///@param roles
  Future<chopper.Response<List<UserResponse>>> usersUsersGet({String? roles}) {
    generatedMapping.putIfAbsent(
        UserResponse, () => UserResponse.fromJsonFactory);

    return _usersUsersGet(roles: roles);
  }

  ///
  ///@param roles
  @Get(path: '/users/users')
  Future<chopper.Response<List<UserResponse>>> _usersUsersGet(
      {@Header('roles') String? roles});

  ///Remove user from private group
  ///@param group
  ///@param username
  ///@param id
  Future<chopper.Response> groupsPrivateGroupUserIdDelete(
      {required num? group, String? username, required num? id}) {
    return _groupsPrivateGroupUserIdDelete(
        group: group, username: username, id: id);
  }

  ///Remove user from private group
  ///@param group
  ///@param username
  ///@param id
  @Delete(path: '/groups/private/{group}/user/{id}')
  Future<chopper.Response> _groupsPrivateGroupUserIdDelete(
      {@Path('group') required num? group,
      @Header('username') String? username,
      @Path('id') required num? id});

  ///Create a group profile
  ///@param roles
  ///@param groupId
  Future<chopper.Response<ProfileModel>> profilesProfilesGroupGroupIdPost(
      {String? roles,
      required num? groupId,
      required ProfileCreationRequest? body}) {
    generatedMapping.putIfAbsent(
        ProfileModel, () => ProfileModel.fromJsonFactory);

    return _profilesProfilesGroupGroupIdPost(
        roles: roles, groupId: groupId, body: body);
  }

  ///Create a group profile
  ///@param roles
  ///@param groupId
  @Post(path: '/profiles/profiles/group/{groupId}')
  Future<chopper.Response<ProfileModel>> _profilesProfilesGroupGroupIdPost(
      {@Header('roles') String? roles,
      @Path('groupId') required num? groupId,
      @Body() required ProfileCreationRequest? body});

  ///
  ///@param id
  ///@param userId
  Future<chopper.Response> notificationsNotificationsIdDelete(
      {required num? id, String? userId}) {
    return _notificationsNotificationsIdDelete(id: id, userId: userId);
  }

  ///
  ///@param id
  ///@param userId
  @Delete(path: '/notifications/notifications/{id}')
  Future<chopper.Response> _notificationsNotificationsIdDelete(
      {@Path('id') required num? id, @Header('userId') String? userId});

  ///Delete a report
  ///@param roles
  ///@param id
  Future<chopper.Response> reportsReportsIdAdminDelete(
      {String? roles, required num? id}) {
    return _reportsReportsIdAdminDelete(roles: roles, id: id);
  }

  ///Delete a report
  ///@param roles
  ///@param id
  @Delete(path: '/reports/reports/{id}/admin')
  Future<chopper.Response> _reportsReportsIdAdminDelete(
      {@Header('roles') String? roles, @Path('id') required num? id});

  ///Create a report
  ///@param userId
  Future<chopper.Response<ReportResponse>> reportsReportsPost(
      {String? userId, required SubmitReportRequest? body}) {
    generatedMapping.putIfAbsent(
        ReportResponse, () => ReportResponse.fromJsonFactory);

    return _reportsReportsPost(userId: userId, body: body);
  }

  ///Create a report
  ///@param userId
  @Post(path: '/reports/reports')
  Future<chopper.Response<ReportResponse>> _reportsReportsPost(
      {@Header('userId') String? userId,
      @Body() required SubmitReportRequest? body});

  ///Delete a channel
  ///@param userId
  ///@param id
  Future<chopper.Response> chatChannelsIdDelete(
      {String? userId, required num? id}) {
    return _chatChannelsIdDelete(userId: userId, id: id);
  }

  ///Delete a channel
  ///@param userId
  ///@param id
  @Delete(path: '/chat/channels/{id}')
  Future<chopper.Response> _chatChannelsIdDelete(
      {@Header('userId') String? userId, @Path('id') required num? id});

  ///Update a channel
  ///@param userId
  ///@param id
  Future<chopper.Response> chatChannelsIdPatch(
      {String? userId, required num? id, required UpdateChannelRequest? body}) {
    return _chatChannelsIdPatch(userId: userId, id: id, body: body);
  }

  ///Update a channel
  ///@param userId
  ///@param id
  @Patch(path: '/chat/channels/{id}')
  Future<chopper.Response> _chatChannelsIdPatch(
      {@Header('userId') String? userId,
      @Path('id') required num? id,
      @Body() required UpdateChannelRequest? body});

  ///Decline the invitation to the group
  ///@param group
  ///@param userId
  Future<chopper.Response> groupsGroupDeclinePatch(
      {required num? group, String? userId}) {
    return _groupsGroupDeclinePatch(group: group, userId: userId);
  }

  ///Decline the invitation to the group
  ///@param group
  ///@param userId
  @Patch(path: '/groups/{group}/decline/', optionalBody: true)
  Future<chopper.Response> _groupsGroupDeclinePatch(
      {@Path('group') required num? group, @Header('userId') String? userId});

  ///Get all the group invitation of the user
  ///@param id
  Future<chopper.Response<List<GroupResponse>>> groupsInvitesIdGet(
      {required num? id}) {
    generatedMapping.putIfAbsent(
        GroupResponse, () => GroupResponse.fromJsonFactory);

    return _groupsInvitesIdGet(id: id);
  }

  ///Get all the group invitation of the user
  ///@param id
  @Get(path: '/groups/invites/{id}')
  Future<chopper.Response<List<GroupResponse>>> _groupsInvitesIdGet(
      {@Path('id') required num? id});

  ///
  ///@param group
  ///@param user
  Future<chopper.Response<List<DebtDetailsResponse>>>
      expensesExpensesGroupUserUserDebtsDetailsGet(
          {required num? group, required num? user}) {
    generatedMapping.putIfAbsent(
        DebtDetailsResponse, () => DebtDetailsResponse.fromJsonFactory);

    return _expensesExpensesGroupUserUserDebtsDetailsGet(
        group: group, user: user);
  }

  ///
  ///@param group
  ///@param user
  @Get(path: '/expenses/expenses/{group}/user/{user}/debts/details')
  Future<chopper.Response<List<DebtDetailsResponse>>>
      _expensesExpensesGroupUserUserDebtsDetailsGet(
          {@Path('group') required num? group,
          @Path('user') required num? user});

  ///Update the public group
  ///@param group
  Future<chopper.Response> groupsGroupPatch(
      {required num? group, required UpdatePublicGroupRequest? body}) {
    return _groupsGroupPatch(group: group, body: body);
  }

  ///Update the public group
  ///@param group
  @Patch(path: '/groups/{group}')
  Future<chopper.Response> _groupsGroupPatch(
      {@Path('group') required num? group,
      @Body() required UpdatePublicGroupRequest? body});

  ///
  ///@param userId
  Future<chopper.Response<List<NotificationModel>>>
      notificationsNotificationsGet({String? userId}) {
    generatedMapping.putIfAbsent(
        NotificationModel, () => NotificationModel.fromJsonFactory);

    return _notificationsNotificationsGet(userId: userId);
  }

  ///
  ///@param userId
  @Get(path: '/notifications/notifications/')
  Future<chopper.Response<List<NotificationModel>>>
      _notificationsNotificationsGet({@Header('userId') String? userId});

  ///
  ///@param userId
  Future<chopper.Response> usersUsersDelete(
      {String? userId, required DeleteUserRequest? body}) {
    return _usersUsersDelete(userId: userId, body: body);
  }

  ///
  ///@param userId
  @Delete(path: '/users/users/')
  Future<chopper.Response> _usersUsersDelete(
      {@Header('userId') String? userId,
      @Body() required DeleteUserRequest? body});

  ///Get all open groups
  Future<chopper.Response<List<num>>> groupsOpenGet() {
    return _groupsOpenGet();
  }

  ///Get all open groups
  @Get(path: '/groups/open')
  Future<chopper.Response<List<num>>> _groupsOpenGet();

  ///Add the user to the given activity
  ///@param groupId
  ///@param activityId
  ///@param userId
  Future<chopper.Response> planningGroupsGroupIdPlanningActivityIdJoinPatch(
      {required num? groupId, required num? activityId, required num? userId}) {
    return _planningGroupsGroupIdPlanningActivityIdJoinPatch(
        groupId: groupId, activityId: activityId, userId: userId);
  }

  ///Add the user to the given activity
  ///@param groupId
  ///@param activityId
  ///@param userId
  @Patch(
      path: '/planning/groups/{groupId}/planning/{activityId}/join',
      optionalBody: true)
  Future<chopper.Response> _planningGroupsGroupIdPlanningActivityIdJoinPatch(
      {@Path('groupId') required num? groupId,
      @Path('activityId') required num? activityId,
      @Query('userId') required num? userId});

  ///Get all the recommendation of a user
  ///@param id
  Future<chopper.Response<List<RecommendationResponse>>>
      reportsRecommendationsIdGet({required num? id}) {
    generatedMapping.putIfAbsent(
        RecommendationResponse, () => RecommendationResponse.fromJsonFactory);

    return _reportsRecommendationsIdGet(id: id);
  }

  ///Get all the recommendation of a user
  ///@param id
  @Get(path: '/reports/recommendations/{id}')
  Future<chopper.Response<List<RecommendationResponse>>>
      _reportsRecommendationsIdGet({@Path('id') required num? id});

  ///Delete a recommendation
  ///@param id
  Future<chopper.Response> reportsRecommendationsIdDelete({required num? id}) {
    return _reportsRecommendationsIdDelete(id: id);
  }

  ///Delete a recommendation
  ///@param id
  @Delete(path: '/reports/recommendations/{id}')
  Future<chopper.Response> _reportsRecommendationsIdDelete(
      {@Path('id') required num? id});

  ///
  ///@param username
  Future<chopper.Response<UserResponse>> usersUsersMeGet({String? username}) {
    generatedMapping.putIfAbsent(
        UserResponse, () => UserResponse.fromJsonFactory);

    return _usersUsersMeGet(username: username);
  }

  ///
  ///@param username
  @Get(path: '/users/users/me')
  Future<chopper.Response<UserResponse>> _usersUsersMeGet(
      {@Header('username') String? username});

  ///Delete the private group
  ///@param group
  ///@param username
  Future<chopper.Response> groupsPrivateGroupDelete(
      {required num? group, String? username}) {
    return _groupsPrivateGroupDelete(group: group, username: username);
  }

  ///Delete the private group
  ///@param group
  ///@param username
  @Delete(path: '/groups/private/{group}')
  Future<chopper.Response> _groupsPrivateGroupDelete(
      {@Path('group') required num? group,
      @Header('username') String? username});

  ///Update the private group
  ///@param group
  ///@param username
  Future<chopper.Response> groupsPrivateGroupPatch(
      {required num? group,
      String? username,
      required UpdatePrivateGroupRequest? body}) {
    return _groupsPrivateGroupPatch(
        group: group, username: username, body: body);
  }

  ///Update the private group
  ///@param group
  ///@param username
  @Patch(path: '/groups/private/{group}')
  Future<chopper.Response> _groupsPrivateGroupPatch(
      {@Path('group') required num? group,
      @Header('username') String? username,
      @Body() required UpdatePrivateGroupRequest? body});

  ///Remove the user from a group
  ///@param group
  ///@param userId
  Future<chopper.Response> groupsGroupUserDelete(
      {required num? group, String? userId}) {
    return _groupsGroupUserDelete(group: group, userId: userId);
  }

  ///Remove the user from a group
  ///@param group
  ///@param userId
  @Delete(path: '/groups/{group}/user/')
  Future<chopper.Response> _groupsGroupUserDelete(
      {@Path('group') required num? group, @Header('userId') String? userId});

  ///Returns all the categories of locations
  Future<chopper.Response<List<String>>> placesCategoriesGet() {
    return _placesCategoriesGet();
  }

  ///Returns all the categories of locations
  @Get(path: '/places/categories')
  Future<chopper.Response<List<String>>> _placesCategoriesGet();

  ///
  ///@param groupId
  ///@param userId
  Future<chopper.Response<BooleanResponse>> groupsIsInGroupGet(
      {required num? groupId, required num? userId}) {
    generatedMapping.putIfAbsent(
        BooleanResponse, () => BooleanResponse.fromJsonFactory);

    return _groupsIsInGroupGet(groupId: groupId, userId: userId);
  }

  ///
  ///@param groupId
  ///@param userId
  @Get(path: '/groups/isInGroup')
  Future<chopper.Response<BooleanResponse>> _groupsIsInGroupGet(
      {@Query('groupId') required num? groupId,
      @Query('userId') required num? userId});

  ///Used to ask update the user email. Returns a new jwt
  ///@param id
  Future<chopper.Response<LoginResponse>> usersAuthIdEmailPatch(
      {required num? id, required UpdateEmailRequest? body}) {
    generatedMapping.putIfAbsent(
        LoginResponse, () => LoginResponse.fromJsonFactory);

    return _usersAuthIdEmailPatch(id: id, body: body);
  }

  ///Used to ask update the user email. Returns a new jwt
  ///@param id
  @Patch(path: '/users/auth/{id}/email')
  Future<chopper.Response<LoginResponse>> _usersAuthIdEmailPatch(
      {@Path('id') required num? id,
      @Body() required UpdateEmailRequest? body});

  ///Used to update the user information
  ///@param userId
  Future<chopper.Response> usersUsersUpdatePatch(
      {String? userId, required UserUpdateRequest? body}) {
    return _usersUsersUpdatePatch(userId: userId, body: body);
  }

  ///Used to update the user information
  ///@param userId
  @Patch(path: '/users/users/update')
  Future<chopper.Response> _usersUsersUpdatePatch(
      {@Header('userId') String? userId,
      @Body() required UserUpdateRequest? body});

  ///
  Future<chopper.Response<CheckJwtResponse>> usersAuthJwtcheckPost(
      {required CheckJwtRequest? body}) {
    generatedMapping.putIfAbsent(
        CheckJwtResponse, () => CheckJwtResponse.fromJsonFactory);

    return _usersAuthJwtcheckPost(body: body);
  }

  ///
  @Post(path: '/users/auth/jwtcheck')
  Future<chopper.Response<CheckJwtResponse>> _usersAuthJwtcheckPost(
      {@Body() required CheckJwtRequest? body});

  ///Update a profile
  ///@param userId
  ///@param profile
  Future<chopper.Response> profilesProfilesProfileUpdatePatch(
      {String? userId,
      required num? profile,
      required ProfileUpdateRequest? body}) {
    return _profilesProfilesProfileUpdatePatch(
        userId: userId, profile: profile, body: body);
  }

  ///Update a profile
  ///@param userId
  ///@param profile
  @Patch(path: '/profiles/profiles/{profile}/update')
  Future<chopper.Response> _profilesProfilesProfileUpdatePatch(
      {@Header('userId') String? userId,
      @Path('profile') required num? profile,
      @Body() required ProfileUpdateRequest? body});

  ///Used to update the password with a confirmation code
  Future<chopper.Response<UserIdResponse>> usersAuthValidationPasswordPatch(
      {required ValidateCodePasswordRequest? body}) {
    generatedMapping.putIfAbsent(
        UserIdResponse, () => UserIdResponse.fromJsonFactory);

    return _usersAuthValidationPasswordPatch(body: body);
  }

  ///Used to update the password with a confirmation code
  @Patch(path: '/users/auth/validation/password')
  Future<chopper.Response<UserIdResponse>> _usersAuthValidationPasswordPatch(
      {@Body() required ValidateCodePasswordRequest? body});

  ///Get all the channels from a group
  ///@param userId
  ///@param group
  Future<chopper.Response<List<ChannelModel>>> chatChannelsGroupGet(
      {String? userId, required num? group}) {
    generatedMapping.putIfAbsent(
        ChannelModel, () => ChannelModel.fromJsonFactory);

    return _chatChannelsGroupGet(userId: userId, group: group);
  }

  ///Get all the channels from a group
  ///@param userId
  ///@param group
  @Get(path: '/chat/channels/{group}')
  Future<chopper.Response<List<ChannelModel>>> _chatChannelsGroupGet(
      {@Header('userId') String? userId, @Path('group') required num? group});

  ///Create a channel
  ///@param userId
  ///@param group
  Future<chopper.Response<ChannelModel>> chatChannelsGroupPost(
      {String? userId,
      required num? group,
      required CreateChannelRequest? body}) {
    generatedMapping.putIfAbsent(
        ChannelModel, () => ChannelModel.fromJsonFactory);

    return _chatChannelsGroupPost(userId: userId, group: group, body: body);
  }

  ///Create a channel
  ///@param userId
  ///@param group
  @Post(path: '/chat/channels/{group}')
  Future<chopper.Response<ChannelModel>> _chatChannelsGroupPost(
      {@Header('userId') String? userId,
      @Path('group') required num? group,
      @Body() required CreateChannelRequest? body});

  ///Log a user, to allow authenticated endpoints
  Future<chopper.Response<LoginResponse>> usersAuthLoginPost(
      {required LoginRequest? body}) {
    generatedMapping.putIfAbsent(
        LoginResponse, () => LoginResponse.fromJsonFactory);

    return _usersAuthLoginPost(body: body);
  }

  ///Log a user, to allow authenticated endpoints
  @Post(path: '/users/auth/login')
  Future<chopper.Response<LoginResponse>> _usersAuthLoginPost(
      {@Body() required LoginRequest? body});

  ///Get all the report of a user
  ///@param roles
  ///@param id
  Future<chopper.Response<List<ReportResponse>>> reportsReportsAdminIdGet(
      {String? roles, required num? id}) {
    generatedMapping.putIfAbsent(
        ReportResponse, () => ReportResponse.fromJsonFactory);

    return _reportsReportsAdminIdGet(roles: roles, id: id);
  }

  ///Get all the report of a user
  ///@param roles
  ///@param id
  @Get(path: '/reports/reports/admin/{id}')
  Future<chopper.Response<List<ReportResponse>>> _reportsReportsAdminIdGet(
      {@Header('roles') String? roles, @Path('id') required num? id});

  ///Create a new account. Will send a confirmation mail to the given address
  Future<chopper.Response<AuthTokenResponse>> usersAuthRegisterPost(
      {required UserCreationRequest? body}) {
    generatedMapping.putIfAbsent(
        AuthTokenResponse, () => AuthTokenResponse.fromJsonFactory);

    return _usersAuthRegisterPost(body: body);
  }

  ///Create a new account. Will send a confirmation mail to the given address
  @Post(path: '/users/auth/register')
  Future<chopper.Response<AuthTokenResponse>> _usersAuthRegisterPost(
      {@Body() required UserCreationRequest? body});

  ///Delete the activity
  ///@param userId
  ///@param groupId
  ///@param activityId
  Future<chopper.Response> planningGroupsGroupIdPlanningActivityIdDelete(
      {String? userId, required num? groupId, required num? activityId}) {
    return _planningGroupsGroupIdPlanningActivityIdDelete(
        userId: userId, groupId: groupId, activityId: activityId);
  }

  ///Delete the activity
  ///@param userId
  ///@param groupId
  ///@param activityId
  @Delete(path: '/planning/groups/{groupId}/planning/{activityId}')
  Future<chopper.Response> _planningGroupsGroupIdPlanningActivityIdDelete(
      {@Header('userId') String? userId,
      @Path('groupId') required num? groupId,
      @Path('activityId') required num? activityId});

  ///Update the activity
  ///@param userId
  ///@param groupId
  ///@param activityId
  Future<chopper.Response<ActivityResponse>>
      planningGroupsGroupIdPlanningActivityIdPatch(
          {String? userId,
          required num? groupId,
          required num? activityId,
          required UpdateActivityRequest? body}) {
    generatedMapping.putIfAbsent(
        ActivityResponse, () => ActivityResponse.fromJsonFactory);

    return _planningGroupsGroupIdPlanningActivityIdPatch(
        userId: userId, groupId: groupId, activityId: activityId, body: body);
  }

  ///Update the activity
  ///@param userId
  ///@param groupId
  ///@param activityId
  @Patch(path: '/planning/groups/{groupId}/planning/{activityId}')
  Future<chopper.Response<ActivityResponse>>
      _planningGroupsGroupIdPlanningActivityIdPatch(
          {@Header('userId') String? userId,
          @Path('groupId') required num? groupId,
          @Path('activityId') required num? activityId,
          @Body() required UpdateActivityRequest? body});

  ///
  ///@param groupId
  ///@param expenseId
  Future<chopper.Response> expensesExpensesGroupIdExpenseIdDelete(
      {required num? groupId, required num? expenseId}) {
    return _expensesExpensesGroupIdExpenseIdDelete(
        groupId: groupId, expenseId: expenseId);
  }

  ///
  ///@param groupId
  ///@param expenseId
  @Delete(path: '/expenses/expenses/{groupId}/{expenseId}')
  Future<chopper.Response> _expensesExpensesGroupIdExpenseIdDelete(
      {@Path('groupId') required num? groupId,
      @Path('expenseId') required num? expenseId});

  ///Get a survey by id
  ///@param userId
  ///@param id
  Future<chopper.Response<SurveyModel>> chatSurveysIdGet(
      {String? userId, required num? id}) {
    generatedMapping.putIfAbsent(
        SurveyModel, () => SurveyModel.fromJsonFactory);

    return _chatSurveysIdGet(userId: userId, id: id);
  }

  ///Get a survey by id
  ///@param userId
  ///@param id
  @Get(path: '/chat/surveys/{id}')
  Future<chopper.Response<SurveyModel>> _chatSurveysIdGet(
      {@Header('userId') String? userId, @Path('id') required num? id});

  ///Create a survey in a channel
  ///@param userId
  ///@param id
  Future<chopper.Response<SurveyModel>> chatSurveysIdPost(
      {String? userId, required num? id, required PostSurveyRequest? body}) {
    generatedMapping.putIfAbsent(
        SurveyModel, () => SurveyModel.fromJsonFactory);

    return _chatSurveysIdPost(userId: userId, id: id, body: body);
  }

  ///Create a survey in a channel
  ///@param userId
  ///@param id
  @Post(path: '/chat/surveys/{id}')
  Future<chopper.Response<SurveyModel>> _chatSurveysIdPost(
      {@Header('userId') String? userId,
      @Path('id') required num? id,
      @Body() required PostSurveyRequest? body});

  ///Delete a survey in a channel
  ///@param userId
  ///@param id
  Future<chopper.Response> chatSurveysIdDelete(
      {String? userId, required num? id}) {
    return _chatSurveysIdDelete(userId: userId, id: id);
  }

  ///Delete a survey in a channel
  ///@param userId
  ///@param id
  @Delete(path: '/chat/surveys/{id}')
  Future<chopper.Response> _chatSurveysIdDelete(
      {@Header('userId') String? userId, @Path('id') required num? id});

  ///Update a survey in a channel
  ///@param userId
  ///@param id
  Future<chopper.Response<SurveyModel>> chatSurveysIdPatch(
      {String? userId, required num? id, required UpdateSurveyRequest? body}) {
    generatedMapping.putIfAbsent(
        SurveyModel, () => SurveyModel.fromJsonFactory);

    return _chatSurveysIdPatch(userId: userId, id: id, body: body);
  }

  ///Update a survey in a channel
  ///@param userId
  ///@param id
  @Patch(path: '/chat/surveys/{id}')
  Future<chopper.Response<SurveyModel>> _chatSurveysIdPatch(
      {@Header('userId') String? userId,
      @Path('id') required num? id,
      @Body() required UpdateSurveyRequest? body});

  ///Get the information related to the member
  ///@param id
  ///@param userId
  Future<chopper.Response<GroupMemberModel>> groupsIdUsersUserIdGet(
      {required num? id, required num? userId}) {
    generatedMapping.putIfAbsent(
        GroupMemberModel, () => GroupMemberModel.fromJsonFactory);

    return _groupsIdUsersUserIdGet(id: id, userId: userId);
  }

  ///Get the information related to the member
  ///@param id
  ///@param userId
  @Get(path: '/groups/{id}/users/{userId}')
  Future<chopper.Response<GroupMemberModel>> _groupsIdUsersUserIdGet(
      {@Path('id') required num? id, @Path('userId') required num? userId});

  ///
  ///@param group
  Future<chopper.Response<List<ExpenseModel>>> expensesExpensesGroupGet(
      {required num? group}) {
    generatedMapping.putIfAbsent(
        ExpenseModel, () => ExpenseModel.fromJsonFactory);

    return _expensesExpensesGroupGet(group: group);
  }

  ///
  ///@param group
  @Get(path: '/expenses/expenses/{group}')
  Future<chopper.Response<List<ExpenseModel>>> _expensesExpensesGroupGet(
      {@Path('group') required num? group});

  ///Remove the user from the given activity
  ///@param groupId
  ///@param activityId
  ///@param userId
  Future<chopper.Response> planningGroupsGroupIdPlanningActivityIdLeavePatch(
      {required num? groupId, required num? activityId, required num? userId}) {
    return _planningGroupsGroupIdPlanningActivityIdLeavePatch(
        groupId: groupId, activityId: activityId, userId: userId);
  }

  ///Remove the user from the given activity
  ///@param groupId
  ///@param activityId
  ///@param userId
  @Patch(
      path: '/planning/groups/{groupId}/planning/{activityId}/leave',
      optionalBody: true)
  Future<chopper.Response> _planningGroupsGroupIdPlanningActivityIdLeavePatch(
      {@Path('groupId') required num? groupId,
      @Path('activityId') required num? activityId,
      @Query('userId') required num? userId});

  ///Create a profile and start the matchmaking
  ///@param user_id
  Future<chopper.Response> profilesMatchmakingPost(
      {required num? userId, required ProfileCreationRequest? body}) {
    return _profilesMatchmakingPost(userId: userId, body: body);
  }

  ///Create a profile and start the matchmaking
  ///@param user_id
  @Post(path: '/profiles/matchmaking')
  Future<chopper.Response> _profilesMatchmakingPost(
      {@Query('user_id') required num? userId,
      @Body() required ProfileCreationRequest? body});

  ///Start the matchmaking with an existing profile
  ///@param user_id
  ///@param profile_id
  Future<chopper.Response> profilesMatchmakingPatch(
      {required num? userId, required num? profileId}) {
    return _profilesMatchmakingPatch(userId: userId, profileId: profileId);
  }

  ///Start the matchmaking with an existing profile
  ///@param user_id
  ///@param profile_id
  @Patch(path: '/profiles/matchmaking', optionalBody: true)
  Future<chopper.Response> _profilesMatchmakingPatch(
      {@Query('user_id') required num? userId,
      @Query('profile_id') required num? profileId});

  ///Retrieve 10 places around geographic coordinates
  Future<chopper.Response<List<PlaceResponse>>> placesCoordinatesPost(
      {required PlacesFromCoordinatesRequest? body}) {
    generatedMapping.putIfAbsent(
        PlaceResponse, () => PlaceResponse.fromJsonFactory);

    return _placesCoordinatesPost(body: body);
  }

  ///Retrieve 10 places around geographic coordinates
  @Post(path: '/places/coordinates')
  Future<chopper.Response<List<PlaceResponse>>> _placesCoordinatesPost(
      {@Body() required PlacesFromCoordinatesRequest? body});

  ///Delete the profile of a user
  ///@param userId
  ///@param profile
  Future<chopper.Response> profilesProfilesProfileDelete(
      {String? userId, required num? profile}) {
    return _profilesProfilesProfileDelete(userId: userId, profile: profile);
  }

  ///Delete the profile of a user
  ///@param userId
  ///@param profile
  @Delete(path: '/profiles/profiles/{profile}')
  Future<chopper.Response> _profilesProfilesProfileDelete(
      {@Header('userId') String? userId,
      @Path('profile') required num? profile});

  ///
  ///@param group
  ///@param user
  Future<chopper.Response<List<MoneyDueResponse>>>
      expensesExpensesGroupUserUserDebtsDueGet(
          {required num? group, required num? user}) {
    generatedMapping.putIfAbsent(
        MoneyDueResponse, () => MoneyDueResponse.fromJsonFactory);

    return _expensesExpensesGroupUserUserDebtsDueGet(group: group, user: user);
  }

  ///
  ///@param group
  ///@param user
  @Get(path: '/expenses/expenses/{group}/user/{user}/debts/due')
  Future<chopper.Response<List<MoneyDueResponse>>>
      _expensesExpensesGroupUserUserDebtsDueGet(
          {@Path('group') required num? group,
          @Path('user') required num? user});

  ///Create a recommendation
  ///@param userId
  Future<chopper.Response<RecommendationResponse>> reportsRecommendationsPost(
      {String? userId, required SubmitRecommendationRequest? body}) {
    generatedMapping.putIfAbsent(
        RecommendationResponse, () => RecommendationResponse.fromJsonFactory);

    return _reportsRecommendationsPost(userId: userId, body: body);
  }

  ///Create a recommendation
  ///@param userId
  @Post(path: '/reports/recommendations')
  Future<chopper.Response<RecommendationResponse>> _reportsRecommendationsPost(
      {@Header('userId') String? userId,
      @Body() required SubmitRecommendationRequest? body});

  ///Get all pinned messages
  ///@param channel_id
  ///@param username
  Future<chopper.Response<List<MessageResponse>>> chatChatChannelIdPinnedGet(
      {required num? channelId, String? username}) {
    generatedMapping.putIfAbsent(
        MessageResponse, () => MessageResponse.fromJsonFactory);

    return _chatChatChannelIdPinnedGet(
        channelId: channelId, username: username);
  }

  ///Get all pinned messages
  ///@param channel_id
  ///@param username
  @Get(path: '/chat/chat/{channel_id}/pinned')
  Future<chopper.Response<List<MessageResponse>>> _chatChatChannelIdPinnedGet(
      {@Path('channel_id') required num? channelId,
      @Header('username') String? username});

  ///Retrieve 10 places around an address
  Future<chopper.Response<List<PlaceResponse>>> placesAddressPost(
      {required PlacesFromAddressRequest? body}) {
    generatedMapping.putIfAbsent(
        PlaceResponse, () => PlaceResponse.fromJsonFactory);

    return _placesAddressPost(body: body);
  }

  ///Retrieve 10 places around an address
  @Post(path: '/places/address')
  Future<chopper.Response<List<PlaceResponse>>> _placesAddressPost(
      {@Body() required PlacesFromAddressRequest? body});

  ///
  ///@param id
  Future<chopper.Response<List<num>>> groupsIdMembersGet({required num? id}) {
    return _groupsIdMembersGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/groups/{id}/members')
  Future<chopper.Response<List<num>>> _groupsIdMembersGet(
      {@Path('id') required num? id});

  ///
  ///@param roles
  Future<chopper.Response<List<ProfileModel>>> profilesProfilesActiveGet(
      {String? roles}) {
    generatedMapping.putIfAbsent(
        ProfileModel, () => ProfileModel.fromJsonFactory);

    return _profilesProfilesActiveGet(roles: roles);
  }

  ///
  ///@param roles
  @Get(path: '/profiles/profiles/active')
  Future<chopper.Response<List<ProfileModel>>> _profilesProfilesActiveGet(
      {@Header('roles') String? roles});

  ///Get the state of a match making task
  ///@param taskId
  Future<chopper.Response<MatchMakingResult>> profilesMatchmakingTaskIdGet(
      {required num? taskId}) {
    generatedMapping.putIfAbsent(
        MatchMakingResult, () => MatchMakingResult.fromJsonFactory);

    return _profilesMatchmakingTaskIdGet(taskId: taskId);
  }

  ///Get the state of a match making task
  ///@param taskId
  @Get(path: '/profiles/matchmaking/{taskId}')
  Future<chopper.Response<MatchMakingResult>> _profilesMatchmakingTaskIdGet(
      {@Path('taskId') required num? taskId});

  ///Get the group's activities
  ///@param userId
  ///@param groupId
  Future<chopper.Response<List<ActivityResponse>>>
      planningGroupsGroupIdPlanningGet(
          {String? userId, required num? groupId}) {
    generatedMapping.putIfAbsent(
        ActivityResponse, () => ActivityResponse.fromJsonFactory);

    return _planningGroupsGroupIdPlanningGet(userId: userId, groupId: groupId);
  }

  ///Get the group's activities
  ///@param userId
  ///@param groupId
  @Get(path: '/planning/groups/{groupId}/planning')
  Future<chopper.Response<List<ActivityResponse>>>
      _planningGroupsGroupIdPlanningGet(
          {@Header('userId') String? userId,
          @Path('groupId') required num? groupId});

  ///Add a new activity to the group's planning
  ///@param userId
  ///@param groupId
  Future<chopper.Response<ActivityResponse>> planningGroupsGroupIdPlanningPost(
      {String? userId,
      required num? groupId,
      required CreateActivityRequest? body}) {
    generatedMapping.putIfAbsent(
        ActivityResponse, () => ActivityResponse.fromJsonFactory);

    return _planningGroupsGroupIdPlanningPost(
        userId: userId, groupId: groupId, body: body);
  }

  ///Add a new activity to the group's planning
  ///@param userId
  ///@param groupId
  @Post(path: '/planning/groups/{groupId}/planning')
  Future<chopper.Response<ActivityResponse>> _planningGroupsGroupIdPlanningPost(
      {@Header('userId') String? userId,
      @Path('groupId') required num? groupId,
      @Body() required CreateActivityRequest? body});

  ///
  ///@param roles
  ///@param id
  Future<chopper.Response<UserResponse>> usersUsersIdGet(
      {String? roles, required num? id}) {
    generatedMapping.putIfAbsent(
        UserResponse, () => UserResponse.fromJsonFactory);

    return _usersUsersIdGet(roles: roles, id: id);
  }

  ///
  ///@param roles
  ///@param id
  @Get(path: '/users/users/{id}')
  Future<chopper.Response<UserResponse>> _usersUsersIdGet(
      {@Header('roles') String? roles, @Path('id') required num? id});

  ///Get the most recent channel's messages, by pages of size 50
  ///@param channel_id
  ///@param page
  ///@param username
  Future<chopper.Response> chatChatChannelIdGet(
      {required num? channelId, int? page, String? username}) {
    return _chatChatChannelIdGet(
        channelId: channelId, page: page, username: username);
  }

  ///Get the most recent channel's messages, by pages of size 50
  ///@param channel_id
  ///@param page
  ///@param username
  @Get(path: '/chat/chat/{channel_id}')
  Future<chopper.Response> _chatChatChannelIdGet(
      {@Path('channel_id') required num? channelId,
      @Query('page') int? page,
      @Header('username') String? username});

  ///Log a user, to allow authenticated endpoints
  Future<chopper.Response<GoogleAuthResponse>> usersAuthGooglePost(
      {required GoogleRequest? body}) {
    generatedMapping.putIfAbsent(
        GoogleAuthResponse, () => GoogleAuthResponse.fromJsonFactory);

    return _usersAuthGooglePost(body: body);
  }

  ///Log a user, to allow authenticated endpoints
  @Post(path: '/users/auth/google')
  Future<chopper.Response<GoogleAuthResponse>> _usersAuthGooglePost(
      {@Body() required GoogleRequest? body});

  ///Create a profile
  ///@param userId
  Future<chopper.Response<ProfileModel>> profilesProfilesPost(
      {String? userId, required ProfileCreationRequest? body}) {
    generatedMapping.putIfAbsent(
        ProfileModel, () => ProfileModel.fromJsonFactory);

    return _profilesProfilesPost(userId: userId, body: body);
  }

  ///Create a profile
  ///@param userId
  @Post(path: '/profiles/profiles')
  Future<chopper.Response<ProfileModel>> _profilesProfilesPost(
      {@Header('userId') String? userId,
      @Body() required ProfileCreationRequest? body});

  ///Get all the memories from a group
  ///@param groupId
  Future<chopper.Response<GroupMemoriesResponse>> groupsGroupIdMemoriesGet(
      {required num? groupId}) {
    generatedMapping.putIfAbsent(
        GroupMemoriesResponse, () => GroupMemoriesResponse.fromJsonFactory);

    return _groupsGroupIdMemoriesGet(groupId: groupId);
  }

  ///Get all the memories from a group
  ///@param groupId
  @Get(path: '/groups/{groupId}/memories')
  Future<chopper.Response<GroupMemoriesResponse>> _groupsGroupIdMemoriesGet(
      {@Path('groupId') required num? groupId});

  ///Add memory to a group
  ///@param groupId
  Future<chopper.Response<GroupMemoriesResponse>> groupsGroupIdMemoriesPost(
      {required num? groupId, required GroupMemoryRequest? body}) {
    generatedMapping.putIfAbsent(
        GroupMemoriesResponse, () => GroupMemoriesResponse.fromJsonFactory);

    return _groupsGroupIdMemoriesPost(groupId: groupId, body: body);
  }

  ///Add memory to a group
  ///@param groupId
  @Post(path: '/groups/{groupId}/memories')
  Future<chopper.Response<GroupMemoriesResponse>> _groupsGroupIdMemoriesPost(
      {@Path('groupId') required num? groupId,
      @Body() required GroupMemoryRequest? body});

  ///Accept the invitation to the group
  ///@param group
  ///@param userId
  Future<chopper.Response> groupsPrivateGroupJoinPatch(
      {required num? group,
      String? userId,
      required JoinGroupWithoutInviteModel? body}) {
    return _groupsPrivateGroupJoinPatch(
        group: group, userId: userId, body: body);
  }

  ///Accept the invitation to the group
  ///@param group
  ///@param userId
  @Patch(path: '/groups/private/{group}/join/')
  Future<chopper.Response> _groupsPrivateGroupJoinPatch(
      {@Path('group') required num? group,
      @Header('userId') String? userId,
      @Body() required JoinGroupWithoutInviteModel? body});

  ///
  ///@param group
  ///@param user
  Future<chopper.Response<List<MoneyDueResponse>>>
      expensesExpensesGroupUserUserDebtsGet(
          {required num? group, required num? user}) {
    generatedMapping.putIfAbsent(
        MoneyDueResponse, () => MoneyDueResponse.fromJsonFactory);

    return _expensesExpensesGroupUserUserDebtsGet(group: group, user: user);
  }

  ///
  ///@param group
  ///@param user
  @Get(path: '/expenses/expenses/{group}/user/{user}/debts')
  Future<chopper.Response<List<MoneyDueResponse>>>
      _expensesExpensesGroupUserUserDebtsGet(
          {@Path('group') required num? group,
          @Path('user') required num? user});

  ///Get the firebase token of this user
  ///@param id
  Future<chopper.Response<FirebaseTokenResponse>> usersUsersIdFirebaseGet(
      {required num? id}) {
    generatedMapping.putIfAbsent(
        FirebaseTokenResponse, () => FirebaseTokenResponse.fromJsonFactory);

    return _usersUsersIdFirebaseGet(id: id);
  }

  ///Get the firebase token of this user
  ///@param id
  @Get(path: '/users/users/{id}/firebase')
  Future<chopper.Response<FirebaseTokenResponse>> _usersUsersIdFirebaseGet(
      {@Path('id') required num? id});

  ///Update the firebase token associated to this user. If the token is not provided, it will be unset
  ///@param id
  ///@param token
  Future<chopper.Response> usersUsersIdFirebasePatch(
      {required num? id, String? token}) {
    return _usersUsersIdFirebasePatch(id: id, token: token);
  }

  ///Update the firebase token associated to this user. If the token is not provided, it will be unset
  ///@param id
  ///@param token
  @Patch(path: '/users/users/{id}/firebase', optionalBody: true)
  Future<chopper.Response> _usersUsersIdFirebasePatch(
      {@Path('id') required num? id, @Query('token') String? token});

  ///
  ///@param id
  Future<chopper.Response<BooleanResponse>> usersUsersIdExistsGet(
      {required num? id}) {
    generatedMapping.putIfAbsent(
        BooleanResponse, () => BooleanResponse.fromJsonFactory);

    return _usersUsersIdExistsGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/users/users/{id}/exists')
  Future<chopper.Response<BooleanResponse>> _usersUsersIdExistsGet(
      {@Path('id') required num? id});

  ///Make a private group public
  ///@param username
  ///@param groupId
  Future<chopper.Response> groupsPrivateGroupIdPublicPatch(
      {String? username,
      required num? groupId,
      required ProfileCreationRequest? body}) {
    return _groupsPrivateGroupIdPublicPatch(
        username: username, groupId: groupId, body: body);
  }

  ///Make a private group public
  ///@param username
  ///@param groupId
  @Patch(path: '/groups/private/{groupId}/public')
  Future<chopper.Response> _groupsPrivateGroupIdPublicPatch(
      {@Header('username') String? username,
      @Path('groupId') required num? groupId,
      @Body() required ProfileCreationRequest? body});

  ///Get all the surveys in a channel
  ///@param userId
  ///@param id
  Future<chopper.Response<List<SurveyModel>>> chatSurveysQuizzIdGet(
      {String? userId, required num? id}) {
    generatedMapping.putIfAbsent(
        SurveyModel, () => SurveyModel.fromJsonFactory);

    return _chatSurveysQuizzIdGet(userId: userId, id: id);
  }

  ///Get all the surveys in a channel
  ///@param userId
  ///@param id
  @Get(path: '/chat/surveys/quizz/{id}')
  Future<chopper.Response<List<SurveyModel>>> _chatSurveysQuizzIdGet(
      {@Header('userId') String? userId, @Path('id') required num? id});

  ///Pin a message
  ///@param message_id
  ///@param pin
  Future<chopper.Response<MessageResponse>> chatChatMessageIdPinnedPatch(
      {required num? messageId, bool? pin}) {
    generatedMapping.putIfAbsent(
        MessageResponse, () => MessageResponse.fromJsonFactory);

    return _chatChatMessageIdPinnedPatch(messageId: messageId, pin: pin);
  }

  ///Pin a message
  ///@param message_id
  ///@param pin
  @Patch(path: '/chat/chat/{message_id}/pinned', optionalBody: true)
  Future<chopper.Response<MessageResponse>> _chatChatMessageIdPinnedPatch(
      {@Path('message_id') required num? messageId, @Query('pin') bool? pin});

  ///Confirm a user's email
  ///@param id
  Future<chopper.Response> usersAuthIdConfirmationPatch(
      {required num? id, required ConfirmationCodeModel? body}) {
    return _usersAuthIdConfirmationPatch(id: id, body: body);
  }

  ///Confirm a user's email
  ///@param id
  @Patch(path: '/users/auth/{id}/confirmation')
  Future<chopper.Response> _usersAuthIdConfirmationPatch(
      {@Path('id') required num? id,
      @Body() required ConfirmationCodeModel? body});

  ///
  ///@param id
  Future<chopper.Response<BooleanResponse>> groupsIdExistsGet(
      {required num? id}) {
    generatedMapping.putIfAbsent(
        BooleanResponse, () => BooleanResponse.fromJsonFactory);

    return _groupsIdExistsGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/groups/{id}/exists')
  Future<chopper.Response<BooleanResponse>> _groupsIdExistsGet(
      {@Path('id') required num? id});

  ///Used to receive a confirmation to update a password
  Future<chopper.Response> usersAuthForgotPasswordPost(
      {required ForgotPasswordRequest? body}) {
    return _usersAuthForgotPasswordPost(body: body);
  }

  ///Used to receive a confirmation to update a password
  @Post(path: '/users/auth/forgot/password')
  Future<chopper.Response> _usersAuthForgotPasswordPost(
      {@Body() required ForgotPasswordRequest? body});

  ///Log a user, to allow authenticated endpoints
  Future<chopper.Response<LoginResponse>> usersAuthLoginAdminPost(
      {required LoginRequest? body}) {
    generatedMapping.putIfAbsent(
        LoginResponse, () => LoginResponse.fromJsonFactory);

    return _usersAuthLoginAdminPost(body: body);
  }

  ///Log a user, to allow authenticated endpoints
  @Post(path: '/users/auth/login/admin')
  Future<chopper.Response<LoginResponse>> _usersAuthLoginAdminPost(
      {@Body() required LoginRequest? body});

  ///Delete a report
  ///@param userId
  ///@param id
  Future<chopper.Response> reportsReportsIdDelete(
      {String? userId, required num? id}) {
    return _reportsReportsIdDelete(userId: userId, id: id);
  }

  ///Delete a report
  ///@param userId
  ///@param id
  @Delete(path: '/reports/reports/{id}/')
  Future<chopper.Response> _reportsReportsIdDelete(
      {@Header('userId') String? userId, @Path('id') required num? id});

  ///
  ///@param group
  Future<chopper.Response<List<BalanceResponse>>>
      expensesExpensesGroupBalancesGet({required num? group}) {
    generatedMapping.putIfAbsent(
        BalanceResponse, () => BalanceResponse.fromJsonFactory);

    return _expensesExpensesGroupBalancesGet(group: group);
  }

  ///
  ///@param group
  @Get(path: '/expenses/expenses/{group}/balances')
  Future<chopper.Response<List<BalanceResponse>>>
      _expensesExpensesGroupBalancesGet({@Path('group') required num? group});
}

@JsonSerializable(explicitToJson: true)
class ForgotPasswordRequest {
  ForgotPasswordRequest({
    this.email,
  });

  factory ForgotPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordRequestFromJson(json);

  @JsonKey(name: 'email')
  final String? email;
  static const fromJsonFactory = _$ForgotPasswordRequestFromJson;
  static const toJsonFactory = _$ForgotPasswordRequestToJson;
  Map<String, dynamic> toJson() => _$ForgotPasswordRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ForgotPasswordRequest &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(email) ^ runtimeType.hashCode;
}

extension $ForgotPasswordRequestExtension on ForgotPasswordRequest {
  ForgotPasswordRequest copyWith({String? email}) {
    return ForgotPasswordRequest(email: email ?? this.email);
  }
}

@JsonSerializable(explicitToJson: true)
class VoteModel {
  VoteModel({
    this.id,
    this.voter,
    this.answer,
  });

  factory VoteModel.fromJson(Map<String, dynamic> json) =>
      _$VoteModelFromJson(json);

  @JsonKey(name: 'id')
  final num? id;
  @JsonKey(name: 'voter')
  final num? voter;
  @JsonKey(name: 'answer')
  final PossibleAnswerModel? answer;
  static const fromJsonFactory = _$VoteModelFromJson;
  static const toJsonFactory = _$VoteModelToJson;
  Map<String, dynamic> toJson() => _$VoteModelToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is VoteModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.voter, voter) ||
                const DeepCollectionEquality().equals(other.voter, voter)) &&
            (identical(other.answer, answer) ||
                const DeepCollectionEquality().equals(other.answer, answer)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(voter) ^
      const DeepCollectionEquality().hash(answer) ^
      runtimeType.hashCode;
}

extension $VoteModelExtension on VoteModel {
  VoteModel copyWith({num? id, num? voter, PossibleAnswerModel? answer}) {
    return VoteModel(
        id: id ?? this.id,
        voter: voter ?? this.voter,
        answer: answer ?? this.answer);
  }
}

@JsonSerializable(explicitToJson: true)
class GroupMemoriesResponse {
  GroupMemoriesResponse({
    this.memories,
  });

  factory GroupMemoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$GroupMemoriesResponseFromJson(json);

  @JsonKey(name: 'memories', defaultValue: <String>[])
  final List<String>? memories;
  static const fromJsonFactory = _$GroupMemoriesResponseFromJson;
  static const toJsonFactory = _$GroupMemoriesResponseToJson;
  Map<String, dynamic> toJson() => _$GroupMemoriesResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GroupMemoriesResponse &&
            (identical(other.memories, memories) ||
                const DeepCollectionEquality()
                    .equals(other.memories, memories)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(memories) ^ runtimeType.hashCode;
}

extension $GroupMemoriesResponseExtension on GroupMemoriesResponse {
  GroupMemoriesResponse copyWith({List<String>? memories}) {
    return GroupMemoriesResponse(memories: memories ?? this.memories);
  }
}

@JsonSerializable(explicitToJson: true)
class CreatePrivateGroupRequest {
  CreatePrivateGroupRequest({
    this.name,
    this.description,
    this.maxSize,
  });

  factory CreatePrivateGroupRequest.fromJson(Map<String, dynamic> json) =>
      _$CreatePrivateGroupRequestFromJson(json);

  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'maxSize')
  final int? maxSize;
  static const fromJsonFactory = _$CreatePrivateGroupRequestFromJson;
  static const toJsonFactory = _$CreatePrivateGroupRequestToJson;
  Map<String, dynamic> toJson() => _$CreatePrivateGroupRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreatePrivateGroupRequest &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.maxSize, maxSize) ||
                const DeepCollectionEquality().equals(other.maxSize, maxSize)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(maxSize) ^
      runtimeType.hashCode;
}

extension $CreatePrivateGroupRequestExtension on CreatePrivateGroupRequest {
  CreatePrivateGroupRequest copyWith(
      {String? name, String? description, int? maxSize}) {
    return CreatePrivateGroupRequest(
        name: name ?? this.name,
        description: description ?? this.description,
        maxSize: maxSize ?? this.maxSize);
  }
}

@JsonSerializable(explicitToJson: true)
class PossibleAnswerRequest {
  PossibleAnswerRequest({
    this.content,
    this.rightAnswer,
  });

  factory PossibleAnswerRequest.fromJson(Map<String, dynamic> json) =>
      _$PossibleAnswerRequestFromJson(json);

  @JsonKey(name: 'content')
  final String? content;
  @JsonKey(name: 'rightAnswer')
  final bool? rightAnswer;
  static const fromJsonFactory = _$PossibleAnswerRequestFromJson;
  static const toJsonFactory = _$PossibleAnswerRequestToJson;
  Map<String, dynamic> toJson() => _$PossibleAnswerRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PossibleAnswerRequest &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.rightAnswer, rightAnswer) ||
                const DeepCollectionEquality()
                    .equals(other.rightAnswer, rightAnswer)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(rightAnswer) ^
      runtimeType.hashCode;
}

extension $PossibleAnswerRequestExtension on PossibleAnswerRequest {
  PossibleAnswerRequest copyWith({String? content, bool? rightAnswer}) {
    return PossibleAnswerRequest(
        content: content ?? this.content,
        rightAnswer: rightAnswer ?? this.rightAnswer);
  }
}

@JsonSerializable(explicitToJson: true)
class GroupMemberModel {
  GroupMemberModel({
    this.userId,
    this.firstname,
    this.lastname,
    this.profilePicture,
  });

  factory GroupMemberModel.fromJson(Map<String, dynamic> json) =>
      _$GroupMemberModelFromJson(json);

  @JsonKey(name: 'userId')
  final num? userId;
  @JsonKey(name: 'firstname')
  final String? firstname;
  @JsonKey(name: 'lastname')
  final String? lastname;
  @JsonKey(name: 'profilePicture')
  final String? profilePicture;
  static const fromJsonFactory = _$GroupMemberModelFromJson;
  static const toJsonFactory = _$GroupMemberModelToJson;
  Map<String, dynamic> toJson() => _$GroupMemberModelToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GroupMemberModel &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.firstname, firstname) ||
                const DeepCollectionEquality()
                    .equals(other.firstname, firstname)) &&
            (identical(other.lastname, lastname) ||
                const DeepCollectionEquality()
                    .equals(other.lastname, lastname)) &&
            (identical(other.profilePicture, profilePicture) ||
                const DeepCollectionEquality()
                    .equals(other.profilePicture, profilePicture)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(firstname) ^
      const DeepCollectionEquality().hash(lastname) ^
      const DeepCollectionEquality().hash(profilePicture) ^
      runtimeType.hashCode;
}

extension $GroupMemberModelExtension on GroupMemberModel {
  GroupMemberModel copyWith(
      {num? userId,
      String? firstname,
      String? lastname,
      String? profilePicture}) {
    return GroupMemberModel(
        userId: userId ?? this.userId,
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        profilePicture: profilePicture ?? this.profilePicture);
  }
}

@JsonSerializable(explicitToJson: true)
class MatchMakingResponse {
  MatchMakingResponse({
    this.taskId,
    this.errorMessage,
  });

  factory MatchMakingResponse.fromJson(Map<String, dynamic> json) =>
      _$MatchMakingResponseFromJson(json);

  @JsonKey(name: 'taskId')
  final num? taskId;
  @JsonKey(name: 'errorMessage')
  final String? errorMessage;
  static const fromJsonFactory = _$MatchMakingResponseFromJson;
  static const toJsonFactory = _$MatchMakingResponseToJson;
  Map<String, dynamic> toJson() => _$MatchMakingResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MatchMakingResponse &&
            (identical(other.taskId, taskId) ||
                const DeepCollectionEquality().equals(other.taskId, taskId)) &&
            (identical(other.errorMessage, errorMessage) ||
                const DeepCollectionEquality()
                    .equals(other.errorMessage, errorMessage)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(taskId) ^
      const DeepCollectionEquality().hash(errorMessage) ^
      runtimeType.hashCode;
}

extension $MatchMakingResponseExtension on MatchMakingResponse {
  MatchMakingResponse copyWith({num? taskId, String? errorMessage}) {
    return MatchMakingResponse(
        taskId: taskId ?? this.taskId,
        errorMessage: errorMessage ?? this.errorMessage);
  }
}

@JsonSerializable(explicitToJson: true)
class ProfileCreationRequest {
  ProfileCreationRequest({
    this.name,
    this.duration,
    this.budget,
    this.destinationTypes,
    this.ages,
    this.travelWithPersonFromSameCity,
    this.travelWithPersonFromSameCountry,
    this.travelWithPersonSameLanguage,
    this.gender,
    this.groupSize,
    this.chillOrVisit,
    this.aboutFood,
    this.goOutAtNight,
    this.sport,
    this.availabilities,
  });

  factory ProfileCreationRequest.fromJson(Map<String, dynamic> json) =>
      _$ProfileCreationRequestFromJson(json);

  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'duration')
  final RangeAnswerModel? duration;
  @JsonKey(name: 'budget')
  final RangeAnswerModel? budget;
  @JsonKey(
      name: 'destinationTypes',
      toJson: profileCreationRequestDestinationTypesListToJson,
      fromJson: profileCreationRequestDestinationTypesListFromJson)
  final List<enums.ProfileCreationRequestDestinationTypes>? destinationTypes;
  @JsonKey(name: 'ages')
  final RangeAnswerModel? ages;
  @JsonKey(
      name: 'travelWithPersonFromSameCity',
      toJson: profileCreationRequestTravelWithPersonFromSameCityToJson,
      fromJson: profileCreationRequestTravelWithPersonFromSameCityFromJson)
  final enums.ProfileCreationRequestTravelWithPersonFromSameCity?
      travelWithPersonFromSameCity;
  @JsonKey(
      name: 'travelWithPersonFromSameCountry',
      toJson: profileCreationRequestTravelWithPersonFromSameCountryToJson,
      fromJson: profileCreationRequestTravelWithPersonFromSameCountryFromJson)
  final enums.ProfileCreationRequestTravelWithPersonFromSameCountry?
      travelWithPersonFromSameCountry;
  @JsonKey(
      name: 'travelWithPersonSameLanguage',
      toJson: profileCreationRequestTravelWithPersonSameLanguageToJson,
      fromJson: profileCreationRequestTravelWithPersonSameLanguageFromJson)
  final enums.ProfileCreationRequestTravelWithPersonSameLanguage?
      travelWithPersonSameLanguage;
  @JsonKey(
      name: 'gender',
      toJson: profileCreationRequestGenderToJson,
      fromJson: profileCreationRequestGenderFromJson)
  final enums.ProfileCreationRequestGender? gender;
  @JsonKey(name: 'groupSize')
  final RangeAnswerModel? groupSize;
  @JsonKey(
      name: 'chillOrVisit',
      toJson: profileCreationRequestChillOrVisitToJson,
      fromJson: profileCreationRequestChillOrVisitFromJson)
  final enums.ProfileCreationRequestChillOrVisit? chillOrVisit;
  @JsonKey(
      name: 'aboutFood',
      toJson: profileCreationRequestAboutFoodToJson,
      fromJson: profileCreationRequestAboutFoodFromJson)
  final enums.ProfileCreationRequestAboutFood? aboutFood;
  @JsonKey(
      name: 'goOutAtNight',
      toJson: profileCreationRequestGoOutAtNightToJson,
      fromJson: profileCreationRequestGoOutAtNightFromJson)
  final enums.ProfileCreationRequestGoOutAtNight? goOutAtNight;
  @JsonKey(
      name: 'sport',
      toJson: profileCreationRequestSportToJson,
      fromJson: profileCreationRequestSportFromJson)
  final enums.ProfileCreationRequestSport? sport;
  @JsonKey(name: 'availabilities', defaultValue: <AvailabilityAnswerModel>[])
  final List<AvailabilityAnswerModel>? availabilities;
  static const fromJsonFactory = _$ProfileCreationRequestFromJson;
  static const toJsonFactory = _$ProfileCreationRequestToJson;
  Map<String, dynamic> toJson() => _$ProfileCreationRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ProfileCreationRequest &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.budget, budget) ||
                const DeepCollectionEquality().equals(other.budget, budget)) &&
            (identical(other.destinationTypes, destinationTypes) ||
                const DeepCollectionEquality()
                    .equals(other.destinationTypes, destinationTypes)) &&
            (identical(other.ages, ages) ||
                const DeepCollectionEquality().equals(other.ages, ages)) &&
            (identical(other.travelWithPersonFromSameCity, travelWithPersonFromSameCity) ||
                const DeepCollectionEquality().equals(
                    other.travelWithPersonFromSameCity,
                    travelWithPersonFromSameCity)) &&
            (identical(other.travelWithPersonFromSameCountry,
                    travelWithPersonFromSameCountry) ||
                const DeepCollectionEquality().equals(
                    other.travelWithPersonFromSameCountry,
                    travelWithPersonFromSameCountry)) &&
            (identical(other.travelWithPersonSameLanguage, travelWithPersonSameLanguage) ||
                const DeepCollectionEquality().equals(
                    other.travelWithPersonSameLanguage,
                    travelWithPersonSameLanguage)) &&
            (identical(other.gender, gender) ||
                const DeepCollectionEquality().equals(other.gender, gender)) &&
            (identical(other.groupSize, groupSize) ||
                const DeepCollectionEquality()
                    .equals(other.groupSize, groupSize)) &&
            (identical(other.chillOrVisit, chillOrVisit) ||
                const DeepCollectionEquality()
                    .equals(other.chillOrVisit, chillOrVisit)) &&
            (identical(other.aboutFood, aboutFood) ||
                const DeepCollectionEquality()
                    .equals(other.aboutFood, aboutFood)) &&
            (identical(other.goOutAtNight, goOutAtNight) ||
                const DeepCollectionEquality()
                    .equals(other.goOutAtNight, goOutAtNight)) &&
            (identical(other.sport, sport) ||
                const DeepCollectionEquality().equals(other.sport, sport)) &&
            (identical(other.availabilities, availabilities) ||
                const DeepCollectionEquality().equals(other.availabilities, availabilities)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(budget) ^
      const DeepCollectionEquality().hash(destinationTypes) ^
      const DeepCollectionEquality().hash(ages) ^
      const DeepCollectionEquality().hash(travelWithPersonFromSameCity) ^
      const DeepCollectionEquality().hash(travelWithPersonFromSameCountry) ^
      const DeepCollectionEquality().hash(travelWithPersonSameLanguage) ^
      const DeepCollectionEquality().hash(gender) ^
      const DeepCollectionEquality().hash(groupSize) ^
      const DeepCollectionEquality().hash(chillOrVisit) ^
      const DeepCollectionEquality().hash(aboutFood) ^
      const DeepCollectionEquality().hash(goOutAtNight) ^
      const DeepCollectionEquality().hash(sport) ^
      const DeepCollectionEquality().hash(availabilities) ^
      runtimeType.hashCode;
}

extension $ProfileCreationRequestExtension on ProfileCreationRequest {
  ProfileCreationRequest copyWith(
      {String? name,
      RangeAnswerModel? duration,
      RangeAnswerModel? budget,
      List<enums.ProfileCreationRequestDestinationTypes>? destinationTypes,
      RangeAnswerModel? ages,
      enums.ProfileCreationRequestTravelWithPersonFromSameCity?
          travelWithPersonFromSameCity,
      enums.ProfileCreationRequestTravelWithPersonFromSameCountry?
          travelWithPersonFromSameCountry,
      enums.ProfileCreationRequestTravelWithPersonSameLanguage?
          travelWithPersonSameLanguage,
      enums.ProfileCreationRequestGender? gender,
      RangeAnswerModel? groupSize,
      enums.ProfileCreationRequestChillOrVisit? chillOrVisit,
      enums.ProfileCreationRequestAboutFood? aboutFood,
      enums.ProfileCreationRequestGoOutAtNight? goOutAtNight,
      enums.ProfileCreationRequestSport? sport,
      List<AvailabilityAnswerModel>? availabilities}) {
    return ProfileCreationRequest(
        name: name ?? this.name,
        duration: duration ?? this.duration,
        budget: budget ?? this.budget,
        destinationTypes: destinationTypes ?? this.destinationTypes,
        ages: ages ?? this.ages,
        travelWithPersonFromSameCity:
            travelWithPersonFromSameCity ?? this.travelWithPersonFromSameCity,
        travelWithPersonFromSameCountry: travelWithPersonFromSameCountry ??
            this.travelWithPersonFromSameCountry,
        travelWithPersonSameLanguage:
            travelWithPersonSameLanguage ?? this.travelWithPersonSameLanguage,
        gender: gender ?? this.gender,
        groupSize: groupSize ?? this.groupSize,
        chillOrVisit: chillOrVisit ?? this.chillOrVisit,
        aboutFood: aboutFood ?? this.aboutFood,
        goOutAtNight: goOutAtNight ?? this.goOutAtNight,
        sport: sport ?? this.sport,
        availabilities: availabilities ?? this.availabilities);
  }
}

@JsonSerializable(explicitToJson: true)
class SubmitRecommendationRequest {
  SubmitRecommendationRequest({
    this.reviewedUserId,
    this.comment,
  });

  factory SubmitRecommendationRequest.fromJson(Map<String, dynamic> json) =>
      _$SubmitRecommendationRequestFromJson(json);

  @JsonKey(name: 'reviewedUserId')
  final num? reviewedUserId;
  @JsonKey(name: 'comment')
  final String? comment;
  static const fromJsonFactory = _$SubmitRecommendationRequestFromJson;
  static const toJsonFactory = _$SubmitRecommendationRequestToJson;
  Map<String, dynamic> toJson() => _$SubmitRecommendationRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SubmitRecommendationRequest &&
            (identical(other.reviewedUserId, reviewedUserId) ||
                const DeepCollectionEquality()
                    .equals(other.reviewedUserId, reviewedUserId)) &&
            (identical(other.comment, comment) ||
                const DeepCollectionEquality().equals(other.comment, comment)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(reviewedUserId) ^
      const DeepCollectionEquality().hash(comment) ^
      runtimeType.hashCode;
}

extension $SubmitRecommendationRequestExtension on SubmitRecommendationRequest {
  SubmitRecommendationRequest copyWith({num? reviewedUserId, String? comment}) {
    return SubmitRecommendationRequest(
        reviewedUserId: reviewedUserId ?? this.reviewedUserId,
        comment: comment ?? this.comment);
  }
}

@JsonSerializable(explicitToJson: true)
class DebtDetailsResponse {
  DebtDetailsResponse({
    this.indebtedUser,
    this.purchaser,
    this.description,
    this.amountToPay,
    this.date,
  });

  factory DebtDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$DebtDetailsResponseFromJson(json);

  @JsonKey(name: 'indebtedUser')
  final num? indebtedUser;
  @JsonKey(name: 'purchaser')
  final num? purchaser;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'amountToPay')
  final double? amountToPay;
  @JsonKey(name: 'date')
  final DateTime? date;
  static const fromJsonFactory = _$DebtDetailsResponseFromJson;
  static const toJsonFactory = _$DebtDetailsResponseToJson;
  Map<String, dynamic> toJson() => _$DebtDetailsResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DebtDetailsResponse &&
            (identical(other.indebtedUser, indebtedUser) ||
                const DeepCollectionEquality()
                    .equals(other.indebtedUser, indebtedUser)) &&
            (identical(other.purchaser, purchaser) ||
                const DeepCollectionEquality()
                    .equals(other.purchaser, purchaser)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.amountToPay, amountToPay) ||
                const DeepCollectionEquality()
                    .equals(other.amountToPay, amountToPay)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(indebtedUser) ^
      const DeepCollectionEquality().hash(purchaser) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(amountToPay) ^
      const DeepCollectionEquality().hash(date) ^
      runtimeType.hashCode;
}

extension $DebtDetailsResponseExtension on DebtDetailsResponse {
  DebtDetailsResponse copyWith(
      {num? indebtedUser,
      num? purchaser,
      String? description,
      double? amountToPay,
      DateTime? date}) {
    return DebtDetailsResponse(
        indebtedUser: indebtedUser ?? this.indebtedUser,
        purchaser: purchaser ?? this.purchaser,
        description: description ?? this.description,
        amountToPay: amountToPay ?? this.amountToPay,
        date: date ?? this.date);
  }
}

@JsonSerializable(explicitToJson: true)
class ActivityResponse {
  ActivityResponse({
    this.id,
    this.name,
    this.description,
    this.startDate,
    this.endDate,
    this.participants,
    this.color,
    this.location,
    this.icon,
    this.infos,
  });

  factory ActivityResponse.fromJson(Map<String, dynamic> json) =>
      _$ActivityResponseFromJson(json);

  @JsonKey(name: 'id')
  final num? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'startDate')
  final DateTime? startDate;
  @JsonKey(name: 'endDate')
  final DateTime? endDate;
  @JsonKey(name: 'participants', defaultValue: <num>[])
  final List<num>? participants;
  @JsonKey(name: 'color')
  final String? color;
  @JsonKey(name: 'location')
  final String? location;
  @JsonKey(name: 'icon')
  final String? icon;
  @JsonKey(name: 'infos', defaultValue: <String>[])
  final List<String>? infos;
  static const fromJsonFactory = _$ActivityResponseFromJson;
  static const toJsonFactory = _$ActivityResponseToJson;
  Map<String, dynamic> toJson() => _$ActivityResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ActivityResponse &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.participants, participants) ||
                const DeepCollectionEquality()
                    .equals(other.participants, participants)) &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)) &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)) &&
            (identical(other.icon, icon) ||
                const DeepCollectionEquality().equals(other.icon, icon)) &&
            (identical(other.infos, infos) ||
                const DeepCollectionEquality().equals(other.infos, infos)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(participants) ^
      const DeepCollectionEquality().hash(color) ^
      const DeepCollectionEquality().hash(location) ^
      const DeepCollectionEquality().hash(icon) ^
      const DeepCollectionEquality().hash(infos) ^
      runtimeType.hashCode;
}

extension $ActivityResponseExtension on ActivityResponse {
  ActivityResponse copyWith(
      {num? id,
      String? name,
      String? description,
      DateTime? startDate,
      DateTime? endDate,
      List<num>? participants,
      String? color,
      String? location,
      String? icon,
      List<String>? infos}) {
    return ActivityResponse(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        participants: participants ?? this.participants,
        color: color ?? this.color,
        location: location ?? this.location,
        icon: icon ?? this.icon,
        infos: infos ?? this.infos);
  }
}

@JsonSerializable(explicitToJson: true)
class AuthTokenResponse {
  AuthTokenResponse({
    this.token,
  });

  factory AuthTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenResponseFromJson(json);

  @JsonKey(name: 'token')
  final String? token;
  static const fromJsonFactory = _$AuthTokenResponseFromJson;
  static const toJsonFactory = _$AuthTokenResponseToJson;
  Map<String, dynamic> toJson() => _$AuthTokenResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AuthTokenResponse &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(token) ^ runtimeType.hashCode;
}

extension $AuthTokenResponseExtension on AuthTokenResponse {
  AuthTokenResponse copyWith({String? token}) {
    return AuthTokenResponse(token: token ?? this.token);
  }
}

@JsonSerializable(explicitToJson: true)
class CreateActivityRequest {
  CreateActivityRequest({
    this.name,
    this.description,
    this.startDate,
    this.endDate,
    this.participantsIds,
    this.color,
    this.location,
    this.icon,
  });

  factory CreateActivityRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateActivityRequestFromJson(json);

  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'startDate')
  final DateTime? startDate;
  @JsonKey(name: 'endDate')
  final DateTime? endDate;
  @JsonKey(name: 'participantsIds', defaultValue: <num>[])
  final List<num>? participantsIds;
  @JsonKey(name: 'color')
  final String? color;
  @JsonKey(name: 'location')
  final String? location;
  @JsonKey(name: 'icon')
  final String? icon;
  static const fromJsonFactory = _$CreateActivityRequestFromJson;
  static const toJsonFactory = _$CreateActivityRequestToJson;
  Map<String, dynamic> toJson() => _$CreateActivityRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreateActivityRequest &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.participantsIds, participantsIds) ||
                const DeepCollectionEquality()
                    .equals(other.participantsIds, participantsIds)) &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)) &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)) &&
            (identical(other.icon, icon) ||
                const DeepCollectionEquality().equals(other.icon, icon)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(participantsIds) ^
      const DeepCollectionEquality().hash(color) ^
      const DeepCollectionEquality().hash(location) ^
      const DeepCollectionEquality().hash(icon) ^
      runtimeType.hashCode;
}

extension $CreateActivityRequestExtension on CreateActivityRequest {
  CreateActivityRequest copyWith(
      {String? name,
      String? description,
      DateTime? startDate,
      DateTime? endDate,
      List<num>? participantsIds,
      String? color,
      String? location,
      String? icon}) {
    return CreateActivityRequest(
        name: name ?? this.name,
        description: description ?? this.description,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        participantsIds: participantsIds ?? this.participantsIds,
        color: color ?? this.color,
        location: location ?? this.location,
        icon: icon ?? this.icon);
  }
}

@JsonSerializable(explicitToJson: true)
class DeleteUserRequest {
  DeleteUserRequest({
    this.password,
  });

  factory DeleteUserRequest.fromJson(Map<String, dynamic> json) =>
      _$DeleteUserRequestFromJson(json);

  @JsonKey(name: 'password')
  final String? password;
  static const fromJsonFactory = _$DeleteUserRequestFromJson;
  static const toJsonFactory = _$DeleteUserRequestToJson;
  Map<String, dynamic> toJson() => _$DeleteUserRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DeleteUserRequest &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(password) ^ runtimeType.hashCode;
}

extension $DeleteUserRequestExtension on DeleteUserRequest {
  DeleteUserRequest copyWith({String? password}) {
    return DeleteUserRequest(password: password ?? this.password);
  }
}

@JsonSerializable(explicitToJson: true)
class JwtUserDetails {
  JwtUserDetails({
    this.userId,
    this.username,
    this.roles,
  });

  factory JwtUserDetails.fromJson(Map<String, dynamic> json) =>
      _$JwtUserDetailsFromJson(json);

  @JsonKey(name: 'userId')
  final num? userId;
  @JsonKey(name: 'username')
  final String? username;
  @JsonKey(name: 'roles', defaultValue: <String>[])
  final List<String>? roles;
  static const fromJsonFactory = _$JwtUserDetailsFromJson;
  static const toJsonFactory = _$JwtUserDetailsToJson;
  Map<String, dynamic> toJson() => _$JwtUserDetailsToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is JwtUserDetails &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.roles, roles) ||
                const DeepCollectionEquality().equals(other.roles, roles)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(roles) ^
      runtimeType.hashCode;
}

extension $JwtUserDetailsExtension on JwtUserDetails {
  JwtUserDetails copyWith(
      {num? userId, String? username, List<String>? roles}) {
    return JwtUserDetails(
        userId: userId ?? this.userId,
        username: username ?? this.username,
        roles: roles ?? this.roles);
  }
}

@JsonSerializable(explicitToJson: true)
class UpdatePasswordRequest {
  UpdatePasswordRequest({
    this.oldPassword,
    this.newPassword,
  });

  factory UpdatePasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdatePasswordRequestFromJson(json);

  @JsonKey(name: 'oldPassword')
  final String? oldPassword;
  @JsonKey(name: 'newPassword')
  final String? newPassword;
  static const fromJsonFactory = _$UpdatePasswordRequestFromJson;
  static const toJsonFactory = _$UpdatePasswordRequestToJson;
  Map<String, dynamic> toJson() => _$UpdatePasswordRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdatePasswordRequest &&
            (identical(other.oldPassword, oldPassword) ||
                const DeepCollectionEquality()
                    .equals(other.oldPassword, oldPassword)) &&
            (identical(other.newPassword, newPassword) ||
                const DeepCollectionEquality()
                    .equals(other.newPassword, newPassword)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(oldPassword) ^
      const DeepCollectionEquality().hash(newPassword) ^
      runtimeType.hashCode;
}

extension $UpdatePasswordRequestExtension on UpdatePasswordRequest {
  UpdatePasswordRequest copyWith({String? oldPassword, String? newPassword}) {
    return UpdatePasswordRequest(
        oldPassword: oldPassword ?? this.oldPassword,
        newPassword: newPassword ?? this.newPassword);
  }
}

@JsonSerializable(explicitToJson: true)
class GroupInfoModel {
  GroupInfoModel({
    this.id,
    this.name,
    this.members,
    this.maxSize,
    this.state,
    this.picture,
  });

  factory GroupInfoModel.fromJson(Map<String, dynamic> json) =>
      _$GroupInfoModelFromJson(json);

  @JsonKey(name: 'id')
  final num? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'members', defaultValue: <GroupMemberModel>[])
  final List<GroupMemberModel>? members;
  @JsonKey(name: 'maxSize')
  final int? maxSize;
  @JsonKey(
      name: 'state',
      toJson: groupInfoModelStateToJson,
      fromJson: groupInfoModelStateFromJson)
  final enums.GroupInfoModelState? state;
  @JsonKey(name: 'picture')
  final String? picture;
  static const fromJsonFactory = _$GroupInfoModelFromJson;
  static const toJsonFactory = _$GroupInfoModelToJson;
  Map<String, dynamic> toJson() => _$GroupInfoModelToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GroupInfoModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.members, members) ||
                const DeepCollectionEquality()
                    .equals(other.members, members)) &&
            (identical(other.maxSize, maxSize) ||
                const DeepCollectionEquality()
                    .equals(other.maxSize, maxSize)) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.picture, picture) ||
                const DeepCollectionEquality().equals(other.picture, picture)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(members) ^
      const DeepCollectionEquality().hash(maxSize) ^
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(picture) ^
      runtimeType.hashCode;
}

extension $GroupInfoModelExtension on GroupInfoModel {
  GroupInfoModel copyWith(
      {num? id,
      String? name,
      List<GroupMemberModel>? members,
      int? maxSize,
      enums.GroupInfoModelState? state,
      String? picture}) {
    return GroupInfoModel(
        id: id ?? this.id,
        name: name ?? this.name,
        members: members ?? this.members,
        maxSize: maxSize ?? this.maxSize,
        state: state ?? this.state,
        picture: picture ?? this.picture);
  }
}

@JsonSerializable(explicitToJson: true)
class PlacesFromCoordinatesRequest {
  PlacesFromCoordinatesRequest({
    this.longitude,
    this.latitude,
    this.categories,
    this.radiusMeter,
  });

  factory PlacesFromCoordinatesRequest.fromJson(Map<String, dynamic> json) =>
      _$PlacesFromCoordinatesRequestFromJson(json);

  @JsonKey(name: 'longitude')
  final double? longitude;
  @JsonKey(name: 'latitude')
  final double? latitude;
  @JsonKey(
      name: 'categories',
      toJson: placesFromCoordinatesRequestCategoriesListToJson,
      fromJson: placesFromCoordinatesRequestCategoriesListFromJson)
  final List<enums.PlacesFromCoordinatesRequestCategories>? categories;
  @JsonKey(name: 'radiusMeter')
  final int? radiusMeter;
  static const fromJsonFactory = _$PlacesFromCoordinatesRequestFromJson;
  static const toJsonFactory = _$PlacesFromCoordinatesRequestToJson;
  Map<String, dynamic> toJson() => _$PlacesFromCoordinatesRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PlacesFromCoordinatesRequest &&
            (identical(other.longitude, longitude) ||
                const DeepCollectionEquality()
                    .equals(other.longitude, longitude)) &&
            (identical(other.latitude, latitude) ||
                const DeepCollectionEquality()
                    .equals(other.latitude, latitude)) &&
            (identical(other.categories, categories) ||
                const DeepCollectionEquality()
                    .equals(other.categories, categories)) &&
            (identical(other.radiusMeter, radiusMeter) ||
                const DeepCollectionEquality()
                    .equals(other.radiusMeter, radiusMeter)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(longitude) ^
      const DeepCollectionEquality().hash(latitude) ^
      const DeepCollectionEquality().hash(categories) ^
      const DeepCollectionEquality().hash(radiusMeter) ^
      runtimeType.hashCode;
}

extension $PlacesFromCoordinatesRequestExtension
    on PlacesFromCoordinatesRequest {
  PlacesFromCoordinatesRequest copyWith(
      {double? longitude,
      double? latitude,
      List<enums.PlacesFromCoordinatesRequestCategories>? categories,
      int? radiusMeter}) {
    return PlacesFromCoordinatesRequest(
        longitude: longitude ?? this.longitude,
        latitude: latitude ?? this.latitude,
        categories: categories ?? this.categories,
        radiusMeter: radiusMeter ?? this.radiusMeter);
  }
}

@JsonSerializable(explicitToJson: true)
class CreatePublicGroupRequest {
  CreatePublicGroupRequest({
    this.user1,
    this.user2,
    this.profile1,
    this.profile2,
    this.maxSize,
  });

  factory CreatePublicGroupRequest.fromJson(Map<String, dynamic> json) =>
      _$CreatePublicGroupRequestFromJson(json);

  @JsonKey(name: 'user1')
  final num? user1;
  @JsonKey(name: 'user2')
  final num? user2;
  @JsonKey(name: 'profile1')
  final num? profile1;
  @JsonKey(name: 'profile2')
  final num? profile2;
  @JsonKey(name: 'maxSize')
  final int? maxSize;
  static const fromJsonFactory = _$CreatePublicGroupRequestFromJson;
  static const toJsonFactory = _$CreatePublicGroupRequestToJson;
  Map<String, dynamic> toJson() => _$CreatePublicGroupRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreatePublicGroupRequest &&
            (identical(other.user1, user1) ||
                const DeepCollectionEquality().equals(other.user1, user1)) &&
            (identical(other.user2, user2) ||
                const DeepCollectionEquality().equals(other.user2, user2)) &&
            (identical(other.profile1, profile1) ||
                const DeepCollectionEquality()
                    .equals(other.profile1, profile1)) &&
            (identical(other.profile2, profile2) ||
                const DeepCollectionEquality()
                    .equals(other.profile2, profile2)) &&
            (identical(other.maxSize, maxSize) ||
                const DeepCollectionEquality().equals(other.maxSize, maxSize)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(user1) ^
      const DeepCollectionEquality().hash(user2) ^
      const DeepCollectionEquality().hash(profile1) ^
      const DeepCollectionEquality().hash(profile2) ^
      const DeepCollectionEquality().hash(maxSize) ^
      runtimeType.hashCode;
}

extension $CreatePublicGroupRequestExtension on CreatePublicGroupRequest {
  CreatePublicGroupRequest copyWith(
      {num? user1, num? user2, num? profile1, num? profile2, int? maxSize}) {
    return CreatePublicGroupRequest(
        user1: user1 ?? this.user1,
        user2: user2 ?? this.user2,
        profile1: profile1 ?? this.profile1,
        profile2: profile2 ?? this.profile2,
        maxSize: maxSize ?? this.maxSize);
  }
}

@JsonSerializable(explicitToJson: true)
class ProfileModel {
  ProfileModel({
    this.id,
    this.name,
    this.availabilities,
    this.duration,
    this.budget,
    this.destinationTypes,
    this.ages,
    this.travelWithPersonFromSameCity,
    this.travelWithPersonFromSameCountry,
    this.travelWithPersonSameLanguage,
    this.gender,
    this.groupSize,
    this.chillOrVisit,
    this.aboutFood,
    this.goOutAtNight,
    this.sport,
    this.createdDate,
    this.active,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  @JsonKey(name: 'id')
  final num? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'availabilities', defaultValue: <AvailabilityAnswerModel>[])
  final List<AvailabilityAnswerModel>? availabilities;
  @JsonKey(name: 'duration')
  final RangeAnswerModel? duration;
  @JsonKey(name: 'budget')
  final RangeAnswerModel? budget;
  @JsonKey(
      name: 'destinationTypes',
      toJson: profileModelDestinationTypesListToJson,
      fromJson: profileModelDestinationTypesListFromJson)
  final List<enums.ProfileModelDestinationTypes>? destinationTypes;
  @JsonKey(name: 'ages')
  final RangeAnswerModel? ages;
  @JsonKey(
      name: 'travelWithPersonFromSameCity',
      toJson: profileModelTravelWithPersonFromSameCityToJson,
      fromJson: profileModelTravelWithPersonFromSameCityFromJson)
  final enums.ProfileModelTravelWithPersonFromSameCity?
      travelWithPersonFromSameCity;
  @JsonKey(
      name: 'travelWithPersonFromSameCountry',
      toJson: profileModelTravelWithPersonFromSameCountryToJson,
      fromJson: profileModelTravelWithPersonFromSameCountryFromJson)
  final enums.ProfileModelTravelWithPersonFromSameCountry?
      travelWithPersonFromSameCountry;
  @JsonKey(
      name: 'travelWithPersonSameLanguage',
      toJson: profileModelTravelWithPersonSameLanguageToJson,
      fromJson: profileModelTravelWithPersonSameLanguageFromJson)
  final enums.ProfileModelTravelWithPersonSameLanguage?
      travelWithPersonSameLanguage;
  @JsonKey(
      name: 'gender',
      toJson: profileModelGenderToJson,
      fromJson: profileModelGenderFromJson)
  final enums.ProfileModelGender? gender;
  @JsonKey(name: 'groupSize')
  final RangeAnswerModel? groupSize;
  @JsonKey(
      name: 'chillOrVisit',
      toJson: profileModelChillOrVisitToJson,
      fromJson: profileModelChillOrVisitFromJson)
  final enums.ProfileModelChillOrVisit? chillOrVisit;
  @JsonKey(
      name: 'aboutFood',
      toJson: profileModelAboutFoodToJson,
      fromJson: profileModelAboutFoodFromJson)
  final enums.ProfileModelAboutFood? aboutFood;
  @JsonKey(
      name: 'goOutAtNight',
      toJson: profileModelGoOutAtNightToJson,
      fromJson: profileModelGoOutAtNightFromJson)
  final enums.ProfileModelGoOutAtNight? goOutAtNight;
  @JsonKey(
      name: 'sport',
      toJson: profileModelSportToJson,
      fromJson: profileModelSportFromJson)
  final enums.ProfileModelSport? sport;
  @JsonKey(name: 'createdDate')
  final DateTime? createdDate;
  @JsonKey(name: 'active')
  final bool? active;
  static const fromJsonFactory = _$ProfileModelFromJson;
  static const toJsonFactory = _$ProfileModelToJson;
  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ProfileModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.availabilities, availabilities) ||
                const DeepCollectionEquality()
                    .equals(other.availabilities, availabilities)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.budget, budget) ||
                const DeepCollectionEquality().equals(other.budget, budget)) &&
            (identical(other.destinationTypes, destinationTypes) ||
                const DeepCollectionEquality()
                    .equals(other.destinationTypes, destinationTypes)) &&
            (identical(other.ages, ages) ||
                const DeepCollectionEquality().equals(other.ages, ages)) &&
            (identical(other.travelWithPersonFromSameCity, travelWithPersonFromSameCity) ||
                const DeepCollectionEquality().equals(
                    other.travelWithPersonFromSameCity,
                    travelWithPersonFromSameCity)) &&
            (identical(other.travelWithPersonFromSameCountry, travelWithPersonFromSameCountry) ||
                const DeepCollectionEquality().equals(
                    other.travelWithPersonFromSameCountry,
                    travelWithPersonFromSameCountry)) &&
            (identical(other.travelWithPersonSameLanguage, travelWithPersonSameLanguage) ||
                const DeepCollectionEquality().equals(
                    other.travelWithPersonSameLanguage,
                    travelWithPersonSameLanguage)) &&
            (identical(other.gender, gender) ||
                const DeepCollectionEquality().equals(other.gender, gender)) &&
            (identical(other.groupSize, groupSize) ||
                const DeepCollectionEquality()
                    .equals(other.groupSize, groupSize)) &&
            (identical(other.chillOrVisit, chillOrVisit) ||
                const DeepCollectionEquality()
                    .equals(other.chillOrVisit, chillOrVisit)) &&
            (identical(other.aboutFood, aboutFood) ||
                const DeepCollectionEquality()
                    .equals(other.aboutFood, aboutFood)) &&
            (identical(other.goOutAtNight, goOutAtNight) ||
                const DeepCollectionEquality()
                    .equals(other.goOutAtNight, goOutAtNight)) &&
            (identical(other.sport, sport) ||
                const DeepCollectionEquality().equals(other.sport, sport)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.active, active) || const DeepCollectionEquality().equals(other.active, active)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(availabilities) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(budget) ^
      const DeepCollectionEquality().hash(destinationTypes) ^
      const DeepCollectionEquality().hash(ages) ^
      const DeepCollectionEquality().hash(travelWithPersonFromSameCity) ^
      const DeepCollectionEquality().hash(travelWithPersonFromSameCountry) ^
      const DeepCollectionEquality().hash(travelWithPersonSameLanguage) ^
      const DeepCollectionEquality().hash(gender) ^
      const DeepCollectionEquality().hash(groupSize) ^
      const DeepCollectionEquality().hash(chillOrVisit) ^
      const DeepCollectionEquality().hash(aboutFood) ^
      const DeepCollectionEquality().hash(goOutAtNight) ^
      const DeepCollectionEquality().hash(sport) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(active) ^
      runtimeType.hashCode;
}

extension $ProfileModelExtension on ProfileModel {
  ProfileModel copyWith(
      {num? id,
      String? name,
      List<AvailabilityAnswerModel>? availabilities,
      RangeAnswerModel? duration,
      RangeAnswerModel? budget,
      List<enums.ProfileModelDestinationTypes>? destinationTypes,
      RangeAnswerModel? ages,
      enums.ProfileModelTravelWithPersonFromSameCity?
          travelWithPersonFromSameCity,
      enums.ProfileModelTravelWithPersonFromSameCountry?
          travelWithPersonFromSameCountry,
      enums.ProfileModelTravelWithPersonSameLanguage?
          travelWithPersonSameLanguage,
      enums.ProfileModelGender? gender,
      RangeAnswerModel? groupSize,
      enums.ProfileModelChillOrVisit? chillOrVisit,
      enums.ProfileModelAboutFood? aboutFood,
      enums.ProfileModelGoOutAtNight? goOutAtNight,
      enums.ProfileModelSport? sport,
      DateTime? createdDate,
      bool? active}) {
    return ProfileModel(
        id: id ?? this.id,
        name: name ?? this.name,
        availabilities: availabilities ?? this.availabilities,
        duration: duration ?? this.duration,
        budget: budget ?? this.budget,
        destinationTypes: destinationTypes ?? this.destinationTypes,
        ages: ages ?? this.ages,
        travelWithPersonFromSameCity:
            travelWithPersonFromSameCity ?? this.travelWithPersonFromSameCity,
        travelWithPersonFromSameCountry: travelWithPersonFromSameCountry ??
            this.travelWithPersonFromSameCountry,
        travelWithPersonSameLanguage:
            travelWithPersonSameLanguage ?? this.travelWithPersonSameLanguage,
        gender: gender ?? this.gender,
        groupSize: groupSize ?? this.groupSize,
        chillOrVisit: chillOrVisit ?? this.chillOrVisit,
        aboutFood: aboutFood ?? this.aboutFood,
        goOutAtNight: goOutAtNight ?? this.goOutAtNight,
        sport: sport ?? this.sport,
        createdDate: createdDate ?? this.createdDate,
        active: active ?? this.active);
  }
}

@JsonSerializable(explicitToJson: true)
class LoginResponse {
  LoginResponse({
    this.username,
    this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  @JsonKey(name: 'username')
  final String? username;
  @JsonKey(name: 'token')
  final String? token;
  static const fromJsonFactory = _$LoginResponseFromJson;
  static const toJsonFactory = _$LoginResponseToJson;
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoginResponse &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(token) ^
      runtimeType.hashCode;
}

extension $LoginResponseExtension on LoginResponse {
  LoginResponse copyWith({String? username, String? token}) {
    return LoginResponse(
        username: username ?? this.username, token: token ?? this.token);
  }
}

@JsonSerializable(explicitToJson: true)
class PlacesFromAddressRequest {
  PlacesFromAddressRequest({
    this.categories,
    this.radiusMeter,
    this.address,
    this.countryCode,
    this.city,
  });

  factory PlacesFromAddressRequest.fromJson(Map<String, dynamic> json) =>
      _$PlacesFromAddressRequestFromJson(json);

  @JsonKey(
      name: 'categories',
      toJson: placesFromAddressRequestCategoriesListToJson,
      fromJson: placesFromAddressRequestCategoriesListFromJson)
  final List<enums.PlacesFromAddressRequestCategories>? categories;
  @JsonKey(name: 'radiusMeter')
  final int? radiusMeter;
  @JsonKey(name: 'address')
  final String? address;
  @JsonKey(name: 'countryCode')
  final String? countryCode;
  @JsonKey(name: 'city')
  final String? city;
  static const fromJsonFactory = _$PlacesFromAddressRequestFromJson;
  static const toJsonFactory = _$PlacesFromAddressRequestToJson;
  Map<String, dynamic> toJson() => _$PlacesFromAddressRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PlacesFromAddressRequest &&
            (identical(other.categories, categories) ||
                const DeepCollectionEquality()
                    .equals(other.categories, categories)) &&
            (identical(other.radiusMeter, radiusMeter) ||
                const DeepCollectionEquality()
                    .equals(other.radiusMeter, radiusMeter)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.countryCode, countryCode) ||
                const DeepCollectionEquality()
                    .equals(other.countryCode, countryCode)) &&
            (identical(other.city, city) ||
                const DeepCollectionEquality().equals(other.city, city)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(categories) ^
      const DeepCollectionEquality().hash(radiusMeter) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(countryCode) ^
      const DeepCollectionEquality().hash(city) ^
      runtimeType.hashCode;
}

extension $PlacesFromAddressRequestExtension on PlacesFromAddressRequest {
  PlacesFromAddressRequest copyWith(
      {List<enums.PlacesFromAddressRequestCategories>? categories,
      int? radiusMeter,
      String? address,
      String? countryCode,
      String? city}) {
    return PlacesFromAddressRequest(
        categories: categories ?? this.categories,
        radiusMeter: radiusMeter ?? this.radiusMeter,
        address: address ?? this.address,
        countryCode: countryCode ?? this.countryCode,
        city: city ?? this.city);
  }
}

@JsonSerializable(explicitToJson: true)
class GoogleRequest {
  GoogleRequest({
    this.firstname,
    this.lastname,
    this.accessToken,
    this.profilePicture,
    this.phoneNumber,
    this.email,
  });

  factory GoogleRequest.fromJson(Map<String, dynamic> json) =>
      _$GoogleRequestFromJson(json);

  @JsonKey(name: 'firstname')
  final String? firstname;
  @JsonKey(name: 'lastname')
  final String? lastname;
  @JsonKey(name: 'accessToken')
  final String? accessToken;
  @JsonKey(name: 'profilePicture')
  final String? profilePicture;
  @JsonKey(name: 'phoneNumber')
  final String? phoneNumber;
  @JsonKey(name: 'email')
  final String? email;
  static const fromJsonFactory = _$GoogleRequestFromJson;
  static const toJsonFactory = _$GoogleRequestToJson;
  Map<String, dynamic> toJson() => _$GoogleRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GoogleRequest &&
            (identical(other.firstname, firstname) ||
                const DeepCollectionEquality()
                    .equals(other.firstname, firstname)) &&
            (identical(other.lastname, lastname) ||
                const DeepCollectionEquality()
                    .equals(other.lastname, lastname)) &&
            (identical(other.accessToken, accessToken) ||
                const DeepCollectionEquality()
                    .equals(other.accessToken, accessToken)) &&
            (identical(other.profilePicture, profilePicture) ||
                const DeepCollectionEquality()
                    .equals(other.profilePicture, profilePicture)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(firstname) ^
      const DeepCollectionEquality().hash(lastname) ^
      const DeepCollectionEquality().hash(accessToken) ^
      const DeepCollectionEquality().hash(profilePicture) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(email) ^
      runtimeType.hashCode;
}

extension $GoogleRequestExtension on GoogleRequest {
  GoogleRequest copyWith(
      {String? firstname,
      String? lastname,
      String? accessToken,
      String? profilePicture,
      String? phoneNumber,
      String? email}) {
    return GoogleRequest(
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        accessToken: accessToken ?? this.accessToken,
        profilePicture: profilePicture ?? this.profilePicture,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        email: email ?? this.email);
  }
}

@JsonSerializable(explicitToJson: true)
class MessageResponse {
  MessageResponse({
    this.id,
    this.channelId,
    this.userId,
    this.content,
    this.sentDate,
    this.modifiedDate,
    this.pinned,
    this.type,
  });

  factory MessageResponse.fromJson(Map<String, dynamic> json) =>
      _$MessageResponseFromJson(json);

  @JsonKey(name: 'id')
  final num? id;
  @JsonKey(name: 'channelId')
  final num? channelId;
  @JsonKey(name: 'userId')
  final num? userId;
  @JsonKey(name: 'content')
  final String? content;
  @JsonKey(name: 'sentDate')
  final DateTime? sentDate;
  @JsonKey(name: 'modifiedDate')
  final DateTime? modifiedDate;
  @JsonKey(name: 'pinned')
  final bool? pinned;
  @JsonKey(
      name: 'type',
      toJson: messageResponseType$ToJson,
      fromJson: messageResponseType$FromJson)
  final enums.MessageResponseType$? type;
  static const fromJsonFactory = _$MessageResponseFromJson;
  static const toJsonFactory = _$MessageResponseToJson;
  Map<String, dynamic> toJson() => _$MessageResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MessageResponse &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.channelId, channelId) ||
                const DeepCollectionEquality()
                    .equals(other.channelId, channelId)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.sentDate, sentDate) ||
                const DeepCollectionEquality()
                    .equals(other.sentDate, sentDate)) &&
            (identical(other.modifiedDate, modifiedDate) ||
                const DeepCollectionEquality()
                    .equals(other.modifiedDate, modifiedDate)) &&
            (identical(other.pinned, pinned) ||
                const DeepCollectionEquality().equals(other.pinned, pinned)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(channelId) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(sentDate) ^
      const DeepCollectionEquality().hash(modifiedDate) ^
      const DeepCollectionEquality().hash(pinned) ^
      const DeepCollectionEquality().hash(type) ^
      runtimeType.hashCode;
}

extension $MessageResponseExtension on MessageResponse {
  MessageResponse copyWith(
      {num? id,
      num? channelId,
      num? userId,
      String? content,
      DateTime? sentDate,
      DateTime? modifiedDate,
      bool? pinned,
      enums.MessageResponseType$? type}) {
    return MessageResponse(
        id: id ?? this.id,
        channelId: channelId ?? this.channelId,
        userId: userId ?? this.userId,
        content: content ?? this.content,
        sentDate: sentDate ?? this.sentDate,
        modifiedDate: modifiedDate ?? this.modifiedDate,
        pinned: pinned ?? this.pinned,
        type: type ?? this.type);
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateSurveyRequest {
  UpdateSurveyRequest({
    this.question,
    this.possibleAnswers,
    this.multipleChoiceSurvey,
  });

  factory UpdateSurveyRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateSurveyRequestFromJson(json);

  @JsonKey(name: 'question')
  final String? question;
  @JsonKey(name: 'possibleAnswers', defaultValue: <PossibleAnswerRequest>[])
  final List<PossibleAnswerRequest>? possibleAnswers;
  @JsonKey(name: 'multipleChoiceSurvey')
  final bool? multipleChoiceSurvey;
  static const fromJsonFactory = _$UpdateSurveyRequestFromJson;
  static const toJsonFactory = _$UpdateSurveyRequestToJson;
  Map<String, dynamic> toJson() => _$UpdateSurveyRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateSurveyRequest &&
            (identical(other.question, question) ||
                const DeepCollectionEquality()
                    .equals(other.question, question)) &&
            (identical(other.possibleAnswers, possibleAnswers) ||
                const DeepCollectionEquality()
                    .equals(other.possibleAnswers, possibleAnswers)) &&
            (identical(other.multipleChoiceSurvey, multipleChoiceSurvey) ||
                const DeepCollectionEquality()
                    .equals(other.multipleChoiceSurvey, multipleChoiceSurvey)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(question) ^
      const DeepCollectionEquality().hash(possibleAnswers) ^
      const DeepCollectionEquality().hash(multipleChoiceSurvey) ^
      runtimeType.hashCode;
}

extension $UpdateSurveyRequestExtension on UpdateSurveyRequest {
  UpdateSurveyRequest copyWith(
      {String? question,
      List<PossibleAnswerRequest>? possibleAnswers,
      bool? multipleChoiceSurvey}) {
    return UpdateSurveyRequest(
        question: question ?? this.question,
        possibleAnswers: possibleAnswers ?? this.possibleAnswers,
        multipleChoiceSurvey:
            multipleChoiceSurvey ?? this.multipleChoiceSurvey);
  }
}

@JsonSerializable(explicitToJson: true)
class ScanResponse {
  ScanResponse({
    this.items,
    this.total,
  });

  factory ScanResponse.fromJson(Map<String, dynamic> json) =>
      _$ScanResponseFromJson(json);

  @JsonKey(name: 'items')
  final Map<String, dynamic>? items;
  @JsonKey(name: 'total')
  final double? total;
  static const fromJsonFactory = _$ScanResponseFromJson;
  static const toJsonFactory = _$ScanResponseToJson;
  Map<String, dynamic> toJson() => _$ScanResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ScanResponse &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)) &&
            (identical(other.total, total) ||
                const DeepCollectionEquality().equals(other.total, total)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(items) ^
      const DeepCollectionEquality().hash(total) ^
      runtimeType.hashCode;
}

extension $ScanResponseExtension on ScanResponse {
  ScanResponse copyWith({Map<String, dynamic>? items, double? total}) {
    return ScanResponse(items: items ?? this.items, total: total ?? this.total);
  }
}

@JsonSerializable(explicitToJson: true)
class ExpenseMemberModel {
  ExpenseMemberModel({
    this.userId,
    this.amountToPay,
  });

  factory ExpenseMemberModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseMemberModelFromJson(json);

  @JsonKey(name: 'userId')
  final num? userId;
  @JsonKey(name: 'amountToPay')
  final double? amountToPay;
  static const fromJsonFactory = _$ExpenseMemberModelFromJson;
  static const toJsonFactory = _$ExpenseMemberModelToJson;
  Map<String, dynamic> toJson() => _$ExpenseMemberModelToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExpenseMemberModel &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.amountToPay, amountToPay) ||
                const DeepCollectionEquality()
                    .equals(other.amountToPay, amountToPay)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(amountToPay) ^
      runtimeType.hashCode;
}

extension $ExpenseMemberModelExtension on ExpenseMemberModel {
  ExpenseMemberModel copyWith({num? userId, double? amountToPay}) {
    return ExpenseMemberModel(
        userId: userId ?? this.userId,
        amountToPay: amountToPay ?? this.amountToPay);
  }
}

@JsonSerializable(explicitToJson: true)
class UpdatePrivateGroupRequest {
  UpdatePrivateGroupRequest({
    this.name,
    this.description,
    this.state,
    this.ownerId,
    this.maxSize,
    this.startOfTrip,
    this.endOfTrip,
    this.picture,
    this.destination,
  });

  factory UpdatePrivateGroupRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdatePrivateGroupRequestFromJson(json);

  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(
      name: 'state',
      toJson: updatePrivateGroupRequestStateToJson,
      fromJson: updatePrivateGroupRequestStateFromJson)
  final enums.UpdatePrivateGroupRequestState? state;
  @JsonKey(name: 'ownerId')
  final num? ownerId;
  @JsonKey(name: 'maxSize')
  final int? maxSize;
  @JsonKey(name: 'startOfTrip')
  final DateTime? startOfTrip;
  @JsonKey(name: 'endOfTrip')
  final DateTime? endOfTrip;
  @JsonKey(name: 'picture')
  final String? picture;
  @JsonKey(name: 'destination')
  final String? destination;
  static const fromJsonFactory = _$UpdatePrivateGroupRequestFromJson;
  static const toJsonFactory = _$UpdatePrivateGroupRequestToJson;
  Map<String, dynamic> toJson() => _$UpdatePrivateGroupRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdatePrivateGroupRequest &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.ownerId, ownerId) ||
                const DeepCollectionEquality()
                    .equals(other.ownerId, ownerId)) &&
            (identical(other.maxSize, maxSize) ||
                const DeepCollectionEquality()
                    .equals(other.maxSize, maxSize)) &&
            (identical(other.startOfTrip, startOfTrip) ||
                const DeepCollectionEquality()
                    .equals(other.startOfTrip, startOfTrip)) &&
            (identical(other.endOfTrip, endOfTrip) ||
                const DeepCollectionEquality()
                    .equals(other.endOfTrip, endOfTrip)) &&
            (identical(other.picture, picture) ||
                const DeepCollectionEquality()
                    .equals(other.picture, picture)) &&
            (identical(other.destination, destination) ||
                const DeepCollectionEquality()
                    .equals(other.destination, destination)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(ownerId) ^
      const DeepCollectionEquality().hash(maxSize) ^
      const DeepCollectionEquality().hash(startOfTrip) ^
      const DeepCollectionEquality().hash(endOfTrip) ^
      const DeepCollectionEquality().hash(picture) ^
      const DeepCollectionEquality().hash(destination) ^
      runtimeType.hashCode;
}

extension $UpdatePrivateGroupRequestExtension on UpdatePrivateGroupRequest {
  UpdatePrivateGroupRequest copyWith(
      {String? name,
      String? description,
      enums.UpdatePrivateGroupRequestState? state,
      num? ownerId,
      int? maxSize,
      DateTime? startOfTrip,
      DateTime? endOfTrip,
      String? picture,
      String? destination}) {
    return UpdatePrivateGroupRequest(
        name: name ?? this.name,
        description: description ?? this.description,
        state: state ?? this.state,
        ownerId: ownerId ?? this.ownerId,
        maxSize: maxSize ?? this.maxSize,
        startOfTrip: startOfTrip ?? this.startOfTrip,
        endOfTrip: endOfTrip ?? this.endOfTrip,
        picture: picture ?? this.picture,
        destination: destination ?? this.destination);
  }
}

@JsonSerializable(explicitToJson: true)
class CheckJwtResponse {
  CheckJwtResponse({
    this.isValid,
    this.userDetails,
  });

  factory CheckJwtResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckJwtResponseFromJson(json);

  @JsonKey(name: 'isValid')
  final bool? isValid;
  @JsonKey(name: 'userDetails')
  final JwtUserDetails? userDetails;
  static const fromJsonFactory = _$CheckJwtResponseFromJson;
  static const toJsonFactory = _$CheckJwtResponseToJson;
  Map<String, dynamic> toJson() => _$CheckJwtResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CheckJwtResponse &&
            (identical(other.isValid, isValid) ||
                const DeepCollectionEquality()
                    .equals(other.isValid, isValid)) &&
            (identical(other.userDetails, userDetails) ||
                const DeepCollectionEquality()
                    .equals(other.userDetails, userDetails)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(isValid) ^
      const DeepCollectionEquality().hash(userDetails) ^
      runtimeType.hashCode;
}

extension $CheckJwtResponseExtension on CheckJwtResponse {
  CheckJwtResponse copyWith({bool? isValid, JwtUserDetails? userDetails}) {
    return CheckJwtResponse(
        isValid: isValid ?? this.isValid,
        userDetails: userDetails ?? this.userDetails);
  }
}

@JsonSerializable(explicitToJson: true)
class GoogleAuthResponse {
  GoogleAuthResponse({
    this.username,
    this.token,
    this.newUser,
  });

  factory GoogleAuthResponse.fromJson(Map<String, dynamic> json) =>
      _$GoogleAuthResponseFromJson(json);

  @JsonKey(name: 'username')
  final String? username;
  @JsonKey(name: 'token')
  final String? token;
  @JsonKey(name: 'newUser')
  final bool? newUser;
  static const fromJsonFactory = _$GoogleAuthResponseFromJson;
  static const toJsonFactory = _$GoogleAuthResponseToJson;
  Map<String, dynamic> toJson() => _$GoogleAuthResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GoogleAuthResponse &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)) &&
            (identical(other.newUser, newUser) ||
                const DeepCollectionEquality().equals(other.newUser, newUser)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(token) ^
      const DeepCollectionEquality().hash(newUser) ^
      runtimeType.hashCode;
}

extension $GoogleAuthResponseExtension on GoogleAuthResponse {
  GoogleAuthResponse copyWith(
      {String? username, String? token, bool? newUser}) {
    return GoogleAuthResponse(
        username: username ?? this.username,
        token: token ?? this.token,
        newUser: newUser ?? this.newUser);
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateReportRequest {
  UpdateReportRequest({
    this.reason,
    this.details,
  });

  factory UpdateReportRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateReportRequestFromJson(json);

  @JsonKey(
      name: 'reason',
      toJson: updateReportRequestReasonToJson,
      fromJson: updateReportRequestReasonFromJson)
  final enums.UpdateReportRequestReason? reason;
  @JsonKey(name: 'details')
  final String? details;
  static const fromJsonFactory = _$UpdateReportRequestFromJson;
  static const toJsonFactory = _$UpdateReportRequestToJson;
  Map<String, dynamic> toJson() => _$UpdateReportRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateReportRequest &&
            (identical(other.reason, reason) ||
                const DeepCollectionEquality().equals(other.reason, reason)) &&
            (identical(other.details, details) ||
                const DeepCollectionEquality().equals(other.details, details)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(reason) ^
      const DeepCollectionEquality().hash(details) ^
      runtimeType.hashCode;
}

extension $UpdateReportRequestExtension on UpdateReportRequest {
  UpdateReportRequest copyWith(
      {enums.UpdateReportRequestReason? reason, String? details}) {
    return UpdateReportRequest(
        reason: reason ?? this.reason, details: details ?? this.details);
  }
}

@JsonSerializable(explicitToJson: true)
class UserCreationRequest {
  UserCreationRequest({
    this.firstname,
    this.lastname,
    this.password,
    this.gender,
    this.birthDate,
    this.phoneNumber,
    this.language,
    this.city,
    this.email,
  });

  factory UserCreationRequest.fromJson(Map<String, dynamic> json) =>
      _$UserCreationRequestFromJson(json);

  @JsonKey(name: 'firstname')
  final String? firstname;
  @JsonKey(name: 'lastname')
  final String? lastname;
  @JsonKey(name: 'password')
  final String? password;
  @JsonKey(name: 'gender')
  final String? gender;
  @JsonKey(name: 'birthDate')
  final DateTime? birthDate;
  @JsonKey(name: 'phoneNumber')
  final String? phoneNumber;
  @JsonKey(name: 'language')
  final String? language;
  @JsonKey(name: 'city')
  final String? city;
  @JsonKey(name: 'email')
  final String? email;
  static const fromJsonFactory = _$UserCreationRequestFromJson;
  static const toJsonFactory = _$UserCreationRequestToJson;
  Map<String, dynamic> toJson() => _$UserCreationRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserCreationRequest &&
            (identical(other.firstname, firstname) ||
                const DeepCollectionEquality()
                    .equals(other.firstname, firstname)) &&
            (identical(other.lastname, lastname) ||
                const DeepCollectionEquality()
                    .equals(other.lastname, lastname)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.gender, gender) ||
                const DeepCollectionEquality().equals(other.gender, gender)) &&
            (identical(other.birthDate, birthDate) ||
                const DeepCollectionEquality()
                    .equals(other.birthDate, birthDate)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.language, language) ||
                const DeepCollectionEquality()
                    .equals(other.language, language)) &&
            (identical(other.city, city) ||
                const DeepCollectionEquality().equals(other.city, city)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(firstname) ^
      const DeepCollectionEquality().hash(lastname) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(gender) ^
      const DeepCollectionEquality().hash(birthDate) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(language) ^
      const DeepCollectionEquality().hash(city) ^
      const DeepCollectionEquality().hash(email) ^
      runtimeType.hashCode;
}

extension $UserCreationRequestExtension on UserCreationRequest {
  UserCreationRequest copyWith(
      {String? firstname,
      String? lastname,
      String? password,
      String? gender,
      DateTime? birthDate,
      String? phoneNumber,
      String? language,
      String? city,
      String? email}) {
    return UserCreationRequest(
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        password: password ?? this.password,
        gender: gender ?? this.gender,
        birthDate: birthDate ?? this.birthDate,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        language: language ?? this.language,
        city: city ?? this.city,
        email: email ?? this.email);
  }
}

@JsonSerializable(explicitToJson: true)
class ConfirmationCodeModel {
  ConfirmationCodeModel({
    this.value,
  });

  factory ConfirmationCodeModel.fromJson(Map<String, dynamic> json) =>
      _$ConfirmationCodeModelFromJson(json);

  @JsonKey(name: 'value')
  final String? value;
  static const fromJsonFactory = _$ConfirmationCodeModelFromJson;
  static const toJsonFactory = _$ConfirmationCodeModelToJson;
  Map<String, dynamic> toJson() => _$ConfirmationCodeModelToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ConfirmationCodeModel &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(value) ^ runtimeType.hashCode;
}

extension $ConfirmationCodeModelExtension on ConfirmationCodeModel {
  ConfirmationCodeModel copyWith({String? value}) {
    return ConfirmationCodeModel(value: value ?? this.value);
  }
}

@JsonSerializable(explicitToJson: true)
class PostSurveyRequest {
  PostSurveyRequest({
    this.userId,
    this.content,
    this.quizz,
    this.possibleAnswers,
    this.isMultipleChoiceSurvey,
    this.type,
    this.multipleChoiceSurvey,
  });

  factory PostSurveyRequest.fromJson(Map<String, dynamic> json) =>
      _$PostSurveyRequestFromJson(json);

  @JsonKey(name: 'userId')
  final num? userId;
  @JsonKey(name: 'content')
  final String? content;
  @JsonKey(name: 'quizz')
  final bool? quizz;
  @JsonKey(name: 'possibleAnswers', defaultValue: <PossibleAnswerRequest>[])
  final List<PossibleAnswerRequest>? possibleAnswers;
  @JsonKey(name: 'isMultipleChoiceSurvey')
  final bool? isMultipleChoiceSurvey;
  @JsonKey(
      name: 'type',
      toJson: postSurveyRequestType$ToJson,
      fromJson: postSurveyRequestType$FromJson)
  final enums.PostSurveyRequestType$? type;
  @JsonKey(name: 'multipleChoiceSurvey')
  final bool? multipleChoiceSurvey;
  static const fromJsonFactory = _$PostSurveyRequestFromJson;
  static const toJsonFactory = _$PostSurveyRequestToJson;
  Map<String, dynamic> toJson() => _$PostSurveyRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PostSurveyRequest &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.quizz, quizz) ||
                const DeepCollectionEquality().equals(other.quizz, quizz)) &&
            (identical(other.possibleAnswers, possibleAnswers) ||
                const DeepCollectionEquality()
                    .equals(other.possibleAnswers, possibleAnswers)) &&
            (identical(other.isMultipleChoiceSurvey, isMultipleChoiceSurvey) ||
                const DeepCollectionEquality().equals(
                    other.isMultipleChoiceSurvey, isMultipleChoiceSurvey)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.multipleChoiceSurvey, multipleChoiceSurvey) ||
                const DeepCollectionEquality()
                    .equals(other.multipleChoiceSurvey, multipleChoiceSurvey)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(quizz) ^
      const DeepCollectionEquality().hash(possibleAnswers) ^
      const DeepCollectionEquality().hash(isMultipleChoiceSurvey) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(multipleChoiceSurvey) ^
      runtimeType.hashCode;
}

extension $PostSurveyRequestExtension on PostSurveyRequest {
  PostSurveyRequest copyWith(
      {num? userId,
      String? content,
      bool? quizz,
      List<PossibleAnswerRequest>? possibleAnswers,
      bool? isMultipleChoiceSurvey,
      enums.PostSurveyRequestType$? type,
      bool? multipleChoiceSurvey}) {
    return PostSurveyRequest(
        userId: userId ?? this.userId,
        content: content ?? this.content,
        quizz: quizz ?? this.quizz,
        possibleAnswers: possibleAnswers ?? this.possibleAnswers,
        isMultipleChoiceSurvey:
            isMultipleChoiceSurvey ?? this.isMultipleChoiceSurvey,
        type: type ?? this.type,
        multipleChoiceSurvey:
            multipleChoiceSurvey ?? this.multipleChoiceSurvey);
  }
}

@JsonSerializable(explicitToJson: true)
class PossibleAnswerModel {
  PossibleAnswerModel({
    this.id,
    this.content,
    this.rightAnswer,
  });

  factory PossibleAnswerModel.fromJson(Map<String, dynamic> json) =>
      _$PossibleAnswerModelFromJson(json);

  @JsonKey(name: 'id')
  final num? id;
  @JsonKey(name: 'content')
  final String? content;
  @JsonKey(name: 'rightAnswer')
  final bool? rightAnswer;
  static const fromJsonFactory = _$PossibleAnswerModelFromJson;
  static const toJsonFactory = _$PossibleAnswerModelToJson;
  Map<String, dynamic> toJson() => _$PossibleAnswerModelToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PossibleAnswerModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.rightAnswer, rightAnswer) ||
                const DeepCollectionEquality()
                    .equals(other.rightAnswer, rightAnswer)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(rightAnswer) ^
      runtimeType.hashCode;
}

extension $PossibleAnswerModelExtension on PossibleAnswerModel {
  PossibleAnswerModel copyWith({num? id, String? content, bool? rightAnswer}) {
    return PossibleAnswerModel(
        id: id ?? this.id,
        content: content ?? this.content,
        rightAnswer: rightAnswer ?? this.rightAnswer);
  }
}

@JsonSerializable(explicitToJson: true)
class LoginRequest {
  LoginRequest({
    this.password,
    this.username,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  @JsonKey(name: 'password')
  final String? password;
  @JsonKey(name: 'username')
  final String? username;
  static const fromJsonFactory = _$LoginRequestFromJson;
  static const toJsonFactory = _$LoginRequestToJson;
  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoginRequest &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(username) ^
      runtimeType.hashCode;
}

extension $LoginRequestExtension on LoginRequest {
  LoginRequest copyWith({String? password, String? username}) {
    return LoginRequest(
        password: password ?? this.password,
        username: username ?? this.username);
  }
}

@JsonSerializable(explicitToJson: true)
class PlaceResponse {
  PlaceResponse({
    this.name,
    this.street,
    this.city,
    this.country,
  });

  factory PlaceResponse.fromJson(Map<String, dynamic> json) =>
      _$PlaceResponseFromJson(json);

  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'street')
  final String? street;
  @JsonKey(name: 'city')
  final String? city;
  @JsonKey(name: 'country')
  final String? country;
  static const fromJsonFactory = _$PlaceResponseFromJson;
  static const toJsonFactory = _$PlaceResponseToJson;
  Map<String, dynamic> toJson() => _$PlaceResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PlaceResponse &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.street, street) ||
                const DeepCollectionEquality().equals(other.street, street)) &&
            (identical(other.city, city) ||
                const DeepCollectionEquality().equals(other.city, city)) &&
            (identical(other.country, country) ||
                const DeepCollectionEquality().equals(other.country, country)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(street) ^
      const DeepCollectionEquality().hash(city) ^
      const DeepCollectionEquality().hash(country) ^
      runtimeType.hashCode;
}

extension $PlaceResponseExtension on PlaceResponse {
  PlaceResponse copyWith(
      {String? name, String? street, String? city, String? country}) {
    return PlaceResponse(
        name: name ?? this.name,
        street: street ?? this.street,
        city: city ?? this.city,
        country: country ?? this.country);
  }
}

@JsonSerializable(explicitToJson: true)
class CheckJwtRequest {
  CheckJwtRequest({
    this.jwt,
  });

  factory CheckJwtRequest.fromJson(Map<String, dynamic> json) =>
      _$CheckJwtRequestFromJson(json);

  @JsonKey(name: 'jwt')
  final String? jwt;
  static const fromJsonFactory = _$CheckJwtRequestFromJson;
  static const toJsonFactory = _$CheckJwtRequestToJson;
  Map<String, dynamic> toJson() => _$CheckJwtRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CheckJwtRequest &&
            (identical(other.jwt, jwt) ||
                const DeepCollectionEquality().equals(other.jwt, jwt)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(jwt) ^ runtimeType.hashCode;
}

extension $CheckJwtRequestExtension on CheckJwtRequest {
  CheckJwtRequest copyWith({String? jwt}) {
    return CheckJwtRequest(jwt: jwt ?? this.jwt);
  }
}

@JsonSerializable(explicitToJson: true)
class MoneyDueResponse {
  MoneyDueResponse({
    this.userId,
    this.total,
  });

  factory MoneyDueResponse.fromJson(Map<String, dynamic> json) =>
      _$MoneyDueResponseFromJson(json);

  @JsonKey(name: 'userId')
  final num? userId;
  @JsonKey(name: 'total')
  final double? total;
  static const fromJsonFactory = _$MoneyDueResponseFromJson;
  static const toJsonFactory = _$MoneyDueResponseToJson;
  Map<String, dynamic> toJson() => _$MoneyDueResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MoneyDueResponse &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.total, total) ||
                const DeepCollectionEquality().equals(other.total, total)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(total) ^
      runtimeType.hashCode;
}

extension $MoneyDueResponseExtension on MoneyDueResponse {
  MoneyDueResponse copyWith({num? userId, double? total}) {
    return MoneyDueResponse(
        userId: userId ?? this.userId, total: total ?? this.total);
  }
}

@JsonSerializable(explicitToJson: true)
class NotificationModel {
  NotificationModel({
    this.title,
    this.body,
    this.userId,
    this.id,
    this.firebaseId,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'body')
  final String? body;
  @JsonKey(name: 'userId')
  final num? userId;
  @JsonKey(name: 'id')
  final num? id;
  @JsonKey(name: 'firebaseId')
  final String? firebaseId;
  static const fromJsonFactory = _$NotificationModelFromJson;
  static const toJsonFactory = _$NotificationModelToJson;
  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NotificationModel &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.body, body) ||
                const DeepCollectionEquality().equals(other.body, body)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.firebaseId, firebaseId) ||
                const DeepCollectionEquality()
                    .equals(other.firebaseId, firebaseId)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(body) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(firebaseId) ^
      runtimeType.hashCode;
}

extension $NotificationModelExtension on NotificationModel {
  NotificationModel copyWith(
      {String? title, String? body, num? userId, num? id, String? firebaseId}) {
    return NotificationModel(
        title: title ?? this.title,
        body: body ?? this.body,
        userId: userId ?? this.userId,
        id: id ?? this.id,
        firebaseId: firebaseId ?? this.firebaseId);
  }
}

@JsonSerializable(explicitToJson: true)
class UserModel {
  UserModel({
    this.id,
    this.firstname,
    this.lastname,
    this.password,
    this.email,
    this.birthDate,
    this.gender,
    this.profilePicture,
    this.city,
    this.createdDate,
    this.phoneNumber,
    this.confirmed,
    this.language,
    this.roles,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  @JsonKey(name: 'id')
  final num? id;
  @JsonKey(name: 'firstname')
  final String? firstname;
  @JsonKey(name: 'lastname')
  final String? lastname;
  @JsonKey(name: 'password')
  final String? password;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'birthDate')
  final DateTime? birthDate;
  @JsonKey(
      name: 'gender',
      toJson: userModelGenderToJson,
      fromJson: userModelGenderFromJson)
  final enums.UserModelGender? gender;
  @JsonKey(name: 'profilePicture')
  final String? profilePicture;
  @JsonKey(name: 'city')
  final CityModel? city;
  @JsonKey(name: 'createdDate')
  final DateTime? createdDate;
  @JsonKey(name: 'phoneNumber')
  final String? phoneNumber;
  @JsonKey(name: 'confirmed')
  final bool? confirmed;
  @JsonKey(name: 'language')
  final String? language;
  @JsonKey(
      name: 'roles',
      toJson: userModelRolesListToJson,
      fromJson: userModelRolesListFromJson)
  final List<enums.UserModelRoles>? roles;
  static const fromJsonFactory = _$UserModelFromJson;
  static const toJsonFactory = _$UserModelToJson;
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.firstname, firstname) ||
                const DeepCollectionEquality()
                    .equals(other.firstname, firstname)) &&
            (identical(other.lastname, lastname) ||
                const DeepCollectionEquality()
                    .equals(other.lastname, lastname)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.birthDate, birthDate) ||
                const DeepCollectionEquality()
                    .equals(other.birthDate, birthDate)) &&
            (identical(other.gender, gender) ||
                const DeepCollectionEquality().equals(other.gender, gender)) &&
            (identical(other.profilePicture, profilePicture) ||
                const DeepCollectionEquality()
                    .equals(other.profilePicture, profilePicture)) &&
            (identical(other.city, city) ||
                const DeepCollectionEquality().equals(other.city, city)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.confirmed, confirmed) ||
                const DeepCollectionEquality()
                    .equals(other.confirmed, confirmed)) &&
            (identical(other.language, language) ||
                const DeepCollectionEquality()
                    .equals(other.language, language)) &&
            (identical(other.roles, roles) ||
                const DeepCollectionEquality().equals(other.roles, roles)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(firstname) ^
      const DeepCollectionEquality().hash(lastname) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(birthDate) ^
      const DeepCollectionEquality().hash(gender) ^
      const DeepCollectionEquality().hash(profilePicture) ^
      const DeepCollectionEquality().hash(city) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(confirmed) ^
      const DeepCollectionEquality().hash(language) ^
      const DeepCollectionEquality().hash(roles) ^
      runtimeType.hashCode;
}

extension $UserModelExtension on UserModel {
  UserModel copyWith(
      {num? id,
      String? firstname,
      String? lastname,
      String? password,
      String? email,
      DateTime? birthDate,
      enums.UserModelGender? gender,
      String? profilePicture,
      CityModel? city,
      DateTime? createdDate,
      String? phoneNumber,
      bool? confirmed,
      String? language,
      List<enums.UserModelRoles>? roles}) {
    return UserModel(
        id: id ?? this.id,
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        password: password ?? this.password,
        email: email ?? this.email,
        birthDate: birthDate ?? this.birthDate,
        gender: gender ?? this.gender,
        profilePicture: profilePicture ?? this.profilePicture,
        city: city ?? this.city,
        createdDate: createdDate ?? this.createdDate,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        confirmed: confirmed ?? this.confirmed,
        language: language ?? this.language,
        roles: roles ?? this.roles);
  }
}

@JsonSerializable(explicitToJson: true)
class ReportResponse {
  ReportResponse({
    this.id,
    this.reason,
    this.details,
    this.reportedUser,
    this.submitter,
    this.createdDate,
  });

  factory ReportResponse.fromJson(Map<String, dynamic> json) =>
      _$ReportResponseFromJson(json);

  @JsonKey(name: 'id')
  final num? id;
  @JsonKey(
      name: 'reason',
      toJson: reportResponseReasonToJson,
      fromJson: reportResponseReasonFromJson)
  final enums.ReportResponseReason? reason;
  @JsonKey(name: 'details')
  final String? details;
  @JsonKey(name: 'reportedUser')
  final num? reportedUser;
  @JsonKey(name: 'submitter')
  final num? submitter;
  @JsonKey(name: 'createdDate')
  final DateTime? createdDate;
  static const fromJsonFactory = _$ReportResponseFromJson;
  static const toJsonFactory = _$ReportResponseToJson;
  Map<String, dynamic> toJson() => _$ReportResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ReportResponse &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.reason, reason) ||
                const DeepCollectionEquality().equals(other.reason, reason)) &&
            (identical(other.details, details) ||
                const DeepCollectionEquality()
                    .equals(other.details, details)) &&
            (identical(other.reportedUser, reportedUser) ||
                const DeepCollectionEquality()
                    .equals(other.reportedUser, reportedUser)) &&
            (identical(other.submitter, submitter) ||
                const DeepCollectionEquality()
                    .equals(other.submitter, submitter)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(reason) ^
      const DeepCollectionEquality().hash(details) ^
      const DeepCollectionEquality().hash(reportedUser) ^
      const DeepCollectionEquality().hash(submitter) ^
      const DeepCollectionEquality().hash(createdDate) ^
      runtimeType.hashCode;
}

extension $ReportResponseExtension on ReportResponse {
  ReportResponse copyWith(
      {num? id,
      enums.ReportResponseReason? reason,
      String? details,
      num? reportedUser,
      num? submitter,
      DateTime? createdDate}) {
    return ReportResponse(
        id: id ?? this.id,
        reason: reason ?? this.reason,
        details: details ?? this.details,
        reportedUser: reportedUser ?? this.reportedUser,
        submitter: submitter ?? this.submitter,
        createdDate: createdDate ?? this.createdDate);
  }
}

@JsonSerializable(explicitToJson: true)
class MatchMakingResult {
  MatchMakingResult({
    this.type,
    this.groupId,
    this.userId,
    this.profileId,
  });

  factory MatchMakingResult.fromJson(Map<String, dynamic> json) =>
      _$MatchMakingResultFromJson(json);

  @JsonKey(
      name: 'type',
      toJson: matchMakingResultType$ToJson,
      fromJson: matchMakingResultType$FromJson)
  final enums.MatchMakingResultType$? type;
  @JsonKey(name: 'groupId')
  final num? groupId;
  @JsonKey(name: 'userId')
  final num? userId;
  @JsonKey(name: 'profileId')
  final num? profileId;
  static const fromJsonFactory = _$MatchMakingResultFromJson;
  static const toJsonFactory = _$MatchMakingResultToJson;
  Map<String, dynamic> toJson() => _$MatchMakingResultToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MatchMakingResult &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.groupId, groupId) ||
                const DeepCollectionEquality()
                    .equals(other.groupId, groupId)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.profileId, profileId) ||
                const DeepCollectionEquality()
                    .equals(other.profileId, profileId)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(groupId) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(profileId) ^
      runtimeType.hashCode;
}

extension $MatchMakingResultExtension on MatchMakingResult {
  MatchMakingResult copyWith(
      {enums.MatchMakingResultType$? type,
      num? groupId,
      num? userId,
      num? profileId}) {
    return MatchMakingResult(
        type: type ?? this.type,
        groupId: groupId ?? this.groupId,
        userId: userId ?? this.userId,
        profileId: profileId ?? this.profileId);
  }
}

@JsonSerializable(explicitToJson: true)
class CityModel {
  CityModel({
    this.name,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);

  @JsonKey(name: 'name')
  final String? name;
  static const fromJsonFactory = _$CityModelFromJson;
  static const toJsonFactory = _$CityModelToJson;
  Map<String, dynamic> toJson() => _$CityModelToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CityModel &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^ runtimeType.hashCode;
}

extension $CityModelExtension on CityModel {
  CityModel copyWith({String? name}) {
    return CityModel(name: name ?? this.name);
  }
}

@JsonSerializable(explicitToJson: true)
class ValidateCodePasswordRequest {
  ValidateCodePasswordRequest({
    this.value,
    this.newPassword,
    this.email,
  });

  factory ValidateCodePasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ValidateCodePasswordRequestFromJson(json);

  @JsonKey(name: 'value')
  final String? value;
  @JsonKey(name: 'newPassword')
  final String? newPassword;
  @JsonKey(name: 'email')
  final String? email;
  static const fromJsonFactory = _$ValidateCodePasswordRequestFromJson;
  static const toJsonFactory = _$ValidateCodePasswordRequestToJson;
  Map<String, dynamic> toJson() => _$ValidateCodePasswordRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ValidateCodePasswordRequest &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)) &&
            (identical(other.newPassword, newPassword) ||
                const DeepCollectionEquality()
                    .equals(other.newPassword, newPassword)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(value) ^
      const DeepCollectionEquality().hash(newPassword) ^
      const DeepCollectionEquality().hash(email) ^
      runtimeType.hashCode;
}

extension $ValidateCodePasswordRequestExtension on ValidateCodePasswordRequest {
  ValidateCodePasswordRequest copyWith(
      {String? value, String? newPassword, String? email}) {
    return ValidateCodePasswordRequest(
        value: value ?? this.value,
        newPassword: newPassword ?? this.newPassword,
        email: email ?? this.email);
  }
}

@JsonSerializable(explicitToJson: true)
class AvailabilityAnswerModel {
  AvailabilityAnswerModel({
    this.startDate,
    this.endDate,
  });

  factory AvailabilityAnswerModel.fromJson(Map<String, dynamic> json) =>
      _$AvailabilityAnswerModelFromJson(json);

  @JsonKey(name: 'startDate')
  final String? startDate;
  @JsonKey(name: 'endDate')
  final String? endDate;
  static const fromJsonFactory = _$AvailabilityAnswerModelFromJson;
  static const toJsonFactory = _$AvailabilityAnswerModelToJson;
  Map<String, dynamic> toJson() => _$AvailabilityAnswerModelToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AvailabilityAnswerModel &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality().equals(other.endDate, endDate)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      runtimeType.hashCode;
}

extension $AvailabilityAnswerModelExtension on AvailabilityAnswerModel {
  AvailabilityAnswerModel copyWith({String? startDate, String? endDate}) {
    return AvailabilityAnswerModel(
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate);
  }
}

@JsonSerializable(explicitToJson: true)
class UserUpdateRequest {
  UserUpdateRequest({
    this.firstname,
    this.lastname,
    this.profilePicture,
    this.city,
    this.phoneNumber,
    this.birthdate,
    this.gender,
    this.language,
  });

  factory UserUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$UserUpdateRequestFromJson(json);

  @JsonKey(name: 'firstname')
  final String? firstname;
  @JsonKey(name: 'lastname')
  final String? lastname;
  @JsonKey(name: 'profilePicture')
  final String? profilePicture;
  @JsonKey(name: 'city')
  final CityModel? city;
  @JsonKey(name: 'phoneNumber')
  final String? phoneNumber;
  @JsonKey(name: 'birthdate')
  final DateTime? birthdate;
  @JsonKey(name: 'gender')
  final String? gender;
  @JsonKey(name: 'language')
  final String? language;
  static const fromJsonFactory = _$UserUpdateRequestFromJson;
  static const toJsonFactory = _$UserUpdateRequestToJson;
  Map<String, dynamic> toJson() => _$UserUpdateRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserUpdateRequest &&
            (identical(other.firstname, firstname) ||
                const DeepCollectionEquality()
                    .equals(other.firstname, firstname)) &&
            (identical(other.lastname, lastname) ||
                const DeepCollectionEquality()
                    .equals(other.lastname, lastname)) &&
            (identical(other.profilePicture, profilePicture) ||
                const DeepCollectionEquality()
                    .equals(other.profilePicture, profilePicture)) &&
            (identical(other.city, city) ||
                const DeepCollectionEquality().equals(other.city, city)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.birthdate, birthdate) ||
                const DeepCollectionEquality()
                    .equals(other.birthdate, birthdate)) &&
            (identical(other.gender, gender) ||
                const DeepCollectionEquality().equals(other.gender, gender)) &&
            (identical(other.language, language) ||
                const DeepCollectionEquality()
                    .equals(other.language, language)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(firstname) ^
      const DeepCollectionEquality().hash(lastname) ^
      const DeepCollectionEquality().hash(profilePicture) ^
      const DeepCollectionEquality().hash(city) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(birthdate) ^
      const DeepCollectionEquality().hash(gender) ^
      const DeepCollectionEquality().hash(language) ^
      runtimeType.hashCode;
}

extension $UserUpdateRequestExtension on UserUpdateRequest {
  UserUpdateRequest copyWith(
      {String? firstname,
      String? lastname,
      String? profilePicture,
      CityModel? city,
      String? phoneNumber,
      DateTime? birthdate,
      String? gender,
      String? language}) {
    return UserUpdateRequest(
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        profilePicture: profilePicture ?? this.profilePicture,
        city: city ?? this.city,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        birthdate: birthdate ?? this.birthdate,
        gender: gender ?? this.gender,
        language: language ?? this.language);
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateEmailRequest {
  UpdateEmailRequest({
    this.newEmail,
    this.password,
  });

  factory UpdateEmailRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateEmailRequestFromJson(json);

  @JsonKey(name: 'newEmail')
  final String? newEmail;
  @JsonKey(name: 'password')
  final String? password;
  static const fromJsonFactory = _$UpdateEmailRequestFromJson;
  static const toJsonFactory = _$UpdateEmailRequestToJson;
  Map<String, dynamic> toJson() => _$UpdateEmailRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateEmailRequest &&
            (identical(other.newEmail, newEmail) ||
                const DeepCollectionEquality()
                    .equals(other.newEmail, newEmail)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(newEmail) ^
      const DeepCollectionEquality().hash(password) ^
      runtimeType.hashCode;
}

extension $UpdateEmailRequestExtension on UpdateEmailRequest {
  UpdateEmailRequest copyWith({String? newEmail, String? password}) {
    return UpdateEmailRequest(
        newEmail: newEmail ?? this.newEmail,
        password: password ?? this.password);
  }
}

@JsonSerializable(explicitToJson: true)
class RangeAnswerModel {
  RangeAnswerModel({
    this.minValue,
    this.maxValue,
  });

  factory RangeAnswerModel.fromJson(Map<String, dynamic> json) =>
      _$RangeAnswerModelFromJson(json);

  @JsonKey(name: 'minValue')
  final int? minValue;
  @JsonKey(name: 'maxValue')
  final int? maxValue;
  static const fromJsonFactory = _$RangeAnswerModelFromJson;
  static const toJsonFactory = _$RangeAnswerModelToJson;
  Map<String, dynamic> toJson() => _$RangeAnswerModelToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RangeAnswerModel &&
            (identical(other.minValue, minValue) ||
                const DeepCollectionEquality()
                    .equals(other.minValue, minValue)) &&
            (identical(other.maxValue, maxValue) ||
                const DeepCollectionEquality()
                    .equals(other.maxValue, maxValue)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(minValue) ^
      const DeepCollectionEquality().hash(maxValue) ^
      runtimeType.hashCode;
}

extension $RangeAnswerModelExtension on RangeAnswerModel {
  RangeAnswerModel copyWith({int? minValue, int? maxValue}) {
    return RangeAnswerModel(
        minValue: minValue ?? this.minValue,
        maxValue: maxValue ?? this.maxValue);
  }
}

@JsonSerializable(explicitToJson: true)
class UpdatePublicGroupRequest {
  UpdatePublicGroupRequest({
    this.name,
    this.description,
    this.startOfTrip,
    this.endOfTrip,
    this.picture,
    this.destination,
  });

  factory UpdatePublicGroupRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdatePublicGroupRequestFromJson(json);

  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'startOfTrip')
  final DateTime? startOfTrip;
  @JsonKey(name: 'endOfTrip')
  final DateTime? endOfTrip;
  @JsonKey(name: 'picture')
  final String? picture;
  @JsonKey(name: 'destination')
  final String? destination;
  static const fromJsonFactory = _$UpdatePublicGroupRequestFromJson;
  static const toJsonFactory = _$UpdatePublicGroupRequestToJson;
  Map<String, dynamic> toJson() => _$UpdatePublicGroupRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdatePublicGroupRequest &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.startOfTrip, startOfTrip) ||
                const DeepCollectionEquality()
                    .equals(other.startOfTrip, startOfTrip)) &&
            (identical(other.endOfTrip, endOfTrip) ||
                const DeepCollectionEquality()
                    .equals(other.endOfTrip, endOfTrip)) &&
            (identical(other.picture, picture) ||
                const DeepCollectionEquality()
                    .equals(other.picture, picture)) &&
            (identical(other.destination, destination) ||
                const DeepCollectionEquality()
                    .equals(other.destination, destination)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(startOfTrip) ^
      const DeepCollectionEquality().hash(endOfTrip) ^
      const DeepCollectionEquality().hash(picture) ^
      const DeepCollectionEquality().hash(destination) ^
      runtimeType.hashCode;
}

extension $UpdatePublicGroupRequestExtension on UpdatePublicGroupRequest {
  UpdatePublicGroupRequest copyWith(
      {String? name,
      String? description,
      DateTime? startOfTrip,
      DateTime? endOfTrip,
      String? picture,
      String? destination}) {
    return UpdatePublicGroupRequest(
        name: name ?? this.name,
        description: description ?? this.description,
        startOfTrip: startOfTrip ?? this.startOfTrip,
        endOfTrip: endOfTrip ?? this.endOfTrip,
        picture: picture ?? this.picture,
        destination: destination ?? this.destination);
  }
}

@JsonSerializable(explicitToJson: true)
class VoteSurveyRequest {
  VoteSurveyRequest({
    this.answerId,
  });

  factory VoteSurveyRequest.fromJson(Map<String, dynamic> json) =>
      _$VoteSurveyRequestFromJson(json);

  @JsonKey(name: 'answerId')
  final num? answerId;
  static const fromJsonFactory = _$VoteSurveyRequestFromJson;
  static const toJsonFactory = _$VoteSurveyRequestToJson;
  Map<String, dynamic> toJson() => _$VoteSurveyRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is VoteSurveyRequest &&
            (identical(other.answerId, answerId) ||
                const DeepCollectionEquality()
                    .equals(other.answerId, answerId)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(answerId) ^ runtimeType.hashCode;
}

extension $VoteSurveyRequestExtension on VoteSurveyRequest {
  VoteSurveyRequest copyWith({num? answerId}) {
    return VoteSurveyRequest(answerId: answerId ?? this.answerId);
  }
}

@JsonSerializable(explicitToJson: true)
class ModelWithEmail {
  ModelWithEmail({
    this.email,
  });

  factory ModelWithEmail.fromJson(Map<String, dynamic> json) =>
      _$ModelWithEmailFromJson(json);

  @JsonKey(name: 'email')
  final String? email;
  static const fromJsonFactory = _$ModelWithEmailFromJson;
  static const toJsonFactory = _$ModelWithEmailToJson;
  Map<String, dynamic> toJson() => _$ModelWithEmailToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ModelWithEmail &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(email) ^ runtimeType.hashCode;
}

extension $ModelWithEmailExtension on ModelWithEmail {
  ModelWithEmail copyWith({String? email}) {
    return ModelWithEmail(email: email ?? this.email);
  }
}

@JsonSerializable(explicitToJson: true)
class SubmitReportRequest {
  SubmitReportRequest({
    this.reportedUserId,
    this.reason,
    this.details,
  });

  factory SubmitReportRequest.fromJson(Map<String, dynamic> json) =>
      _$SubmitReportRequestFromJson(json);

  @JsonKey(name: 'reportedUserId')
  final num? reportedUserId;
  @JsonKey(
      name: 'reason',
      toJson: submitReportRequestReasonToJson,
      fromJson: submitReportRequestReasonFromJson)
  final enums.SubmitReportRequestReason? reason;
  @JsonKey(name: 'details')
  final String? details;
  static const fromJsonFactory = _$SubmitReportRequestFromJson;
  static const toJsonFactory = _$SubmitReportRequestToJson;
  Map<String, dynamic> toJson() => _$SubmitReportRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SubmitReportRequest &&
            (identical(other.reportedUserId, reportedUserId) ||
                const DeepCollectionEquality()
                    .equals(other.reportedUserId, reportedUserId)) &&
            (identical(other.reason, reason) ||
                const DeepCollectionEquality().equals(other.reason, reason)) &&
            (identical(other.details, details) ||
                const DeepCollectionEquality().equals(other.details, details)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(reportedUserId) ^
      const DeepCollectionEquality().hash(reason) ^
      const DeepCollectionEquality().hash(details) ^
      runtimeType.hashCode;
}

extension $SubmitReportRequestExtension on SubmitReportRequest {
  SubmitReportRequest copyWith(
      {num? reportedUserId,
      enums.SubmitReportRequestReason? reason,
      String? details}) {
    return SubmitReportRequest(
        reportedUserId: reportedUserId ?? this.reportedUserId,
        reason: reason ?? this.reason,
        details: details ?? this.details);
  }
}

@JsonSerializable(explicitToJson: true)
class UserIdResponse {
  UserIdResponse({
    this.userId,
  });

  factory UserIdResponse.fromJson(Map<String, dynamic> json) =>
      _$UserIdResponseFromJson(json);

  @JsonKey(name: 'userId')
  final num? userId;
  static const fromJsonFactory = _$UserIdResponseFromJson;
  static const toJsonFactory = _$UserIdResponseToJson;
  Map<String, dynamic> toJson() => _$UserIdResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserIdResponse &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(userId) ^ runtimeType.hashCode;
}

extension $UserIdResponseExtension on UserIdResponse {
  UserIdResponse copyWith({num? userId}) {
    return UserIdResponse(userId: userId ?? this.userId);
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateChannelRequest {
  UpdateChannelRequest({
    this.name,
    this.index,
  });

  factory UpdateChannelRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateChannelRequestFromJson(json);

  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'index')
  final int? index;
  static const fromJsonFactory = _$UpdateChannelRequestFromJson;
  static const toJsonFactory = _$UpdateChannelRequestToJson;
  Map<String, dynamic> toJson() => _$UpdateChannelRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateChannelRequest &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.index, index) ||
                const DeepCollectionEquality().equals(other.index, index)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(index) ^
      runtimeType.hashCode;
}

extension $UpdateChannelRequestExtension on UpdateChannelRequest {
  UpdateChannelRequest copyWith({String? name, int? index}) {
    return UpdateChannelRequest(
        name: name ?? this.name, index: index ?? this.index);
  }
}

@JsonSerializable(explicitToJson: true)
class BooleanResponse {
  BooleanResponse({
    this.value,
  });

  factory BooleanResponse.fromJson(Map<String, dynamic> json) =>
      _$BooleanResponseFromJson(json);

  @JsonKey(name: 'value')
  final bool? value;
  static const fromJsonFactory = _$BooleanResponseFromJson;
  static const toJsonFactory = _$BooleanResponseToJson;
  Map<String, dynamic> toJson() => _$BooleanResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is BooleanResponse &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(value) ^ runtimeType.hashCode;
}

extension $BooleanResponseExtension on BooleanResponse {
  BooleanResponse copyWith({bool? value}) {
    return BooleanResponse(value: value ?? this.value);
  }
}

@JsonSerializable(explicitToJson: true)
class GroupResponse {
  GroupResponse({
    this.id,
    this.name,
    this.description,
    this.state,
    this.ownerId,
    this.maxSize,
    this.startOfTrip,
    this.endOfTrip,
    this.picture,
    this.destination,
    this.members,
    this.createdDate,
  });

  factory GroupResponse.fromJson(Map<String, dynamic> json) =>
      _$GroupResponseFromJson(json);

  @JsonKey(name: 'id')
  final num? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(
      name: 'state',
      toJson: groupResponseStateToJson,
      fromJson: groupResponseStateFromJson)
  final enums.GroupResponseState? state;
  @JsonKey(name: 'ownerId')
  final num? ownerId;
  @JsonKey(name: 'maxSize')
  final int? maxSize;
  @JsonKey(name: 'startOfTrip')
  final DateTime? startOfTrip;
  @JsonKey(name: 'endOfTrip')
  final DateTime? endOfTrip;
  @JsonKey(name: 'picture')
  final String? picture;
  @JsonKey(name: 'destination')
  final String? destination;
  @JsonKey(name: 'members', defaultValue: <num>[])
  final List<num>? members;
  @JsonKey(name: 'createdDate')
  final String? createdDate;
  static const fromJsonFactory = _$GroupResponseFromJson;
  static const toJsonFactory = _$GroupResponseToJson;
  Map<String, dynamic> toJson() => _$GroupResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GroupResponse &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.ownerId, ownerId) ||
                const DeepCollectionEquality()
                    .equals(other.ownerId, ownerId)) &&
            (identical(other.maxSize, maxSize) ||
                const DeepCollectionEquality()
                    .equals(other.maxSize, maxSize)) &&
            (identical(other.startOfTrip, startOfTrip) ||
                const DeepCollectionEquality()
                    .equals(other.startOfTrip, startOfTrip)) &&
            (identical(other.endOfTrip, endOfTrip) ||
                const DeepCollectionEquality()
                    .equals(other.endOfTrip, endOfTrip)) &&
            (identical(other.picture, picture) ||
                const DeepCollectionEquality()
                    .equals(other.picture, picture)) &&
            (identical(other.destination, destination) ||
                const DeepCollectionEquality()
                    .equals(other.destination, destination)) &&
            (identical(other.members, members) ||
                const DeepCollectionEquality()
                    .equals(other.members, members)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(ownerId) ^
      const DeepCollectionEquality().hash(maxSize) ^
      const DeepCollectionEquality().hash(startOfTrip) ^
      const DeepCollectionEquality().hash(endOfTrip) ^
      const DeepCollectionEquality().hash(picture) ^
      const DeepCollectionEquality().hash(destination) ^
      const DeepCollectionEquality().hash(members) ^
      const DeepCollectionEquality().hash(createdDate) ^
      runtimeType.hashCode;
}

extension $GroupResponseExtension on GroupResponse {
  GroupResponse copyWith(
      {num? id,
      String? name,
      String? description,
      enums.GroupResponseState? state,
      num? ownerId,
      int? maxSize,
      DateTime? startOfTrip,
      DateTime? endOfTrip,
      String? picture,
      String? destination,
      List<num>? members,
      String? createdDate}) {
    return GroupResponse(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        state: state ?? this.state,
        ownerId: ownerId ?? this.ownerId,
        maxSize: maxSize ?? this.maxSize,
        startOfTrip: startOfTrip ?? this.startOfTrip,
        endOfTrip: endOfTrip ?? this.endOfTrip,
        picture: picture ?? this.picture,
        destination: destination ?? this.destination,
        members: members ?? this.members,
        createdDate: createdDate ?? this.createdDate);
  }
}

@JsonSerializable(explicitToJson: true)
class UserResponse {
  UserResponse({
    this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.birthDate,
    this.gender,
    this.profilePicture,
    this.city,
    this.createdDate,
    this.phoneNumber,
    this.confirmed,
    this.language,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  @JsonKey(name: 'id')
  final num? id;
  @JsonKey(name: 'firstname')
  final String? firstname;
  @JsonKey(name: 'lastname')
  final String? lastname;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'birthDate')
  final DateTime? birthDate;
  @JsonKey(
      name: 'gender',
      toJson: userResponseGenderToJson,
      fromJson: userResponseGenderFromJson)
  final enums.UserResponseGender? gender;
  @JsonKey(name: 'profilePicture')
  final String? profilePicture;
  @JsonKey(name: 'city')
  final String? city;
  @JsonKey(name: 'createdDate')
  final DateTime? createdDate;
  @JsonKey(name: 'phoneNumber')
  final String? phoneNumber;
  @JsonKey(name: 'confirmed')
  final bool? confirmed;
  @JsonKey(name: 'language')
  final String? language;
  static const fromJsonFactory = _$UserResponseFromJson;
  static const toJsonFactory = _$UserResponseToJson;
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserResponse &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.firstname, firstname) ||
                const DeepCollectionEquality()
                    .equals(other.firstname, firstname)) &&
            (identical(other.lastname, lastname) ||
                const DeepCollectionEquality()
                    .equals(other.lastname, lastname)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.birthDate, birthDate) ||
                const DeepCollectionEquality()
                    .equals(other.birthDate, birthDate)) &&
            (identical(other.gender, gender) ||
                const DeepCollectionEquality().equals(other.gender, gender)) &&
            (identical(other.profilePicture, profilePicture) ||
                const DeepCollectionEquality()
                    .equals(other.profilePicture, profilePicture)) &&
            (identical(other.city, city) ||
                const DeepCollectionEquality().equals(other.city, city)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.confirmed, confirmed) ||
                const DeepCollectionEquality()
                    .equals(other.confirmed, confirmed)) &&
            (identical(other.language, language) ||
                const DeepCollectionEquality()
                    .equals(other.language, language)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(firstname) ^
      const DeepCollectionEquality().hash(lastname) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(birthDate) ^
      const DeepCollectionEquality().hash(gender) ^
      const DeepCollectionEquality().hash(profilePicture) ^
      const DeepCollectionEquality().hash(city) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(confirmed) ^
      const DeepCollectionEquality().hash(language) ^
      runtimeType.hashCode;
}

extension $UserResponseExtension on UserResponse {
  UserResponse copyWith(
      {num? id,
      String? firstname,
      String? lastname,
      String? email,
      DateTime? birthDate,
      enums.UserResponseGender? gender,
      String? profilePicture,
      String? city,
      DateTime? createdDate,
      String? phoneNumber,
      bool? confirmed,
      String? language}) {
    return UserResponse(
        id: id ?? this.id,
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        email: email ?? this.email,
        birthDate: birthDate ?? this.birthDate,
        gender: gender ?? this.gender,
        profilePicture: profilePicture ?? this.profilePicture,
        city: city ?? this.city,
        createdDate: createdDate ?? this.createdDate,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        confirmed: confirmed ?? this.confirmed,
        language: language ?? this.language);
  }
}

@JsonSerializable(explicitToJson: true)
class MoneyDueRequest {
  MoneyDueRequest({
    this.userId,
    this.money,
  });

  factory MoneyDueRequest.fromJson(Map<String, dynamic> json) =>
      _$MoneyDueRequestFromJson(json);

  @JsonKey(name: 'userId')
  final num? userId;
  @JsonKey(name: 'money')
  final double? money;
  static const fromJsonFactory = _$MoneyDueRequestFromJson;
  static const toJsonFactory = _$MoneyDueRequestToJson;
  Map<String, dynamic> toJson() => _$MoneyDueRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MoneyDueRequest &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.money, money) ||
                const DeepCollectionEquality().equals(other.money, money)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(money) ^
      runtimeType.hashCode;
}

extension $MoneyDueRequestExtension on MoneyDueRequest {
  MoneyDueRequest copyWith({num? userId, double? money}) {
    return MoneyDueRequest(
        userId: userId ?? this.userId, money: money ?? this.money);
  }
}

@JsonSerializable(explicitToJson: true)
class ScanRequest {
  ScanRequest({
    this.minioUrl,
  });

  factory ScanRequest.fromJson(Map<String, dynamic> json) =>
      _$ScanRequestFromJson(json);

  @JsonKey(name: 'minioUrl')
  final String? minioUrl;
  static const fromJsonFactory = _$ScanRequestFromJson;
  static const toJsonFactory = _$ScanRequestToJson;
  Map<String, dynamic> toJson() => _$ScanRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ScanRequest &&
            (identical(other.minioUrl, minioUrl) ||
                const DeepCollectionEquality()
                    .equals(other.minioUrl, minioUrl)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(minioUrl) ^ runtimeType.hashCode;
}

extension $ScanRequestExtension on ScanRequest {
  ScanRequest copyWith({String? minioUrl}) {
    return ScanRequest(minioUrl: minioUrl ?? this.minioUrl);
  }
}

@JsonSerializable(explicitToJson: true)
class ChannelModel {
  ChannelModel({
    this.id,
    this.name,
    this.index,
  });

  factory ChannelModel.fromJson(Map<String, dynamic> json) =>
      _$ChannelModelFromJson(json);

  @JsonKey(name: 'id')
  final num? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'index')
  final int? index;
  static const fromJsonFactory = _$ChannelModelFromJson;
  static const toJsonFactory = _$ChannelModelToJson;
  Map<String, dynamic> toJson() => _$ChannelModelToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChannelModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.index, index) ||
                const DeepCollectionEquality().equals(other.index, index)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(index) ^
      runtimeType.hashCode;
}

extension $ChannelModelExtension on ChannelModel {
  ChannelModel copyWith({num? id, String? name, int? index}) {
    return ChannelModel(
        id: id ?? this.id, name: name ?? this.name, index: index ?? this.index);
  }
}

@JsonSerializable(explicitToJson: true)
class BalanceResponse {
  BalanceResponse({
    this.user,
    this.money,
  });

  factory BalanceResponse.fromJson(Map<String, dynamic> json) =>
      _$BalanceResponseFromJson(json);

  @JsonKey(name: 'user')
  final num? user;
  @JsonKey(name: 'money')
  final double? money;
  static const fromJsonFactory = _$BalanceResponseFromJson;
  static const toJsonFactory = _$BalanceResponseToJson;
  Map<String, dynamic> toJson() => _$BalanceResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is BalanceResponse &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.money, money) ||
                const DeepCollectionEquality().equals(other.money, money)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(money) ^
      runtimeType.hashCode;
}

extension $BalanceResponseExtension on BalanceResponse {
  BalanceResponse copyWith({num? user, double? money}) {
    return BalanceResponse(user: user ?? this.user, money: money ?? this.money);
  }
}

@JsonSerializable(explicitToJson: true)
class DeleteUserByAdminRequest {
  DeleteUserByAdminRequest({
    this.reason,
  });

  factory DeleteUserByAdminRequest.fromJson(Map<String, dynamic> json) =>
      _$DeleteUserByAdminRequestFromJson(json);

  @JsonKey(name: 'reason')
  final String? reason;
  static const fromJsonFactory = _$DeleteUserByAdminRequestFromJson;
  static const toJsonFactory = _$DeleteUserByAdminRequestToJson;
  Map<String, dynamic> toJson() => _$DeleteUserByAdminRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DeleteUserByAdminRequest &&
            (identical(other.reason, reason) ||
                const DeepCollectionEquality().equals(other.reason, reason)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(reason) ^ runtimeType.hashCode;
}

extension $DeleteUserByAdminRequestExtension on DeleteUserByAdminRequest {
  DeleteUserByAdminRequest copyWith({String? reason}) {
    return DeleteUserByAdminRequest(reason: reason ?? this.reason);
  }
}

@JsonSerializable(explicitToJson: true)
class SurveyModel {
  SurveyModel({
    this.id,
    this.channelId,
    this.question,
    this.submitter,
    this.quizz,
    this.sendDate,
    this.modifiedDate,
    this.possibleAnswers,
    this.votes,
    this.type,
    this.multipleChoiceSurvey,
  });

  factory SurveyModel.fromJson(Map<String, dynamic> json) =>
      _$SurveyModelFromJson(json);

  @JsonKey(name: 'id')
  final num? id;
  @JsonKey(name: 'channelId')
  final num? channelId;
  @JsonKey(name: 'question')
  final String? question;
  @JsonKey(name: 'submitter')
  final num? submitter;
  @JsonKey(name: 'quizz')
  final bool? quizz;
  @JsonKey(name: 'sendDate')
  final DateTime? sendDate;
  @JsonKey(name: 'modifiedDate')
  final DateTime? modifiedDate;
  @JsonKey(name: 'possibleAnswers', defaultValue: <PossibleAnswerModel>[])
  final List<PossibleAnswerModel>? possibleAnswers;
  @JsonKey(name: 'votes', defaultValue: <VoteModel>[])
  final List<VoteModel>? votes;
  @JsonKey(
      name: 'type',
      toJson: surveyModelType$ToJson,
      fromJson: surveyModelType$FromJson)
  final enums.SurveyModelType$? type;
  @JsonKey(name: 'multipleChoiceSurvey')
  final bool? multipleChoiceSurvey;
  static const fromJsonFactory = _$SurveyModelFromJson;
  static const toJsonFactory = _$SurveyModelToJson;
  Map<String, dynamic> toJson() => _$SurveyModelToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SurveyModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.channelId, channelId) ||
                const DeepCollectionEquality()
                    .equals(other.channelId, channelId)) &&
            (identical(other.question, question) ||
                const DeepCollectionEquality()
                    .equals(other.question, question)) &&
            (identical(other.submitter, submitter) ||
                const DeepCollectionEquality()
                    .equals(other.submitter, submitter)) &&
            (identical(other.quizz, quizz) ||
                const DeepCollectionEquality().equals(other.quizz, quizz)) &&
            (identical(other.sendDate, sendDate) ||
                const DeepCollectionEquality()
                    .equals(other.sendDate, sendDate)) &&
            (identical(other.modifiedDate, modifiedDate) ||
                const DeepCollectionEquality()
                    .equals(other.modifiedDate, modifiedDate)) &&
            (identical(other.possibleAnswers, possibleAnswers) ||
                const DeepCollectionEquality()
                    .equals(other.possibleAnswers, possibleAnswers)) &&
            (identical(other.votes, votes) ||
                const DeepCollectionEquality().equals(other.votes, votes)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.multipleChoiceSurvey, multipleChoiceSurvey) ||
                const DeepCollectionEquality()
                    .equals(other.multipleChoiceSurvey, multipleChoiceSurvey)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(channelId) ^
      const DeepCollectionEquality().hash(question) ^
      const DeepCollectionEquality().hash(submitter) ^
      const DeepCollectionEquality().hash(quizz) ^
      const DeepCollectionEquality().hash(sendDate) ^
      const DeepCollectionEquality().hash(modifiedDate) ^
      const DeepCollectionEquality().hash(possibleAnswers) ^
      const DeepCollectionEquality().hash(votes) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(multipleChoiceSurvey) ^
      runtimeType.hashCode;
}

extension $SurveyModelExtension on SurveyModel {
  SurveyModel copyWith(
      {num? id,
      num? channelId,
      String? question,
      num? submitter,
      bool? quizz,
      DateTime? sendDate,
      DateTime? modifiedDate,
      List<PossibleAnswerModel>? possibleAnswers,
      List<VoteModel>? votes,
      enums.SurveyModelType$? type,
      bool? multipleChoiceSurvey}) {
    return SurveyModel(
        id: id ?? this.id,
        channelId: channelId ?? this.channelId,
        question: question ?? this.question,
        submitter: submitter ?? this.submitter,
        quizz: quizz ?? this.quizz,
        sendDate: sendDate ?? this.sendDate,
        modifiedDate: modifiedDate ?? this.modifiedDate,
        possibleAnswers: possibleAnswers ?? this.possibleAnswers,
        votes: votes ?? this.votes,
        type: type ?? this.type,
        multipleChoiceSurvey:
            multipleChoiceSurvey ?? this.multipleChoiceSurvey);
  }
}

@JsonSerializable(explicitToJson: true)
class JoinGroupWithoutInviteModel {
  JoinGroupWithoutInviteModel({
    this.message,
  });

  factory JoinGroupWithoutInviteModel.fromJson(Map<String, dynamic> json) =>
      _$JoinGroupWithoutInviteModelFromJson(json);

  @JsonKey(name: 'message')
  final String? message;
  static const fromJsonFactory = _$JoinGroupWithoutInviteModelFromJson;
  static const toJsonFactory = _$JoinGroupWithoutInviteModelToJson;
  Map<String, dynamic> toJson() => _$JoinGroupWithoutInviteModelToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is JoinGroupWithoutInviteModel &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^ runtimeType.hashCode;
}

extension $JoinGroupWithoutInviteModelExtension on JoinGroupWithoutInviteModel {
  JoinGroupWithoutInviteModel copyWith({String? message}) {
    return JoinGroupWithoutInviteModel(message: message ?? this.message);
  }
}

@JsonSerializable(explicitToJson: true)
class RecommendationResponse {
  RecommendationResponse({
    this.id,
    this.reviewer,
    this.recommendedUser,
    this.comment,
  });

  factory RecommendationResponse.fromJson(Map<String, dynamic> json) =>
      _$RecommendationResponseFromJson(json);

  @JsonKey(name: 'id')
  final num? id;
  @JsonKey(name: 'reviewer')
  final num? reviewer;
  @JsonKey(name: 'recommendedUser')
  final num? recommendedUser;
  @JsonKey(name: 'comment')
  final String? comment;
  static const fromJsonFactory = _$RecommendationResponseFromJson;
  static const toJsonFactory = _$RecommendationResponseToJson;
  Map<String, dynamic> toJson() => _$RecommendationResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RecommendationResponse &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.reviewer, reviewer) ||
                const DeepCollectionEquality()
                    .equals(other.reviewer, reviewer)) &&
            (identical(other.recommendedUser, recommendedUser) ||
                const DeepCollectionEquality()
                    .equals(other.recommendedUser, recommendedUser)) &&
            (identical(other.comment, comment) ||
                const DeepCollectionEquality().equals(other.comment, comment)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(reviewer) ^
      const DeepCollectionEquality().hash(recommendedUser) ^
      const DeepCollectionEquality().hash(comment) ^
      runtimeType.hashCode;
}

extension $RecommendationResponseExtension on RecommendationResponse {
  RecommendationResponse copyWith(
      {num? id, num? reviewer, num? recommendedUser, String? comment}) {
    return RecommendationResponse(
        id: id ?? this.id,
        reviewer: reviewer ?? this.reviewer,
        recommendedUser: recommendedUser ?? this.recommendedUser,
        comment: comment ?? this.comment);
  }
}

@JsonSerializable(explicitToJson: true)
class ProfileUpdateRequest {
  ProfileUpdateRequest({
    this.name,
    this.availabilities,
    this.duration,
    this.budget,
    this.destinationTypes,
    this.ages,
    this.travelWithPersonFromSameCity,
    this.travelWithPersonFromSameCountry,
    this.travelWithPersonSameLanguage,
    this.gender,
    this.groupSize,
    this.chillOrVisit,
    this.aboutFood,
    this.goOutAtNight,
    this.sport,
    this.active,
  });

  factory ProfileUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$ProfileUpdateRequestFromJson(json);

  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'availabilities', defaultValue: <AvailabilityAnswerModel>[])
  final List<AvailabilityAnswerModel>? availabilities;
  @JsonKey(name: 'duration')
  final RangeAnswerModel? duration;
  @JsonKey(name: 'budget')
  final RangeAnswerModel? budget;
  @JsonKey(
      name: 'destinationTypes',
      toJson: profileUpdateRequestDestinationTypesListToJson,
      fromJson: profileUpdateRequestDestinationTypesListFromJson)
  final List<enums.ProfileUpdateRequestDestinationTypes>? destinationTypes;
  @JsonKey(name: 'ages')
  final RangeAnswerModel? ages;
  @JsonKey(
      name: 'travelWithPersonFromSameCity',
      toJson: profileUpdateRequestTravelWithPersonFromSameCityToJson,
      fromJson: profileUpdateRequestTravelWithPersonFromSameCityFromJson)
  final enums.ProfileUpdateRequestTravelWithPersonFromSameCity?
      travelWithPersonFromSameCity;
  @JsonKey(
      name: 'travelWithPersonFromSameCountry',
      toJson: profileUpdateRequestTravelWithPersonFromSameCountryToJson,
      fromJson: profileUpdateRequestTravelWithPersonFromSameCountryFromJson)
  final enums.ProfileUpdateRequestTravelWithPersonFromSameCountry?
      travelWithPersonFromSameCountry;
  @JsonKey(
      name: 'travelWithPersonSameLanguage',
      toJson: profileUpdateRequestTravelWithPersonSameLanguageToJson,
      fromJson: profileUpdateRequestTravelWithPersonSameLanguageFromJson)
  final enums.ProfileUpdateRequestTravelWithPersonSameLanguage?
      travelWithPersonSameLanguage;
  @JsonKey(
      name: 'gender',
      toJson: profileUpdateRequestGenderToJson,
      fromJson: profileUpdateRequestGenderFromJson)
  final enums.ProfileUpdateRequestGender? gender;
  @JsonKey(name: 'groupSize')
  final RangeAnswerModel? groupSize;
  @JsonKey(
      name: 'chillOrVisit',
      toJson: profileUpdateRequestChillOrVisitToJson,
      fromJson: profileUpdateRequestChillOrVisitFromJson)
  final enums.ProfileUpdateRequestChillOrVisit? chillOrVisit;
  @JsonKey(
      name: 'aboutFood',
      toJson: profileUpdateRequestAboutFoodToJson,
      fromJson: profileUpdateRequestAboutFoodFromJson)
  final enums.ProfileUpdateRequestAboutFood? aboutFood;
  @JsonKey(
      name: 'goOutAtNight',
      toJson: profileUpdateRequestGoOutAtNightToJson,
      fromJson: profileUpdateRequestGoOutAtNightFromJson)
  final enums.ProfileUpdateRequestGoOutAtNight? goOutAtNight;
  @JsonKey(
      name: 'sport',
      toJson: profileUpdateRequestSportToJson,
      fromJson: profileUpdateRequestSportFromJson)
  final enums.ProfileUpdateRequestSport? sport;
  @JsonKey(name: 'active')
  final bool? active;
  static const fromJsonFactory = _$ProfileUpdateRequestFromJson;
  static const toJsonFactory = _$ProfileUpdateRequestToJson;
  Map<String, dynamic> toJson() => _$ProfileUpdateRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ProfileUpdateRequest &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.availabilities, availabilities) ||
                const DeepCollectionEquality()
                    .equals(other.availabilities, availabilities)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.budget, budget) ||
                const DeepCollectionEquality().equals(other.budget, budget)) &&
            (identical(other.destinationTypes, destinationTypes) ||
                const DeepCollectionEquality()
                    .equals(other.destinationTypes, destinationTypes)) &&
            (identical(other.ages, ages) ||
                const DeepCollectionEquality().equals(other.ages, ages)) &&
            (identical(other.travelWithPersonFromSameCity, travelWithPersonFromSameCity) ||
                const DeepCollectionEquality().equals(
                    other.travelWithPersonFromSameCity,
                    travelWithPersonFromSameCity)) &&
            (identical(other.travelWithPersonFromSameCountry, travelWithPersonFromSameCountry) ||
                const DeepCollectionEquality().equals(
                    other.travelWithPersonFromSameCountry,
                    travelWithPersonFromSameCountry)) &&
            (identical(other.travelWithPersonSameLanguage, travelWithPersonSameLanguage) ||
                const DeepCollectionEquality().equals(
                    other.travelWithPersonSameLanguage,
                    travelWithPersonSameLanguage)) &&
            (identical(other.gender, gender) ||
                const DeepCollectionEquality().equals(other.gender, gender)) &&
            (identical(other.groupSize, groupSize) ||
                const DeepCollectionEquality()
                    .equals(other.groupSize, groupSize)) &&
            (identical(other.chillOrVisit, chillOrVisit) ||
                const DeepCollectionEquality()
                    .equals(other.chillOrVisit, chillOrVisit)) &&
            (identical(other.aboutFood, aboutFood) ||
                const DeepCollectionEquality()
                    .equals(other.aboutFood, aboutFood)) &&
            (identical(other.goOutAtNight, goOutAtNight) ||
                const DeepCollectionEquality()
                    .equals(other.goOutAtNight, goOutAtNight)) &&
            (identical(other.sport, sport) ||
                const DeepCollectionEquality().equals(other.sport, sport)) &&
            (identical(other.active, active) ||
                const DeepCollectionEquality().equals(other.active, active)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(availabilities) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(budget) ^
      const DeepCollectionEquality().hash(destinationTypes) ^
      const DeepCollectionEquality().hash(ages) ^
      const DeepCollectionEquality().hash(travelWithPersonFromSameCity) ^
      const DeepCollectionEquality().hash(travelWithPersonFromSameCountry) ^
      const DeepCollectionEquality().hash(travelWithPersonSameLanguage) ^
      const DeepCollectionEquality().hash(gender) ^
      const DeepCollectionEquality().hash(groupSize) ^
      const DeepCollectionEquality().hash(chillOrVisit) ^
      const DeepCollectionEquality().hash(aboutFood) ^
      const DeepCollectionEquality().hash(goOutAtNight) ^
      const DeepCollectionEquality().hash(sport) ^
      const DeepCollectionEquality().hash(active) ^
      runtimeType.hashCode;
}

extension $ProfileUpdateRequestExtension on ProfileUpdateRequest {
  ProfileUpdateRequest copyWith(
      {String? name,
      List<AvailabilityAnswerModel>? availabilities,
      RangeAnswerModel? duration,
      RangeAnswerModel? budget,
      List<enums.ProfileUpdateRequestDestinationTypes>? destinationTypes,
      RangeAnswerModel? ages,
      enums.ProfileUpdateRequestTravelWithPersonFromSameCity?
          travelWithPersonFromSameCity,
      enums.ProfileUpdateRequestTravelWithPersonFromSameCountry?
          travelWithPersonFromSameCountry,
      enums.ProfileUpdateRequestTravelWithPersonSameLanguage?
          travelWithPersonSameLanguage,
      enums.ProfileUpdateRequestGender? gender,
      RangeAnswerModel? groupSize,
      enums.ProfileUpdateRequestChillOrVisit? chillOrVisit,
      enums.ProfileUpdateRequestAboutFood? aboutFood,
      enums.ProfileUpdateRequestGoOutAtNight? goOutAtNight,
      enums.ProfileUpdateRequestSport? sport,
      bool? active}) {
    return ProfileUpdateRequest(
        name: name ?? this.name,
        availabilities: availabilities ?? this.availabilities,
        duration: duration ?? this.duration,
        budget: budget ?? this.budget,
        destinationTypes: destinationTypes ?? this.destinationTypes,
        ages: ages ?? this.ages,
        travelWithPersonFromSameCity:
            travelWithPersonFromSameCity ?? this.travelWithPersonFromSameCity,
        travelWithPersonFromSameCountry: travelWithPersonFromSameCountry ??
            this.travelWithPersonFromSameCountry,
        travelWithPersonSameLanguage:
            travelWithPersonSameLanguage ?? this.travelWithPersonSameLanguage,
        gender: gender ?? this.gender,
        groupSize: groupSize ?? this.groupSize,
        chillOrVisit: chillOrVisit ?? this.chillOrVisit,
        aboutFood: aboutFood ?? this.aboutFood,
        goOutAtNight: goOutAtNight ?? this.goOutAtNight,
        sport: sport ?? this.sport,
        active: active ?? this.active);
  }
}

@JsonSerializable(explicitToJson: true)
class CreateChannelRequest {
  CreateChannelRequest({
    this.name,
  });

  factory CreateChannelRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateChannelRequestFromJson(json);

  @JsonKey(name: 'name')
  final String? name;
  static const fromJsonFactory = _$CreateChannelRequestFromJson;
  static const toJsonFactory = _$CreateChannelRequestToJson;
  Map<String, dynamic> toJson() => _$CreateChannelRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreateChannelRequest &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^ runtimeType.hashCode;
}

extension $CreateChannelRequestExtension on CreateChannelRequest {
  CreateChannelRequest copyWith({String? name}) {
    return CreateChannelRequest(name: name ?? this.name);
  }
}

@JsonSerializable(explicitToJson: true)
class ExpenseRequest {
  ExpenseRequest({
    this.description,
    this.moneyDueByEachUser,
    this.icon,
    this.evenlyDivided,
    this.total,
  });

  factory ExpenseRequest.fromJson(Map<String, dynamic> json) =>
      _$ExpenseRequestFromJson(json);

  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'moneyDueByEachUser', defaultValue: <MoneyDueRequest>[])
  final List<MoneyDueRequest>? moneyDueByEachUser;
  @JsonKey(name: 'icon')
  final String? icon;
  @JsonKey(name: 'evenlyDivided')
  final bool? evenlyDivided;
  @JsonKey(name: 'total')
  final double? total;
  static const fromJsonFactory = _$ExpenseRequestFromJson;
  static const toJsonFactory = _$ExpenseRequestToJson;
  Map<String, dynamic> toJson() => _$ExpenseRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExpenseRequest &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.moneyDueByEachUser, moneyDueByEachUser) ||
                const DeepCollectionEquality()
                    .equals(other.moneyDueByEachUser, moneyDueByEachUser)) &&
            (identical(other.icon, icon) ||
                const DeepCollectionEquality().equals(other.icon, icon)) &&
            (identical(other.evenlyDivided, evenlyDivided) ||
                const DeepCollectionEquality()
                    .equals(other.evenlyDivided, evenlyDivided)) &&
            (identical(other.total, total) ||
                const DeepCollectionEquality().equals(other.total, total)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(moneyDueByEachUser) ^
      const DeepCollectionEquality().hash(icon) ^
      const DeepCollectionEquality().hash(evenlyDivided) ^
      const DeepCollectionEquality().hash(total) ^
      runtimeType.hashCode;
}

extension $ExpenseRequestExtension on ExpenseRequest {
  ExpenseRequest copyWith(
      {String? description,
      List<MoneyDueRequest>? moneyDueByEachUser,
      String? icon,
      bool? evenlyDivided,
      double? total}) {
    return ExpenseRequest(
        description: description ?? this.description,
        moneyDueByEachUser: moneyDueByEachUser ?? this.moneyDueByEachUser,
        icon: icon ?? this.icon,
        evenlyDivided: evenlyDivided ?? this.evenlyDivided,
        total: total ?? this.total);
  }
}

@JsonSerializable(explicitToJson: true)
class FirebaseTokenResponse {
  FirebaseTokenResponse({
    this.token,
  });

  factory FirebaseTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$FirebaseTokenResponseFromJson(json);

  @JsonKey(name: 'token')
  final String? token;
  static const fromJsonFactory = _$FirebaseTokenResponseFromJson;
  static const toJsonFactory = _$FirebaseTokenResponseToJson;
  Map<String, dynamic> toJson() => _$FirebaseTokenResponseToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FirebaseTokenResponse &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(token) ^ runtimeType.hashCode;
}

extension $FirebaseTokenResponseExtension on FirebaseTokenResponse {
  FirebaseTokenResponse copyWith({String? token}) {
    return FirebaseTokenResponse(token: token ?? this.token);
  }
}

@JsonSerializable(explicitToJson: true)
class ExpenseModel {
  ExpenseModel({
    this.id,
    this.description,
    this.total,
    this.groupId,
    this.purchaserId,
    this.date,
    this.icon,
    this.indebtedUsers,
  });

  factory ExpenseModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseModelFromJson(json);

  @JsonKey(name: 'id')
  final num? id;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'total')
  final double? total;
  @JsonKey(name: 'groupId')
  final num? groupId;
  @JsonKey(name: 'purchaserId')
  final num? purchaserId;
  @JsonKey(name: 'date')
  final DateTime? date;
  @JsonKey(name: 'icon')
  final String? icon;
  @JsonKey(name: 'indebtedUsers', defaultValue: <ExpenseMemberModel>[])
  final List<ExpenseMemberModel>? indebtedUsers;
  static const fromJsonFactory = _$ExpenseModelFromJson;
  static const toJsonFactory = _$ExpenseModelToJson;
  Map<String, dynamic> toJson() => _$ExpenseModelToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExpenseModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.total, total) ||
                const DeepCollectionEquality().equals(other.total, total)) &&
            (identical(other.groupId, groupId) ||
                const DeepCollectionEquality()
                    .equals(other.groupId, groupId)) &&
            (identical(other.purchaserId, purchaserId) ||
                const DeepCollectionEquality()
                    .equals(other.purchaserId, purchaserId)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.icon, icon) ||
                const DeepCollectionEquality().equals(other.icon, icon)) &&
            (identical(other.indebtedUsers, indebtedUsers) ||
                const DeepCollectionEquality()
                    .equals(other.indebtedUsers, indebtedUsers)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(total) ^
      const DeepCollectionEquality().hash(groupId) ^
      const DeepCollectionEquality().hash(purchaserId) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(icon) ^
      const DeepCollectionEquality().hash(indebtedUsers) ^
      runtimeType.hashCode;
}

extension $ExpenseModelExtension on ExpenseModel {
  ExpenseModel copyWith(
      {num? id,
      String? description,
      double? total,
      num? groupId,
      num? purchaserId,
      DateTime? date,
      String? icon,
      List<ExpenseMemberModel>? indebtedUsers}) {
    return ExpenseModel(
        id: id ?? this.id,
        description: description ?? this.description,
        total: total ?? this.total,
        groupId: groupId ?? this.groupId,
        purchaserId: purchaserId ?? this.purchaserId,
        date: date ?? this.date,
        icon: icon ?? this.icon,
        indebtedUsers: indebtedUsers ?? this.indebtedUsers);
  }
}

@JsonSerializable(explicitToJson: true)
class UpdateActivityRequest {
  UpdateActivityRequest({
    this.name,
    this.description,
    this.startDate,
    this.endDate,
    this.color,
    this.location,
    this.icon,
    this.infos,
    this.participants,
  });

  factory UpdateActivityRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateActivityRequestFromJson(json);

  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'startDate')
  final DateTime? startDate;
  @JsonKey(name: 'endDate')
  final DateTime? endDate;
  @JsonKey(name: 'color')
  final String? color;
  @JsonKey(name: 'location')
  final String? location;
  @JsonKey(name: 'icon')
  final String? icon;
  @JsonKey(name: 'infos', defaultValue: <String>[])
  final List<String>? infos;
  @JsonKey(name: 'participants', defaultValue: <num>[])
  final List<num>? participants;
  static const fromJsonFactory = _$UpdateActivityRequestFromJson;
  static const toJsonFactory = _$UpdateActivityRequestToJson;
  Map<String, dynamic> toJson() => _$UpdateActivityRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateActivityRequest &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)) &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)) &&
            (identical(other.icon, icon) ||
                const DeepCollectionEquality().equals(other.icon, icon)) &&
            (identical(other.infos, infos) ||
                const DeepCollectionEquality().equals(other.infos, infos)) &&
            (identical(other.participants, participants) ||
                const DeepCollectionEquality()
                    .equals(other.participants, participants)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(color) ^
      const DeepCollectionEquality().hash(location) ^
      const DeepCollectionEquality().hash(icon) ^
      const DeepCollectionEquality().hash(infos) ^
      const DeepCollectionEquality().hash(participants) ^
      runtimeType.hashCode;
}

extension $UpdateActivityRequestExtension on UpdateActivityRequest {
  UpdateActivityRequest copyWith(
      {String? name,
      String? description,
      DateTime? startDate,
      DateTime? endDate,
      String? color,
      String? location,
      String? icon,
      List<String>? infos,
      List<num>? participants}) {
    return UpdateActivityRequest(
        name: name ?? this.name,
        description: description ?? this.description,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        color: color ?? this.color,
        location: location ?? this.location,
        icon: icon ?? this.icon,
        infos: infos ?? this.infos,
        participants: participants ?? this.participants);
  }
}

@JsonSerializable(explicitToJson: true)
class GroupMemoryRequest {
  GroupMemoryRequest({
    this.memoryUrl,
  });

  factory GroupMemoryRequest.fromJson(Map<String, dynamic> json) =>
      _$GroupMemoryRequestFromJson(json);

  @JsonKey(name: 'memoryUrl')
  final String? memoryUrl;
  static const fromJsonFactory = _$GroupMemoryRequestFromJson;
  static const toJsonFactory = _$GroupMemoryRequestToJson;
  Map<String, dynamic> toJson() => _$GroupMemoryRequestToJson(this);

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GroupMemoryRequest &&
            (identical(other.memoryUrl, memoryUrl) ||
                const DeepCollectionEquality()
                    .equals(other.memoryUrl, memoryUrl)));
  }

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(memoryUrl) ^ runtimeType.hashCode;
}

extension $GroupMemoryRequestExtension on GroupMemoryRequest {
  GroupMemoryRequest copyWith({String? memoryUrl}) {
    return GroupMemoryRequest(memoryUrl: memoryUrl ?? this.memoryUrl);
  }
}

String? profileCreationRequestDestinationTypesToJson(
    enums.ProfileCreationRequestDestinationTypes?
        profileCreationRequestDestinationTypes) {
  return enums.$ProfileCreationRequestDestinationTypesMap[
      profileCreationRequestDestinationTypes];
}

enums.ProfileCreationRequestDestinationTypes
    profileCreationRequestDestinationTypesFromJson(
        Object? profileCreationRequestDestinationTypes) {
  if (profileCreationRequestDestinationTypes is int) {
    return enums.$ProfileCreationRequestDestinationTypesMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationRequestDestinationTypes.toString(),
            orElse: () => const MapEntry(
                enums.ProfileCreationRequestDestinationTypes
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  if (profileCreationRequestDestinationTypes is String) {
    return enums.$ProfileCreationRequestDestinationTypesMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationRequestDestinationTypes.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileCreationRequestDestinationTypes
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  return enums.ProfileCreationRequestDestinationTypes.swaggerGeneratedUnknown;
}

List<String> profileCreationRequestDestinationTypesListToJson(
    List<enums.ProfileCreationRequestDestinationTypes>?
        profileCreationRequestDestinationTypes) {
  if (profileCreationRequestDestinationTypes == null) {
    return [];
  }

  return profileCreationRequestDestinationTypes
      .map((e) => enums.$ProfileCreationRequestDestinationTypesMap[e]!)
      .toList();
}

List<enums.ProfileCreationRequestDestinationTypes>
    profileCreationRequestDestinationTypesListFromJson(
        List? profileCreationRequestDestinationTypes) {
  if (profileCreationRequestDestinationTypes == null) {
    return [];
  }

  return profileCreationRequestDestinationTypes
      .map((e) => profileCreationRequestDestinationTypesFromJson(e.toString()))
      .toList();
}

String? profileCreationRequestTravelWithPersonFromSameCityToJson(
    enums.ProfileCreationRequestTravelWithPersonFromSameCity?
        profileCreationRequestTravelWithPersonFromSameCity) {
  return enums.$ProfileCreationRequestTravelWithPersonFromSameCityMap[
      profileCreationRequestTravelWithPersonFromSameCity];
}

enums.ProfileCreationRequestTravelWithPersonFromSameCity
    profileCreationRequestTravelWithPersonFromSameCityFromJson(
        Object? profileCreationRequestTravelWithPersonFromSameCity) {
  if (profileCreationRequestTravelWithPersonFromSameCity is int) {
    return enums.$ProfileCreationRequestTravelWithPersonFromSameCityMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationRequestTravelWithPersonFromSameCity.toString(),
            orElse: () => const MapEntry(
                enums.ProfileCreationRequestTravelWithPersonFromSameCity
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  if (profileCreationRequestTravelWithPersonFromSameCity is String) {
    return enums.$ProfileCreationRequestTravelWithPersonFromSameCityMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationRequestTravelWithPersonFromSameCity
                    .toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileCreationRequestTravelWithPersonFromSameCity
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  return enums.ProfileCreationRequestTravelWithPersonFromSameCity
      .swaggerGeneratedUnknown;
}

List<String> profileCreationRequestTravelWithPersonFromSameCityListToJson(
    List<enums.ProfileCreationRequestTravelWithPersonFromSameCity>?
        profileCreationRequestTravelWithPersonFromSameCity) {
  if (profileCreationRequestTravelWithPersonFromSameCity == null) {
    return [];
  }

  return profileCreationRequestTravelWithPersonFromSameCity
      .map((e) =>
          enums.$ProfileCreationRequestTravelWithPersonFromSameCityMap[e]!)
      .toList();
}

List<enums.ProfileCreationRequestTravelWithPersonFromSameCity>
    profileCreationRequestTravelWithPersonFromSameCityListFromJson(
        List? profileCreationRequestTravelWithPersonFromSameCity) {
  if (profileCreationRequestTravelWithPersonFromSameCity == null) {
    return [];
  }

  return profileCreationRequestTravelWithPersonFromSameCity
      .map((e) => profileCreationRequestTravelWithPersonFromSameCityFromJson(
          e.toString()))
      .toList();
}

String? profileCreationRequestTravelWithPersonFromSameCountryToJson(
    enums.ProfileCreationRequestTravelWithPersonFromSameCountry?
        profileCreationRequestTravelWithPersonFromSameCountry) {
  return enums.$ProfileCreationRequestTravelWithPersonFromSameCountryMap[
      profileCreationRequestTravelWithPersonFromSameCountry];
}

enums.ProfileCreationRequestTravelWithPersonFromSameCountry
    profileCreationRequestTravelWithPersonFromSameCountryFromJson(
        Object? profileCreationRequestTravelWithPersonFromSameCountry) {
  if (profileCreationRequestTravelWithPersonFromSameCountry is int) {
    return enums
        .$ProfileCreationRequestTravelWithPersonFromSameCountryMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationRequestTravelWithPersonFromSameCountry
                    .toString(),
            orElse: () => const MapEntry(
                enums.ProfileCreationRequestTravelWithPersonFromSameCountry
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  if (profileCreationRequestTravelWithPersonFromSameCountry is String) {
    return enums
        .$ProfileCreationRequestTravelWithPersonFromSameCountryMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationRequestTravelWithPersonFromSameCountry
                    .toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileCreationRequestTravelWithPersonFromSameCountry
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  return enums.ProfileCreationRequestTravelWithPersonFromSameCountry
      .swaggerGeneratedUnknown;
}

List<String> profileCreationRequestTravelWithPersonFromSameCountryListToJson(
    List<enums.ProfileCreationRequestTravelWithPersonFromSameCountry>?
        profileCreationRequestTravelWithPersonFromSameCountry) {
  if (profileCreationRequestTravelWithPersonFromSameCountry == null) {
    return [];
  }

  return profileCreationRequestTravelWithPersonFromSameCountry
      .map((e) =>
          enums.$ProfileCreationRequestTravelWithPersonFromSameCountryMap[e]!)
      .toList();
}

List<enums.ProfileCreationRequestTravelWithPersonFromSameCountry>
    profileCreationRequestTravelWithPersonFromSameCountryListFromJson(
        List? profileCreationRequestTravelWithPersonFromSameCountry) {
  if (profileCreationRequestTravelWithPersonFromSameCountry == null) {
    return [];
  }

  return profileCreationRequestTravelWithPersonFromSameCountry
      .map((e) => profileCreationRequestTravelWithPersonFromSameCountryFromJson(
          e.toString()))
      .toList();
}

String? profileCreationRequestTravelWithPersonSameLanguageToJson(
    enums.ProfileCreationRequestTravelWithPersonSameLanguage?
        profileCreationRequestTravelWithPersonSameLanguage) {
  return enums.$ProfileCreationRequestTravelWithPersonSameLanguageMap[
      profileCreationRequestTravelWithPersonSameLanguage];
}

enums.ProfileCreationRequestTravelWithPersonSameLanguage
    profileCreationRequestTravelWithPersonSameLanguageFromJson(
        Object? profileCreationRequestTravelWithPersonSameLanguage) {
  if (profileCreationRequestTravelWithPersonSameLanguage is int) {
    return enums.$ProfileCreationRequestTravelWithPersonSameLanguageMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationRequestTravelWithPersonSameLanguage.toString(),
            orElse: () => const MapEntry(
                enums.ProfileCreationRequestTravelWithPersonSameLanguage
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  if (profileCreationRequestTravelWithPersonSameLanguage is String) {
    return enums.$ProfileCreationRequestTravelWithPersonSameLanguageMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationRequestTravelWithPersonSameLanguage
                    .toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileCreationRequestTravelWithPersonSameLanguage
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  return enums.ProfileCreationRequestTravelWithPersonSameLanguage
      .swaggerGeneratedUnknown;
}

List<String> profileCreationRequestTravelWithPersonSameLanguageListToJson(
    List<enums.ProfileCreationRequestTravelWithPersonSameLanguage>?
        profileCreationRequestTravelWithPersonSameLanguage) {
  if (profileCreationRequestTravelWithPersonSameLanguage == null) {
    return [];
  }

  return profileCreationRequestTravelWithPersonSameLanguage
      .map((e) =>
          enums.$ProfileCreationRequestTravelWithPersonSameLanguageMap[e]!)
      .toList();
}

List<enums.ProfileCreationRequestTravelWithPersonSameLanguage>
    profileCreationRequestTravelWithPersonSameLanguageListFromJson(
        List? profileCreationRequestTravelWithPersonSameLanguage) {
  if (profileCreationRequestTravelWithPersonSameLanguage == null) {
    return [];
  }

  return profileCreationRequestTravelWithPersonSameLanguage
      .map((e) => profileCreationRequestTravelWithPersonSameLanguageFromJson(
          e.toString()))
      .toList();
}

String? profileCreationRequestGenderToJson(
    enums.ProfileCreationRequestGender? profileCreationRequestGender) {
  return enums.$ProfileCreationRequestGenderMap[profileCreationRequestGender];
}

enums.ProfileCreationRequestGender profileCreationRequestGenderFromJson(
    Object? profileCreationRequestGender) {
  if (profileCreationRequestGender is int) {
    return enums.$ProfileCreationRequestGenderMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationRequestGender.toString(),
            orElse: () => const MapEntry(
                enums.ProfileCreationRequestGender.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (profileCreationRequestGender is String) {
    return enums.$ProfileCreationRequestGenderMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationRequestGender.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileCreationRequestGender.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.ProfileCreationRequestGender.swaggerGeneratedUnknown;
}

List<String> profileCreationRequestGenderListToJson(
    List<enums.ProfileCreationRequestGender>? profileCreationRequestGender) {
  if (profileCreationRequestGender == null) {
    return [];
  }

  return profileCreationRequestGender
      .map((e) => enums.$ProfileCreationRequestGenderMap[e]!)
      .toList();
}

List<enums.ProfileCreationRequestGender>
    profileCreationRequestGenderListFromJson(
        List? profileCreationRequestGender) {
  if (profileCreationRequestGender == null) {
    return [];
  }

  return profileCreationRequestGender
      .map((e) => profileCreationRequestGenderFromJson(e.toString()))
      .toList();
}

String? profileCreationRequestChillOrVisitToJson(
    enums.ProfileCreationRequestChillOrVisit?
        profileCreationRequestChillOrVisit) {
  return enums.$ProfileCreationRequestChillOrVisitMap[
      profileCreationRequestChillOrVisit];
}

enums.ProfileCreationRequestChillOrVisit
    profileCreationRequestChillOrVisitFromJson(
        Object? profileCreationRequestChillOrVisit) {
  if (profileCreationRequestChillOrVisit is int) {
    return enums.$ProfileCreationRequestChillOrVisitMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationRequestChillOrVisit.toString(),
            orElse: () => const MapEntry(
                enums
                    .ProfileCreationRequestChillOrVisit.swaggerGeneratedUnknown,
                ''))
        .key;
  }

  if (profileCreationRequestChillOrVisit is String) {
    return enums.$ProfileCreationRequestChillOrVisitMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationRequestChillOrVisit.toLowerCase(),
            orElse: () => const MapEntry(
                enums
                    .ProfileCreationRequestChillOrVisit.swaggerGeneratedUnknown,
                ''))
        .key;
  }

  return enums.ProfileCreationRequestChillOrVisit.swaggerGeneratedUnknown;
}

List<String> profileCreationRequestChillOrVisitListToJson(
    List<enums.ProfileCreationRequestChillOrVisit>?
        profileCreationRequestChillOrVisit) {
  if (profileCreationRequestChillOrVisit == null) {
    return [];
  }

  return profileCreationRequestChillOrVisit
      .map((e) => enums.$ProfileCreationRequestChillOrVisitMap[e]!)
      .toList();
}

List<enums.ProfileCreationRequestChillOrVisit>
    profileCreationRequestChillOrVisitListFromJson(
        List? profileCreationRequestChillOrVisit) {
  if (profileCreationRequestChillOrVisit == null) {
    return [];
  }

  return profileCreationRequestChillOrVisit
      .map((e) => profileCreationRequestChillOrVisitFromJson(e.toString()))
      .toList();
}

String? profileCreationRequestAboutFoodToJson(
    enums.ProfileCreationRequestAboutFood? profileCreationRequestAboutFood) {
  return enums
      .$ProfileCreationRequestAboutFoodMap[profileCreationRequestAboutFood];
}

enums.ProfileCreationRequestAboutFood profileCreationRequestAboutFoodFromJson(
    Object? profileCreationRequestAboutFood) {
  if (profileCreationRequestAboutFood is int) {
    return enums.$ProfileCreationRequestAboutFoodMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationRequestAboutFood.toString(),
            orElse: () => const MapEntry(
                enums.ProfileCreationRequestAboutFood.swaggerGeneratedUnknown,
                ''))
        .key;
  }

  if (profileCreationRequestAboutFood is String) {
    return enums.$ProfileCreationRequestAboutFoodMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationRequestAboutFood.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileCreationRequestAboutFood.swaggerGeneratedUnknown,
                ''))
        .key;
  }

  return enums.ProfileCreationRequestAboutFood.swaggerGeneratedUnknown;
}

List<String> profileCreationRequestAboutFoodListToJson(
    List<enums.ProfileCreationRequestAboutFood>?
        profileCreationRequestAboutFood) {
  if (profileCreationRequestAboutFood == null) {
    return [];
  }

  return profileCreationRequestAboutFood
      .map((e) => enums.$ProfileCreationRequestAboutFoodMap[e]!)
      .toList();
}

List<enums.ProfileCreationRequestAboutFood>
    profileCreationRequestAboutFoodListFromJson(
        List? profileCreationRequestAboutFood) {
  if (profileCreationRequestAboutFood == null) {
    return [];
  }

  return profileCreationRequestAboutFood
      .map((e) => profileCreationRequestAboutFoodFromJson(e.toString()))
      .toList();
}

String? profileCreationRequestGoOutAtNightToJson(
    enums.ProfileCreationRequestGoOutAtNight?
        profileCreationRequestGoOutAtNight) {
  return enums.$ProfileCreationRequestGoOutAtNightMap[
      profileCreationRequestGoOutAtNight];
}

enums.ProfileCreationRequestGoOutAtNight
    profileCreationRequestGoOutAtNightFromJson(
        Object? profileCreationRequestGoOutAtNight) {
  if (profileCreationRequestGoOutAtNight is int) {
    return enums.$ProfileCreationRequestGoOutAtNightMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationRequestGoOutAtNight.toString(),
            orElse: () => const MapEntry(
                enums
                    .ProfileCreationRequestGoOutAtNight.swaggerGeneratedUnknown,
                ''))
        .key;
  }

  if (profileCreationRequestGoOutAtNight is String) {
    return enums.$ProfileCreationRequestGoOutAtNightMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationRequestGoOutAtNight.toLowerCase(),
            orElse: () => const MapEntry(
                enums
                    .ProfileCreationRequestGoOutAtNight.swaggerGeneratedUnknown,
                ''))
        .key;
  }

  return enums.ProfileCreationRequestGoOutAtNight.swaggerGeneratedUnknown;
}

List<String> profileCreationRequestGoOutAtNightListToJson(
    List<enums.ProfileCreationRequestGoOutAtNight>?
        profileCreationRequestGoOutAtNight) {
  if (profileCreationRequestGoOutAtNight == null) {
    return [];
  }

  return profileCreationRequestGoOutAtNight
      .map((e) => enums.$ProfileCreationRequestGoOutAtNightMap[e]!)
      .toList();
}

List<enums.ProfileCreationRequestGoOutAtNight>
    profileCreationRequestGoOutAtNightListFromJson(
        List? profileCreationRequestGoOutAtNight) {
  if (profileCreationRequestGoOutAtNight == null) {
    return [];
  }

  return profileCreationRequestGoOutAtNight
      .map((e) => profileCreationRequestGoOutAtNightFromJson(e.toString()))
      .toList();
}

String? profileCreationRequestSportToJson(
    enums.ProfileCreationRequestSport? profileCreationRequestSport) {
  return enums.$ProfileCreationRequestSportMap[profileCreationRequestSport];
}

enums.ProfileCreationRequestSport profileCreationRequestSportFromJson(
    Object? profileCreationRequestSport) {
  if (profileCreationRequestSport is int) {
    return enums.$ProfileCreationRequestSportMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationRequestSport.toString(),
            orElse: () => const MapEntry(
                enums.ProfileCreationRequestSport.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (profileCreationRequestSport is String) {
    return enums.$ProfileCreationRequestSportMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileCreationRequestSport.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileCreationRequestSport.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.ProfileCreationRequestSport.swaggerGeneratedUnknown;
}

List<String> profileCreationRequestSportListToJson(
    List<enums.ProfileCreationRequestSport>? profileCreationRequestSport) {
  if (profileCreationRequestSport == null) {
    return [];
  }

  return profileCreationRequestSport
      .map((e) => enums.$ProfileCreationRequestSportMap[e]!)
      .toList();
}

List<enums.ProfileCreationRequestSport> profileCreationRequestSportListFromJson(
    List? profileCreationRequestSport) {
  if (profileCreationRequestSport == null) {
    return [];
  }

  return profileCreationRequestSport
      .map((e) => profileCreationRequestSportFromJson(e.toString()))
      .toList();
}

String? groupInfoModelStateToJson(
    enums.GroupInfoModelState? groupInfoModelState) {
  return enums.$GroupInfoModelStateMap[groupInfoModelState];
}

enums.GroupInfoModelState groupInfoModelStateFromJson(
    Object? groupInfoModelState) {
  if (groupInfoModelState is int) {
    return enums.$GroupInfoModelStateMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == groupInfoModelState.toString(),
            orElse: () => const MapEntry(
                enums.GroupInfoModelState.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (groupInfoModelState is String) {
    return enums.$GroupInfoModelStateMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                groupInfoModelState.toLowerCase(),
            orElse: () => const MapEntry(
                enums.GroupInfoModelState.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.GroupInfoModelState.swaggerGeneratedUnknown;
}

List<String> groupInfoModelStateListToJson(
    List<enums.GroupInfoModelState>? groupInfoModelState) {
  if (groupInfoModelState == null) {
    return [];
  }

  return groupInfoModelState
      .map((e) => enums.$GroupInfoModelStateMap[e]!)
      .toList();
}

List<enums.GroupInfoModelState> groupInfoModelStateListFromJson(
    List? groupInfoModelState) {
  if (groupInfoModelState == null) {
    return [];
  }

  return groupInfoModelState
      .map((e) => groupInfoModelStateFromJson(e.toString()))
      .toList();
}

String? placesFromCoordinatesRequestCategoriesToJson(
    enums.PlacesFromCoordinatesRequestCategories?
        placesFromCoordinatesRequestCategories) {
  return enums.$PlacesFromCoordinatesRequestCategoriesMap[
      placesFromCoordinatesRequestCategories];
}

enums.PlacesFromCoordinatesRequestCategories
    placesFromCoordinatesRequestCategoriesFromJson(
        Object? placesFromCoordinatesRequestCategories) {
  if (placesFromCoordinatesRequestCategories is int) {
    return enums.$PlacesFromCoordinatesRequestCategoriesMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                placesFromCoordinatesRequestCategories.toString(),
            orElse: () => const MapEntry(
                enums.PlacesFromCoordinatesRequestCategories
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  if (placesFromCoordinatesRequestCategories is String) {
    return enums.$PlacesFromCoordinatesRequestCategoriesMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                placesFromCoordinatesRequestCategories.toLowerCase(),
            orElse: () => const MapEntry(
                enums.PlacesFromCoordinatesRequestCategories
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  return enums.PlacesFromCoordinatesRequestCategories.swaggerGeneratedUnknown;
}

List<String> placesFromCoordinatesRequestCategoriesListToJson(
    List<enums.PlacesFromCoordinatesRequestCategories>?
        placesFromCoordinatesRequestCategories) {
  if (placesFromCoordinatesRequestCategories == null) {
    return [];
  }

  return placesFromCoordinatesRequestCategories
      .map((e) => enums.$PlacesFromCoordinatesRequestCategoriesMap[e]!)
      .toList();
}

List<enums.PlacesFromCoordinatesRequestCategories>
    placesFromCoordinatesRequestCategoriesListFromJson(
        List? placesFromCoordinatesRequestCategories) {
  if (placesFromCoordinatesRequestCategories == null) {
    return [];
  }

  return placesFromCoordinatesRequestCategories
      .map((e) => placesFromCoordinatesRequestCategoriesFromJson(e.toString()))
      .toList();
}

String? profileModelDestinationTypesToJson(
    enums.ProfileModelDestinationTypes? profileModelDestinationTypes) {
  return enums.$ProfileModelDestinationTypesMap[profileModelDestinationTypes];
}

enums.ProfileModelDestinationTypes profileModelDestinationTypesFromJson(
    Object? profileModelDestinationTypes) {
  if (profileModelDestinationTypes is int) {
    return enums.$ProfileModelDestinationTypesMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileModelDestinationTypes.toString(),
            orElse: () => const MapEntry(
                enums.ProfileModelDestinationTypes.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (profileModelDestinationTypes is String) {
    return enums.$ProfileModelDestinationTypesMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileModelDestinationTypes.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileModelDestinationTypes.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.ProfileModelDestinationTypes.swaggerGeneratedUnknown;
}

List<String> profileModelDestinationTypesListToJson(
    List<enums.ProfileModelDestinationTypes>? profileModelDestinationTypes) {
  if (profileModelDestinationTypes == null) {
    return [];
  }

  return profileModelDestinationTypes
      .map((e) => enums.$ProfileModelDestinationTypesMap[e]!)
      .toList();
}

List<enums.ProfileModelDestinationTypes>
    profileModelDestinationTypesListFromJson(
        List? profileModelDestinationTypes) {
  if (profileModelDestinationTypes == null) {
    return [];
  }

  return profileModelDestinationTypes
      .map((e) => profileModelDestinationTypesFromJson(e.toString()))
      .toList();
}

String? profileModelTravelWithPersonFromSameCityToJson(
    enums.ProfileModelTravelWithPersonFromSameCity?
        profileModelTravelWithPersonFromSameCity) {
  return enums.$ProfileModelTravelWithPersonFromSameCityMap[
      profileModelTravelWithPersonFromSameCity];
}

enums.ProfileModelTravelWithPersonFromSameCity
    profileModelTravelWithPersonFromSameCityFromJson(
        Object? profileModelTravelWithPersonFromSameCity) {
  if (profileModelTravelWithPersonFromSameCity is int) {
    return enums.$ProfileModelTravelWithPersonFromSameCityMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileModelTravelWithPersonFromSameCity.toString(),
            orElse: () => const MapEntry(
                enums.ProfileModelTravelWithPersonFromSameCity
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  if (profileModelTravelWithPersonFromSameCity is String) {
    return enums.$ProfileModelTravelWithPersonFromSameCityMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileModelTravelWithPersonFromSameCity.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileModelTravelWithPersonFromSameCity
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  return enums.ProfileModelTravelWithPersonFromSameCity.swaggerGeneratedUnknown;
}

List<String> profileModelTravelWithPersonFromSameCityListToJson(
    List<enums.ProfileModelTravelWithPersonFromSameCity>?
        profileModelTravelWithPersonFromSameCity) {
  if (profileModelTravelWithPersonFromSameCity == null) {
    return [];
  }

  return profileModelTravelWithPersonFromSameCity
      .map((e) => enums.$ProfileModelTravelWithPersonFromSameCityMap[e]!)
      .toList();
}

List<enums.ProfileModelTravelWithPersonFromSameCity>
    profileModelTravelWithPersonFromSameCityListFromJson(
        List? profileModelTravelWithPersonFromSameCity) {
  if (profileModelTravelWithPersonFromSameCity == null) {
    return [];
  }

  return profileModelTravelWithPersonFromSameCity
      .map(
          (e) => profileModelTravelWithPersonFromSameCityFromJson(e.toString()))
      .toList();
}

String? profileModelTravelWithPersonFromSameCountryToJson(
    enums.ProfileModelTravelWithPersonFromSameCountry?
        profileModelTravelWithPersonFromSameCountry) {
  return enums.$ProfileModelTravelWithPersonFromSameCountryMap[
      profileModelTravelWithPersonFromSameCountry];
}

enums.ProfileModelTravelWithPersonFromSameCountry
    profileModelTravelWithPersonFromSameCountryFromJson(
        Object? profileModelTravelWithPersonFromSameCountry) {
  if (profileModelTravelWithPersonFromSameCountry is int) {
    return enums.$ProfileModelTravelWithPersonFromSameCountryMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileModelTravelWithPersonFromSameCountry.toString(),
            orElse: () => const MapEntry(
                enums.ProfileModelTravelWithPersonFromSameCountry
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  if (profileModelTravelWithPersonFromSameCountry is String) {
    return enums.$ProfileModelTravelWithPersonFromSameCountryMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileModelTravelWithPersonFromSameCountry.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileModelTravelWithPersonFromSameCountry
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  return enums
      .ProfileModelTravelWithPersonFromSameCountry.swaggerGeneratedUnknown;
}

List<String> profileModelTravelWithPersonFromSameCountryListToJson(
    List<enums.ProfileModelTravelWithPersonFromSameCountry>?
        profileModelTravelWithPersonFromSameCountry) {
  if (profileModelTravelWithPersonFromSameCountry == null) {
    return [];
  }

  return profileModelTravelWithPersonFromSameCountry
      .map((e) => enums.$ProfileModelTravelWithPersonFromSameCountryMap[e]!)
      .toList();
}

List<enums.ProfileModelTravelWithPersonFromSameCountry>
    profileModelTravelWithPersonFromSameCountryListFromJson(
        List? profileModelTravelWithPersonFromSameCountry) {
  if (profileModelTravelWithPersonFromSameCountry == null) {
    return [];
  }

  return profileModelTravelWithPersonFromSameCountry
      .map((e) =>
          profileModelTravelWithPersonFromSameCountryFromJson(e.toString()))
      .toList();
}

String? profileModelTravelWithPersonSameLanguageToJson(
    enums.ProfileModelTravelWithPersonSameLanguage?
        profileModelTravelWithPersonSameLanguage) {
  return enums.$ProfileModelTravelWithPersonSameLanguageMap[
      profileModelTravelWithPersonSameLanguage];
}

enums.ProfileModelTravelWithPersonSameLanguage
    profileModelTravelWithPersonSameLanguageFromJson(
        Object? profileModelTravelWithPersonSameLanguage) {
  if (profileModelTravelWithPersonSameLanguage is int) {
    return enums.$ProfileModelTravelWithPersonSameLanguageMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileModelTravelWithPersonSameLanguage.toString(),
            orElse: () => const MapEntry(
                enums.ProfileModelTravelWithPersonSameLanguage
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  if (profileModelTravelWithPersonSameLanguage is String) {
    return enums.$ProfileModelTravelWithPersonSameLanguageMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileModelTravelWithPersonSameLanguage.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileModelTravelWithPersonSameLanguage
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  return enums.ProfileModelTravelWithPersonSameLanguage.swaggerGeneratedUnknown;
}

List<String> profileModelTravelWithPersonSameLanguageListToJson(
    List<enums.ProfileModelTravelWithPersonSameLanguage>?
        profileModelTravelWithPersonSameLanguage) {
  if (profileModelTravelWithPersonSameLanguage == null) {
    return [];
  }

  return profileModelTravelWithPersonSameLanguage
      .map((e) => enums.$ProfileModelTravelWithPersonSameLanguageMap[e]!)
      .toList();
}

List<enums.ProfileModelTravelWithPersonSameLanguage>
    profileModelTravelWithPersonSameLanguageListFromJson(
        List? profileModelTravelWithPersonSameLanguage) {
  if (profileModelTravelWithPersonSameLanguage == null) {
    return [];
  }

  return profileModelTravelWithPersonSameLanguage
      .map(
          (e) => profileModelTravelWithPersonSameLanguageFromJson(e.toString()))
      .toList();
}

String? profileModelGenderToJson(enums.ProfileModelGender? profileModelGender) {
  return enums.$ProfileModelGenderMap[profileModelGender];
}

enums.ProfileModelGender profileModelGenderFromJson(
    Object? profileModelGender) {
  if (profileModelGender is int) {
    return enums.$ProfileModelGenderMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == profileModelGender.toString(),
            orElse: () => const MapEntry(
                enums.ProfileModelGender.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (profileModelGender is String) {
    return enums.$ProfileModelGenderMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == profileModelGender.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileModelGender.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.ProfileModelGender.swaggerGeneratedUnknown;
}

List<String> profileModelGenderListToJson(
    List<enums.ProfileModelGender>? profileModelGender) {
  if (profileModelGender == null) {
    return [];
  }

  return profileModelGender
      .map((e) => enums.$ProfileModelGenderMap[e]!)
      .toList();
}

List<enums.ProfileModelGender> profileModelGenderListFromJson(
    List? profileModelGender) {
  if (profileModelGender == null) {
    return [];
  }

  return profileModelGender
      .map((e) => profileModelGenderFromJson(e.toString()))
      .toList();
}

String? profileModelChillOrVisitToJson(
    enums.ProfileModelChillOrVisit? profileModelChillOrVisit) {
  return enums.$ProfileModelChillOrVisitMap[profileModelChillOrVisit];
}

enums.ProfileModelChillOrVisit profileModelChillOrVisitFromJson(
    Object? profileModelChillOrVisit) {
  if (profileModelChillOrVisit is int) {
    return enums.$ProfileModelChillOrVisitMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileModelChillOrVisit.toString(),
            orElse: () => const MapEntry(
                enums.ProfileModelChillOrVisit.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (profileModelChillOrVisit is String) {
    return enums.$ProfileModelChillOrVisitMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileModelChillOrVisit.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileModelChillOrVisit.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.ProfileModelChillOrVisit.swaggerGeneratedUnknown;
}

List<String> profileModelChillOrVisitListToJson(
    List<enums.ProfileModelChillOrVisit>? profileModelChillOrVisit) {
  if (profileModelChillOrVisit == null) {
    return [];
  }

  return profileModelChillOrVisit
      .map((e) => enums.$ProfileModelChillOrVisitMap[e]!)
      .toList();
}

List<enums.ProfileModelChillOrVisit> profileModelChillOrVisitListFromJson(
    List? profileModelChillOrVisit) {
  if (profileModelChillOrVisit == null) {
    return [];
  }

  return profileModelChillOrVisit
      .map((e) => profileModelChillOrVisitFromJson(e.toString()))
      .toList();
}

String? profileModelAboutFoodToJson(
    enums.ProfileModelAboutFood? profileModelAboutFood) {
  return enums.$ProfileModelAboutFoodMap[profileModelAboutFood];
}

enums.ProfileModelAboutFood profileModelAboutFoodFromJson(
    Object? profileModelAboutFood) {
  if (profileModelAboutFood is int) {
    return enums.$ProfileModelAboutFoodMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == profileModelAboutFood.toString(),
            orElse: () => const MapEntry(
                enums.ProfileModelAboutFood.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (profileModelAboutFood is String) {
    return enums.$ProfileModelAboutFoodMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileModelAboutFood.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileModelAboutFood.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.ProfileModelAboutFood.swaggerGeneratedUnknown;
}

List<String> profileModelAboutFoodListToJson(
    List<enums.ProfileModelAboutFood>? profileModelAboutFood) {
  if (profileModelAboutFood == null) {
    return [];
  }

  return profileModelAboutFood
      .map((e) => enums.$ProfileModelAboutFoodMap[e]!)
      .toList();
}

List<enums.ProfileModelAboutFood> profileModelAboutFoodListFromJson(
    List? profileModelAboutFood) {
  if (profileModelAboutFood == null) {
    return [];
  }

  return profileModelAboutFood
      .map((e) => profileModelAboutFoodFromJson(e.toString()))
      .toList();
}

String? profileModelGoOutAtNightToJson(
    enums.ProfileModelGoOutAtNight? profileModelGoOutAtNight) {
  return enums.$ProfileModelGoOutAtNightMap[profileModelGoOutAtNight];
}

enums.ProfileModelGoOutAtNight profileModelGoOutAtNightFromJson(
    Object? profileModelGoOutAtNight) {
  if (profileModelGoOutAtNight is int) {
    return enums.$ProfileModelGoOutAtNightMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileModelGoOutAtNight.toString(),
            orElse: () => const MapEntry(
                enums.ProfileModelGoOutAtNight.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (profileModelGoOutAtNight is String) {
    return enums.$ProfileModelGoOutAtNightMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileModelGoOutAtNight.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileModelGoOutAtNight.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.ProfileModelGoOutAtNight.swaggerGeneratedUnknown;
}

List<String> profileModelGoOutAtNightListToJson(
    List<enums.ProfileModelGoOutAtNight>? profileModelGoOutAtNight) {
  if (profileModelGoOutAtNight == null) {
    return [];
  }

  return profileModelGoOutAtNight
      .map((e) => enums.$ProfileModelGoOutAtNightMap[e]!)
      .toList();
}

List<enums.ProfileModelGoOutAtNight> profileModelGoOutAtNightListFromJson(
    List? profileModelGoOutAtNight) {
  if (profileModelGoOutAtNight == null) {
    return [];
  }

  return profileModelGoOutAtNight
      .map((e) => profileModelGoOutAtNightFromJson(e.toString()))
      .toList();
}

String? profileModelSportToJson(enums.ProfileModelSport? profileModelSport) {
  return enums.$ProfileModelSportMap[profileModelSport];
}

enums.ProfileModelSport profileModelSportFromJson(Object? profileModelSport) {
  if (profileModelSport is int) {
    return enums.$ProfileModelSportMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == profileModelSport.toString(),
            orElse: () => const MapEntry(
                enums.ProfileModelSport.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (profileModelSport is String) {
    return enums.$ProfileModelSportMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == profileModelSport.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileModelSport.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.ProfileModelSport.swaggerGeneratedUnknown;
}

List<String> profileModelSportListToJson(
    List<enums.ProfileModelSport>? profileModelSport) {
  if (profileModelSport == null) {
    return [];
  }

  return profileModelSport.map((e) => enums.$ProfileModelSportMap[e]!).toList();
}

List<enums.ProfileModelSport> profileModelSportListFromJson(
    List? profileModelSport) {
  if (profileModelSport == null) {
    return [];
  }

  return profileModelSport
      .map((e) => profileModelSportFromJson(e.toString()))
      .toList();
}

String? placesFromAddressRequestCategoriesToJson(
    enums.PlacesFromAddressRequestCategories?
        placesFromAddressRequestCategories) {
  return enums.$PlacesFromAddressRequestCategoriesMap[
      placesFromAddressRequestCategories];
}

enums.PlacesFromAddressRequestCategories
    placesFromAddressRequestCategoriesFromJson(
        Object? placesFromAddressRequestCategories) {
  if (placesFromAddressRequestCategories is int) {
    return enums.$PlacesFromAddressRequestCategoriesMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                placesFromAddressRequestCategories.toString(),
            orElse: () => const MapEntry(
                enums
                    .PlacesFromAddressRequestCategories.swaggerGeneratedUnknown,
                ''))
        .key;
  }

  if (placesFromAddressRequestCategories is String) {
    return enums.$PlacesFromAddressRequestCategoriesMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                placesFromAddressRequestCategories.toLowerCase(),
            orElse: () => const MapEntry(
                enums
                    .PlacesFromAddressRequestCategories.swaggerGeneratedUnknown,
                ''))
        .key;
  }

  return enums.PlacesFromAddressRequestCategories.swaggerGeneratedUnknown;
}

List<String> placesFromAddressRequestCategoriesListToJson(
    List<enums.PlacesFromAddressRequestCategories>?
        placesFromAddressRequestCategories) {
  if (placesFromAddressRequestCategories == null) {
    return [];
  }

  return placesFromAddressRequestCategories
      .map((e) => enums.$PlacesFromAddressRequestCategoriesMap[e]!)
      .toList();
}

List<enums.PlacesFromAddressRequestCategories>
    placesFromAddressRequestCategoriesListFromJson(
        List? placesFromAddressRequestCategories) {
  if (placesFromAddressRequestCategories == null) {
    return [];
  }

  return placesFromAddressRequestCategories
      .map((e) => placesFromAddressRequestCategoriesFromJson(e.toString()))
      .toList();
}

String? messageResponseType$ToJson(
    enums.MessageResponseType$? messageResponseType$) {
  return enums.$MessageResponseType$Map[messageResponseType$];
}

enums.MessageResponseType$ messageResponseType$FromJson(
    Object? messageResponseType$) {
  if (messageResponseType$ is int) {
    return enums.$MessageResponseType$Map.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == messageResponseType$.toString(),
            orElse: () => const MapEntry(
                enums.MessageResponseType$.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (messageResponseType$ is String) {
    return enums.$MessageResponseType$Map.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                messageResponseType$.toLowerCase(),
            orElse: () => const MapEntry(
                enums.MessageResponseType$.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.MessageResponseType$.swaggerGeneratedUnknown;
}

List<String> messageResponseType$ListToJson(
    List<enums.MessageResponseType$>? messageResponseType$) {
  if (messageResponseType$ == null) {
    return [];
  }

  return messageResponseType$
      .map((e) => enums.$MessageResponseType$Map[e]!)
      .toList();
}

List<enums.MessageResponseType$> messageResponseType$ListFromJson(
    List? messageResponseType$) {
  if (messageResponseType$ == null) {
    return [];
  }

  return messageResponseType$
      .map((e) => messageResponseType$FromJson(e.toString()))
      .toList();
}

String? updatePrivateGroupRequestStateToJson(
    enums.UpdatePrivateGroupRequestState? updatePrivateGroupRequestState) {
  return enums
      .$UpdatePrivateGroupRequestStateMap[updatePrivateGroupRequestState];
}

enums.UpdatePrivateGroupRequestState updatePrivateGroupRequestStateFromJson(
    Object? updatePrivateGroupRequestState) {
  if (updatePrivateGroupRequestState is int) {
    return enums.$UpdatePrivateGroupRequestStateMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                updatePrivateGroupRequestState.toString(),
            orElse: () => const MapEntry(
                enums.UpdatePrivateGroupRequestState.swaggerGeneratedUnknown,
                ''))
        .key;
  }

  if (updatePrivateGroupRequestState is String) {
    return enums.$UpdatePrivateGroupRequestStateMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                updatePrivateGroupRequestState.toLowerCase(),
            orElse: () => const MapEntry(
                enums.UpdatePrivateGroupRequestState.swaggerGeneratedUnknown,
                ''))
        .key;
  }

  return enums.UpdatePrivateGroupRequestState.swaggerGeneratedUnknown;
}

List<String> updatePrivateGroupRequestStateListToJson(
    List<enums.UpdatePrivateGroupRequestState>?
        updatePrivateGroupRequestState) {
  if (updatePrivateGroupRequestState == null) {
    return [];
  }

  return updatePrivateGroupRequestState
      .map((e) => enums.$UpdatePrivateGroupRequestStateMap[e]!)
      .toList();
}

List<enums.UpdatePrivateGroupRequestState>
    updatePrivateGroupRequestStateListFromJson(
        List? updatePrivateGroupRequestState) {
  if (updatePrivateGroupRequestState == null) {
    return [];
  }

  return updatePrivateGroupRequestState
      .map((e) => updatePrivateGroupRequestStateFromJson(e.toString()))
      .toList();
}

String? updateReportRequestReasonToJson(
    enums.UpdateReportRequestReason? updateReportRequestReason) {
  return enums.$UpdateReportRequestReasonMap[updateReportRequestReason];
}

enums.UpdateReportRequestReason updateReportRequestReasonFromJson(
    Object? updateReportRequestReason) {
  if (updateReportRequestReason is int) {
    return enums.$UpdateReportRequestReasonMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                updateReportRequestReason.toString(),
            orElse: () => const MapEntry(
                enums.UpdateReportRequestReason.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (updateReportRequestReason is String) {
    return enums.$UpdateReportRequestReasonMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                updateReportRequestReason.toLowerCase(),
            orElse: () => const MapEntry(
                enums.UpdateReportRequestReason.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.UpdateReportRequestReason.swaggerGeneratedUnknown;
}

List<String> updateReportRequestReasonListToJson(
    List<enums.UpdateReportRequestReason>? updateReportRequestReason) {
  if (updateReportRequestReason == null) {
    return [];
  }

  return updateReportRequestReason
      .map((e) => enums.$UpdateReportRequestReasonMap[e]!)
      .toList();
}

List<enums.UpdateReportRequestReason> updateReportRequestReasonListFromJson(
    List? updateReportRequestReason) {
  if (updateReportRequestReason == null) {
    return [];
  }

  return updateReportRequestReason
      .map((e) => updateReportRequestReasonFromJson(e.toString()))
      .toList();
}

String? postSurveyRequestType$ToJson(
    enums.PostSurveyRequestType$? postSurveyRequestType$) {
  return enums.$PostSurveyRequestType$Map[postSurveyRequestType$];
}

enums.PostSurveyRequestType$ postSurveyRequestType$FromJson(
    Object? postSurveyRequestType$) {
  if (postSurveyRequestType$ is int) {
    return enums.$PostSurveyRequestType$Map.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                postSurveyRequestType$.toString(),
            orElse: () => const MapEntry(
                enums.PostSurveyRequestType$.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (postSurveyRequestType$ is String) {
    return enums.$PostSurveyRequestType$Map.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                postSurveyRequestType$.toLowerCase(),
            orElse: () => const MapEntry(
                enums.PostSurveyRequestType$.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.PostSurveyRequestType$.swaggerGeneratedUnknown;
}

List<String> postSurveyRequestType$ListToJson(
    List<enums.PostSurveyRequestType$>? postSurveyRequestType$) {
  if (postSurveyRequestType$ == null) {
    return [];
  }

  return postSurveyRequestType$
      .map((e) => enums.$PostSurveyRequestType$Map[e]!)
      .toList();
}

List<enums.PostSurveyRequestType$> postSurveyRequestType$ListFromJson(
    List? postSurveyRequestType$) {
  if (postSurveyRequestType$ == null) {
    return [];
  }

  return postSurveyRequestType$
      .map((e) => postSurveyRequestType$FromJson(e.toString()))
      .toList();
}

String? userModelGenderToJson(enums.UserModelGender? userModelGender) {
  return enums.$UserModelGenderMap[userModelGender];
}

enums.UserModelGender userModelGenderFromJson(Object? userModelGender) {
  if (userModelGender is int) {
    return enums.$UserModelGenderMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == userModelGender.toString(),
            orElse: () => const MapEntry(
                enums.UserModelGender.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (userModelGender is String) {
    return enums.$UserModelGenderMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == userModelGender.toLowerCase(),
            orElse: () => const MapEntry(
                enums.UserModelGender.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.UserModelGender.swaggerGeneratedUnknown;
}

List<String> userModelGenderListToJson(
    List<enums.UserModelGender>? userModelGender) {
  if (userModelGender == null) {
    return [];
  }

  return userModelGender.map((e) => enums.$UserModelGenderMap[e]!).toList();
}

List<enums.UserModelGender> userModelGenderListFromJson(List? userModelGender) {
  if (userModelGender == null) {
    return [];
  }

  return userModelGender
      .map((e) => userModelGenderFromJson(e.toString()))
      .toList();
}

String? userModelRolesToJson(enums.UserModelRoles? userModelRoles) {
  return enums.$UserModelRolesMap[userModelRoles];
}

enums.UserModelRoles userModelRolesFromJson(Object? userModelRoles) {
  if (userModelRoles is int) {
    return enums.$UserModelRolesMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == userModelRoles.toString(),
            orElse: () => const MapEntry(
                enums.UserModelRoles.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (userModelRoles is String) {
    return enums.$UserModelRolesMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == userModelRoles.toLowerCase(),
            orElse: () => const MapEntry(
                enums.UserModelRoles.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.UserModelRoles.swaggerGeneratedUnknown;
}

List<String> userModelRolesListToJson(
    List<enums.UserModelRoles>? userModelRoles) {
  if (userModelRoles == null) {
    return [];
  }

  return userModelRoles.map((e) => enums.$UserModelRolesMap[e]!).toList();
}

List<enums.UserModelRoles> userModelRolesListFromJson(List? userModelRoles) {
  if (userModelRoles == null) {
    return [];
  }

  return userModelRoles
      .map((e) => userModelRolesFromJson(e.toString()))
      .toList();
}

String? reportResponseReasonToJson(
    enums.ReportResponseReason? reportResponseReason) {
  return enums.$ReportResponseReasonMap[reportResponseReason];
}

enums.ReportResponseReason reportResponseReasonFromJson(
    Object? reportResponseReason) {
  if (reportResponseReason is int) {
    return enums.$ReportResponseReasonMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == reportResponseReason.toString(),
            orElse: () => const MapEntry(
                enums.ReportResponseReason.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (reportResponseReason is String) {
    return enums.$ReportResponseReasonMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                reportResponseReason.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ReportResponseReason.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.ReportResponseReason.swaggerGeneratedUnknown;
}

List<String> reportResponseReasonListToJson(
    List<enums.ReportResponseReason>? reportResponseReason) {
  if (reportResponseReason == null) {
    return [];
  }

  return reportResponseReason
      .map((e) => enums.$ReportResponseReasonMap[e]!)
      .toList();
}

List<enums.ReportResponseReason> reportResponseReasonListFromJson(
    List? reportResponseReason) {
  if (reportResponseReason == null) {
    return [];
  }

  return reportResponseReason
      .map((e) => reportResponseReasonFromJson(e.toString()))
      .toList();
}

String? matchMakingResultType$ToJson(
    enums.MatchMakingResultType$? matchMakingResultType$) {
  return enums.$MatchMakingResultType$Map[matchMakingResultType$];
}

enums.MatchMakingResultType$ matchMakingResultType$FromJson(
    Object? matchMakingResultType$) {
  if (matchMakingResultType$ is int) {
    return enums.$MatchMakingResultType$Map.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                matchMakingResultType$.toString(),
            orElse: () => const MapEntry(
                enums.MatchMakingResultType$.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (matchMakingResultType$ is String) {
    return enums.$MatchMakingResultType$Map.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                matchMakingResultType$.toLowerCase(),
            orElse: () => const MapEntry(
                enums.MatchMakingResultType$.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.MatchMakingResultType$.swaggerGeneratedUnknown;
}

List<String> matchMakingResultType$ListToJson(
    List<enums.MatchMakingResultType$>? matchMakingResultType$) {
  if (matchMakingResultType$ == null) {
    return [];
  }

  return matchMakingResultType$
      .map((e) => enums.$MatchMakingResultType$Map[e]!)
      .toList();
}

List<enums.MatchMakingResultType$> matchMakingResultType$ListFromJson(
    List? matchMakingResultType$) {
  if (matchMakingResultType$ == null) {
    return [];
  }

  return matchMakingResultType$
      .map((e) => matchMakingResultType$FromJson(e.toString()))
      .toList();
}

String? submitReportRequestReasonToJson(
    enums.SubmitReportRequestReason? submitReportRequestReason) {
  return enums.$SubmitReportRequestReasonMap[submitReportRequestReason];
}

enums.SubmitReportRequestReason submitReportRequestReasonFromJson(
    Object? submitReportRequestReason) {
  if (submitReportRequestReason is int) {
    return enums.$SubmitReportRequestReasonMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                submitReportRequestReason.toString(),
            orElse: () => const MapEntry(
                enums.SubmitReportRequestReason.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (submitReportRequestReason is String) {
    return enums.$SubmitReportRequestReasonMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                submitReportRequestReason.toLowerCase(),
            orElse: () => const MapEntry(
                enums.SubmitReportRequestReason.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.SubmitReportRequestReason.swaggerGeneratedUnknown;
}

List<String> submitReportRequestReasonListToJson(
    List<enums.SubmitReportRequestReason>? submitReportRequestReason) {
  if (submitReportRequestReason == null) {
    return [];
  }

  return submitReportRequestReason
      .map((e) => enums.$SubmitReportRequestReasonMap[e]!)
      .toList();
}

List<enums.SubmitReportRequestReason> submitReportRequestReasonListFromJson(
    List? submitReportRequestReason) {
  if (submitReportRequestReason == null) {
    return [];
  }

  return submitReportRequestReason
      .map((e) => submitReportRequestReasonFromJson(e.toString()))
      .toList();
}

String? groupResponseStateToJson(enums.GroupResponseState? groupResponseState) {
  return enums.$GroupResponseStateMap[groupResponseState];
}

enums.GroupResponseState groupResponseStateFromJson(
    Object? groupResponseState) {
  if (groupResponseState is int) {
    return enums.$GroupResponseStateMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == groupResponseState.toString(),
            orElse: () => const MapEntry(
                enums.GroupResponseState.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (groupResponseState is String) {
    return enums.$GroupResponseStateMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == groupResponseState.toLowerCase(),
            orElse: () => const MapEntry(
                enums.GroupResponseState.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.GroupResponseState.swaggerGeneratedUnknown;
}

List<String> groupResponseStateListToJson(
    List<enums.GroupResponseState>? groupResponseState) {
  if (groupResponseState == null) {
    return [];
  }

  return groupResponseState
      .map((e) => enums.$GroupResponseStateMap[e]!)
      .toList();
}

List<enums.GroupResponseState> groupResponseStateListFromJson(
    List? groupResponseState) {
  if (groupResponseState == null) {
    return [];
  }

  return groupResponseState
      .map((e) => groupResponseStateFromJson(e.toString()))
      .toList();
}

String? userResponseGenderToJson(enums.UserResponseGender? userResponseGender) {
  return enums.$UserResponseGenderMap[userResponseGender];
}

enums.UserResponseGender userResponseGenderFromJson(
    Object? userResponseGender) {
  if (userResponseGender is int) {
    return enums.$UserResponseGenderMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == userResponseGender.toString(),
            orElse: () => const MapEntry(
                enums.UserResponseGender.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (userResponseGender is String) {
    return enums.$UserResponseGenderMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == userResponseGender.toLowerCase(),
            orElse: () => const MapEntry(
                enums.UserResponseGender.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.UserResponseGender.swaggerGeneratedUnknown;
}

List<String> userResponseGenderListToJson(
    List<enums.UserResponseGender>? userResponseGender) {
  if (userResponseGender == null) {
    return [];
  }

  return userResponseGender
      .map((e) => enums.$UserResponseGenderMap[e]!)
      .toList();
}

List<enums.UserResponseGender> userResponseGenderListFromJson(
    List? userResponseGender) {
  if (userResponseGender == null) {
    return [];
  }

  return userResponseGender
      .map((e) => userResponseGenderFromJson(e.toString()))
      .toList();
}

String? surveyModelType$ToJson(enums.SurveyModelType$? surveyModelType$) {
  return enums.$SurveyModelType$Map[surveyModelType$];
}

enums.SurveyModelType$ surveyModelType$FromJson(Object? surveyModelType$) {
  if (surveyModelType$ is int) {
    return enums.$SurveyModelType$Map.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == surveyModelType$.toString(),
            orElse: () => const MapEntry(
                enums.SurveyModelType$.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (surveyModelType$ is String) {
    return enums.$SurveyModelType$Map.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() == surveyModelType$.toLowerCase(),
            orElse: () => const MapEntry(
                enums.SurveyModelType$.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.SurveyModelType$.swaggerGeneratedUnknown;
}

List<String> surveyModelType$ListToJson(
    List<enums.SurveyModelType$>? surveyModelType$) {
  if (surveyModelType$ == null) {
    return [];
  }

  return surveyModelType$.map((e) => enums.$SurveyModelType$Map[e]!).toList();
}

List<enums.SurveyModelType$> surveyModelType$ListFromJson(
    List? surveyModelType$) {
  if (surveyModelType$ == null) {
    return [];
  }

  return surveyModelType$
      .map((e) => surveyModelType$FromJson(e.toString()))
      .toList();
}

String? profileUpdateRequestDestinationTypesToJson(
    enums.ProfileUpdateRequestDestinationTypes?
        profileUpdateRequestDestinationTypes) {
  return enums.$ProfileUpdateRequestDestinationTypesMap[
      profileUpdateRequestDestinationTypes];
}

enums.ProfileUpdateRequestDestinationTypes
    profileUpdateRequestDestinationTypesFromJson(
        Object? profileUpdateRequestDestinationTypes) {
  if (profileUpdateRequestDestinationTypes is int) {
    return enums.$ProfileUpdateRequestDestinationTypesMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileUpdateRequestDestinationTypes.toString(),
            orElse: () => const MapEntry(
                enums.ProfileUpdateRequestDestinationTypes
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  if (profileUpdateRequestDestinationTypes is String) {
    return enums.$ProfileUpdateRequestDestinationTypesMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileUpdateRequestDestinationTypes.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileUpdateRequestDestinationTypes
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  return enums.ProfileUpdateRequestDestinationTypes.swaggerGeneratedUnknown;
}

List<String> profileUpdateRequestDestinationTypesListToJson(
    List<enums.ProfileUpdateRequestDestinationTypes>?
        profileUpdateRequestDestinationTypes) {
  if (profileUpdateRequestDestinationTypes == null) {
    return [];
  }

  return profileUpdateRequestDestinationTypes
      .map((e) => enums.$ProfileUpdateRequestDestinationTypesMap[e]!)
      .toList();
}

List<enums.ProfileUpdateRequestDestinationTypes>
    profileUpdateRequestDestinationTypesListFromJson(
        List? profileUpdateRequestDestinationTypes) {
  if (profileUpdateRequestDestinationTypes == null) {
    return [];
  }

  return profileUpdateRequestDestinationTypes
      .map((e) => profileUpdateRequestDestinationTypesFromJson(e.toString()))
      .toList();
}

String? profileUpdateRequestTravelWithPersonFromSameCityToJson(
    enums.ProfileUpdateRequestTravelWithPersonFromSameCity?
        profileUpdateRequestTravelWithPersonFromSameCity) {
  return enums.$ProfileUpdateRequestTravelWithPersonFromSameCityMap[
      profileUpdateRequestTravelWithPersonFromSameCity];
}

enums.ProfileUpdateRequestTravelWithPersonFromSameCity
    profileUpdateRequestTravelWithPersonFromSameCityFromJson(
        Object? profileUpdateRequestTravelWithPersonFromSameCity) {
  if (profileUpdateRequestTravelWithPersonFromSameCity is int) {
    return enums.$ProfileUpdateRequestTravelWithPersonFromSameCityMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileUpdateRequestTravelWithPersonFromSameCity.toString(),
            orElse: () => const MapEntry(
                enums.ProfileUpdateRequestTravelWithPersonFromSameCity
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  if (profileUpdateRequestTravelWithPersonFromSameCity is String) {
    return enums.$ProfileUpdateRequestTravelWithPersonFromSameCityMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileUpdateRequestTravelWithPersonFromSameCity.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileUpdateRequestTravelWithPersonFromSameCity
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  return enums
      .ProfileUpdateRequestTravelWithPersonFromSameCity.swaggerGeneratedUnknown;
}

List<String> profileUpdateRequestTravelWithPersonFromSameCityListToJson(
    List<enums.ProfileUpdateRequestTravelWithPersonFromSameCity>?
        profileUpdateRequestTravelWithPersonFromSameCity) {
  if (profileUpdateRequestTravelWithPersonFromSameCity == null) {
    return [];
  }

  return profileUpdateRequestTravelWithPersonFromSameCity
      .map(
          (e) => enums.$ProfileUpdateRequestTravelWithPersonFromSameCityMap[e]!)
      .toList();
}

List<enums.ProfileUpdateRequestTravelWithPersonFromSameCity>
    profileUpdateRequestTravelWithPersonFromSameCityListFromJson(
        List? profileUpdateRequestTravelWithPersonFromSameCity) {
  if (profileUpdateRequestTravelWithPersonFromSameCity == null) {
    return [];
  }

  return profileUpdateRequestTravelWithPersonFromSameCity
      .map((e) => profileUpdateRequestTravelWithPersonFromSameCityFromJson(
          e.toString()))
      .toList();
}

String? profileUpdateRequestTravelWithPersonFromSameCountryToJson(
    enums.ProfileUpdateRequestTravelWithPersonFromSameCountry?
        profileUpdateRequestTravelWithPersonFromSameCountry) {
  return enums.$ProfileUpdateRequestTravelWithPersonFromSameCountryMap[
      profileUpdateRequestTravelWithPersonFromSameCountry];
}

enums.ProfileUpdateRequestTravelWithPersonFromSameCountry
    profileUpdateRequestTravelWithPersonFromSameCountryFromJson(
        Object? profileUpdateRequestTravelWithPersonFromSameCountry) {
  if (profileUpdateRequestTravelWithPersonFromSameCountry is int) {
    return enums.$ProfileUpdateRequestTravelWithPersonFromSameCountryMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileUpdateRequestTravelWithPersonFromSameCountry.toString(),
            orElse: () => const MapEntry(
                enums.ProfileUpdateRequestTravelWithPersonFromSameCountry
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  if (profileUpdateRequestTravelWithPersonFromSameCountry is String) {
    return enums.$ProfileUpdateRequestTravelWithPersonFromSameCountryMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileUpdateRequestTravelWithPersonFromSameCountry
                    .toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileUpdateRequestTravelWithPersonFromSameCountry
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  return enums.ProfileUpdateRequestTravelWithPersonFromSameCountry
      .swaggerGeneratedUnknown;
}

List<String> profileUpdateRequestTravelWithPersonFromSameCountryListToJson(
    List<enums.ProfileUpdateRequestTravelWithPersonFromSameCountry>?
        profileUpdateRequestTravelWithPersonFromSameCountry) {
  if (profileUpdateRequestTravelWithPersonFromSameCountry == null) {
    return [];
  }

  return profileUpdateRequestTravelWithPersonFromSameCountry
      .map((e) =>
          enums.$ProfileUpdateRequestTravelWithPersonFromSameCountryMap[e]!)
      .toList();
}

List<enums.ProfileUpdateRequestTravelWithPersonFromSameCountry>
    profileUpdateRequestTravelWithPersonFromSameCountryListFromJson(
        List? profileUpdateRequestTravelWithPersonFromSameCountry) {
  if (profileUpdateRequestTravelWithPersonFromSameCountry == null) {
    return [];
  }

  return profileUpdateRequestTravelWithPersonFromSameCountry
      .map((e) => profileUpdateRequestTravelWithPersonFromSameCountryFromJson(
          e.toString()))
      .toList();
}

String? profileUpdateRequestTravelWithPersonSameLanguageToJson(
    enums.ProfileUpdateRequestTravelWithPersonSameLanguage?
        profileUpdateRequestTravelWithPersonSameLanguage) {
  return enums.$ProfileUpdateRequestTravelWithPersonSameLanguageMap[
      profileUpdateRequestTravelWithPersonSameLanguage];
}

enums.ProfileUpdateRequestTravelWithPersonSameLanguage
    profileUpdateRequestTravelWithPersonSameLanguageFromJson(
        Object? profileUpdateRequestTravelWithPersonSameLanguage) {
  if (profileUpdateRequestTravelWithPersonSameLanguage is int) {
    return enums.$ProfileUpdateRequestTravelWithPersonSameLanguageMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileUpdateRequestTravelWithPersonSameLanguage.toString(),
            orElse: () => const MapEntry(
                enums.ProfileUpdateRequestTravelWithPersonSameLanguage
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  if (profileUpdateRequestTravelWithPersonSameLanguage is String) {
    return enums.$ProfileUpdateRequestTravelWithPersonSameLanguageMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileUpdateRequestTravelWithPersonSameLanguage.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileUpdateRequestTravelWithPersonSameLanguage
                    .swaggerGeneratedUnknown,
                ''))
        .key;
  }

  return enums
      .ProfileUpdateRequestTravelWithPersonSameLanguage.swaggerGeneratedUnknown;
}

List<String> profileUpdateRequestTravelWithPersonSameLanguageListToJson(
    List<enums.ProfileUpdateRequestTravelWithPersonSameLanguage>?
        profileUpdateRequestTravelWithPersonSameLanguage) {
  if (profileUpdateRequestTravelWithPersonSameLanguage == null) {
    return [];
  }

  return profileUpdateRequestTravelWithPersonSameLanguage
      .map(
          (e) => enums.$ProfileUpdateRequestTravelWithPersonSameLanguageMap[e]!)
      .toList();
}

List<enums.ProfileUpdateRequestTravelWithPersonSameLanguage>
    profileUpdateRequestTravelWithPersonSameLanguageListFromJson(
        List? profileUpdateRequestTravelWithPersonSameLanguage) {
  if (profileUpdateRequestTravelWithPersonSameLanguage == null) {
    return [];
  }

  return profileUpdateRequestTravelWithPersonSameLanguage
      .map((e) => profileUpdateRequestTravelWithPersonSameLanguageFromJson(
          e.toString()))
      .toList();
}

String? profileUpdateRequestGenderToJson(
    enums.ProfileUpdateRequestGender? profileUpdateRequestGender) {
  return enums.$ProfileUpdateRequestGenderMap[profileUpdateRequestGender];
}

enums.ProfileUpdateRequestGender profileUpdateRequestGenderFromJson(
    Object? profileUpdateRequestGender) {
  if (profileUpdateRequestGender is int) {
    return enums.$ProfileUpdateRequestGenderMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileUpdateRequestGender.toString(),
            orElse: () => const MapEntry(
                enums.ProfileUpdateRequestGender.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (profileUpdateRequestGender is String) {
    return enums.$ProfileUpdateRequestGenderMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileUpdateRequestGender.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileUpdateRequestGender.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.ProfileUpdateRequestGender.swaggerGeneratedUnknown;
}

List<String> profileUpdateRequestGenderListToJson(
    List<enums.ProfileUpdateRequestGender>? profileUpdateRequestGender) {
  if (profileUpdateRequestGender == null) {
    return [];
  }

  return profileUpdateRequestGender
      .map((e) => enums.$ProfileUpdateRequestGenderMap[e]!)
      .toList();
}

List<enums.ProfileUpdateRequestGender> profileUpdateRequestGenderListFromJson(
    List? profileUpdateRequestGender) {
  if (profileUpdateRequestGender == null) {
    return [];
  }

  return profileUpdateRequestGender
      .map((e) => profileUpdateRequestGenderFromJson(e.toString()))
      .toList();
}

String? profileUpdateRequestChillOrVisitToJson(
    enums.ProfileUpdateRequestChillOrVisit? profileUpdateRequestChillOrVisit) {
  return enums
      .$ProfileUpdateRequestChillOrVisitMap[profileUpdateRequestChillOrVisit];
}

enums.ProfileUpdateRequestChillOrVisit profileUpdateRequestChillOrVisitFromJson(
    Object? profileUpdateRequestChillOrVisit) {
  if (profileUpdateRequestChillOrVisit is int) {
    return enums.$ProfileUpdateRequestChillOrVisitMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileUpdateRequestChillOrVisit.toString(),
            orElse: () => const MapEntry(
                enums.ProfileUpdateRequestChillOrVisit.swaggerGeneratedUnknown,
                ''))
        .key;
  }

  if (profileUpdateRequestChillOrVisit is String) {
    return enums.$ProfileUpdateRequestChillOrVisitMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileUpdateRequestChillOrVisit.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileUpdateRequestChillOrVisit.swaggerGeneratedUnknown,
                ''))
        .key;
  }

  return enums.ProfileUpdateRequestChillOrVisit.swaggerGeneratedUnknown;
}

List<String> profileUpdateRequestChillOrVisitListToJson(
    List<enums.ProfileUpdateRequestChillOrVisit>?
        profileUpdateRequestChillOrVisit) {
  if (profileUpdateRequestChillOrVisit == null) {
    return [];
  }

  return profileUpdateRequestChillOrVisit
      .map((e) => enums.$ProfileUpdateRequestChillOrVisitMap[e]!)
      .toList();
}

List<enums.ProfileUpdateRequestChillOrVisit>
    profileUpdateRequestChillOrVisitListFromJson(
        List? profileUpdateRequestChillOrVisit) {
  if (profileUpdateRequestChillOrVisit == null) {
    return [];
  }

  return profileUpdateRequestChillOrVisit
      .map((e) => profileUpdateRequestChillOrVisitFromJson(e.toString()))
      .toList();
}

String? profileUpdateRequestAboutFoodToJson(
    enums.ProfileUpdateRequestAboutFood? profileUpdateRequestAboutFood) {
  return enums.$ProfileUpdateRequestAboutFoodMap[profileUpdateRequestAboutFood];
}

enums.ProfileUpdateRequestAboutFood profileUpdateRequestAboutFoodFromJson(
    Object? profileUpdateRequestAboutFood) {
  if (profileUpdateRequestAboutFood is int) {
    return enums.$ProfileUpdateRequestAboutFoodMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileUpdateRequestAboutFood.toString(),
            orElse: () => const MapEntry(
                enums.ProfileUpdateRequestAboutFood.swaggerGeneratedUnknown,
                ''))
        .key;
  }

  if (profileUpdateRequestAboutFood is String) {
    return enums.$ProfileUpdateRequestAboutFoodMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileUpdateRequestAboutFood.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileUpdateRequestAboutFood.swaggerGeneratedUnknown,
                ''))
        .key;
  }

  return enums.ProfileUpdateRequestAboutFood.swaggerGeneratedUnknown;
}

List<String> profileUpdateRequestAboutFoodListToJson(
    List<enums.ProfileUpdateRequestAboutFood>? profileUpdateRequestAboutFood) {
  if (profileUpdateRequestAboutFood == null) {
    return [];
  }

  return profileUpdateRequestAboutFood
      .map((e) => enums.$ProfileUpdateRequestAboutFoodMap[e]!)
      .toList();
}

List<enums.ProfileUpdateRequestAboutFood>
    profileUpdateRequestAboutFoodListFromJson(
        List? profileUpdateRequestAboutFood) {
  if (profileUpdateRequestAboutFood == null) {
    return [];
  }

  return profileUpdateRequestAboutFood
      .map((e) => profileUpdateRequestAboutFoodFromJson(e.toString()))
      .toList();
}

String? profileUpdateRequestGoOutAtNightToJson(
    enums.ProfileUpdateRequestGoOutAtNight? profileUpdateRequestGoOutAtNight) {
  return enums
      .$ProfileUpdateRequestGoOutAtNightMap[profileUpdateRequestGoOutAtNight];
}

enums.ProfileUpdateRequestGoOutAtNight profileUpdateRequestGoOutAtNightFromJson(
    Object? profileUpdateRequestGoOutAtNight) {
  if (profileUpdateRequestGoOutAtNight is int) {
    return enums.$ProfileUpdateRequestGoOutAtNightMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileUpdateRequestGoOutAtNight.toString(),
            orElse: () => const MapEntry(
                enums.ProfileUpdateRequestGoOutAtNight.swaggerGeneratedUnknown,
                ''))
        .key;
  }

  if (profileUpdateRequestGoOutAtNight is String) {
    return enums.$ProfileUpdateRequestGoOutAtNightMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileUpdateRequestGoOutAtNight.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileUpdateRequestGoOutAtNight.swaggerGeneratedUnknown,
                ''))
        .key;
  }

  return enums.ProfileUpdateRequestGoOutAtNight.swaggerGeneratedUnknown;
}

List<String> profileUpdateRequestGoOutAtNightListToJson(
    List<enums.ProfileUpdateRequestGoOutAtNight>?
        profileUpdateRequestGoOutAtNight) {
  if (profileUpdateRequestGoOutAtNight == null) {
    return [];
  }

  return profileUpdateRequestGoOutAtNight
      .map((e) => enums.$ProfileUpdateRequestGoOutAtNightMap[e]!)
      .toList();
}

List<enums.ProfileUpdateRequestGoOutAtNight>
    profileUpdateRequestGoOutAtNightListFromJson(
        List? profileUpdateRequestGoOutAtNight) {
  if (profileUpdateRequestGoOutAtNight == null) {
    return [];
  }

  return profileUpdateRequestGoOutAtNight
      .map((e) => profileUpdateRequestGoOutAtNightFromJson(e.toString()))
      .toList();
}

String? profileUpdateRequestSportToJson(
    enums.ProfileUpdateRequestSport? profileUpdateRequestSport) {
  return enums.$ProfileUpdateRequestSportMap[profileUpdateRequestSport];
}

enums.ProfileUpdateRequestSport profileUpdateRequestSportFromJson(
    Object? profileUpdateRequestSport) {
  if (profileUpdateRequestSport is int) {
    return enums.$ProfileUpdateRequestSportMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileUpdateRequestSport.toString(),
            orElse: () => const MapEntry(
                enums.ProfileUpdateRequestSport.swaggerGeneratedUnknown, ''))
        .key;
  }

  if (profileUpdateRequestSport is String) {
    return enums.$ProfileUpdateRequestSportMap.entries
        .firstWhere(
            (element) =>
                element.value.toLowerCase() ==
                profileUpdateRequestSport.toLowerCase(),
            orElse: () => const MapEntry(
                enums.ProfileUpdateRequestSport.swaggerGeneratedUnknown, ''))
        .key;
  }

  return enums.ProfileUpdateRequestSport.swaggerGeneratedUnknown;
}

List<String> profileUpdateRequestSportListToJson(
    List<enums.ProfileUpdateRequestSport>? profileUpdateRequestSport) {
  if (profileUpdateRequestSport == null) {
    return [];
  }

  return profileUpdateRequestSport
      .map((e) => enums.$ProfileUpdateRequestSportMap[e]!)
      .toList();
}

List<enums.ProfileUpdateRequestSport> profileUpdateRequestSportListFromJson(
    List? profileUpdateRequestSport) {
  if (profileUpdateRequestSport == null) {
    return [];
  }

  return profileUpdateRequestSport
      .map((e) => profileUpdateRequestSportFromJson(e.toString()))
      .toList();
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  chopper.Response<ResultType> convertResponse<ResultType, Item>(
      chopper.Response response) {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    final jsonRes = super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}
