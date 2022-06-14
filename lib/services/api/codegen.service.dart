import 'package:chopper/chopper.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:trip_n_joy_front/models/auth/signInUpGoogle.model.dart';
import 'package:trip_n_joy_front/models/auth/signup.model.dart';
import 'package:trip_n_joy_front/models/group/activity.dart';
import 'package:trip_n_joy_front/models/group/chat_member.dart';
import 'package:trip_n_joy_front/services/log/logger.service.dart';

import '../../codegen/api.swagger.dart';
import '../../viewmodels/auth/auth.viewmodel.dart';
import 'http.service.dart';

const BASE_URL = String.fromEnvironment("BASE_URL", defaultValue: "http://localhost:8080");

class CodegenService extends HttpService {
  late Api api;
  final FlutterSecureStorage storage;

  CodegenService(this.storage);

  static header() => {"Content-Type": "application/json"};

  @override
  Future<HttpService> init() async {
    api = Api.create(
        client: ChopperClient(
            converter: $JsonSerializableConverter(),
            interceptors: [
              (Request request) async => applyHeader(
                  request, 'authorization', "Bearer " + (await storage.read(key: AuthViewModel.tokenKey) ?? ""),
                  override: false),
              (Response response) async {
                if (response.statusCode == 401) {
                  await storage.delete(key: AuthViewModel.tokenKey);
                }
                return response;
              }
            ],
            baseUrl: BASE_URL),
        baseUrl: BASE_URL);
    initInterceptors();
    return this;
  }

  @override
  void initInterceptors() {}

  @override
  Future<UserModel?> loadUser() async {
    final response = await api.usersMeGet();
    return response.body;
  }

  @override
  Future<LoginResponse?> login(String email, String password) async {
    final response = await api.authLoginPost(body: LoginRequest(password: password, username: email));
    return response.body;
  }

  @override
  Future<AuthTokenResponse?> signup(SignupCredentials data) async {
    final response = await api.authRegisterPost(
        body: UserCreationRequest(
      gender: data.gender,
      email: data.email,
      password: data.password,
      birthDate: DateTime.parse(data.birthDate),
      firstname: data.firstname,
      lastname: data.lastname,
      phoneNumber: data.phoneNumber,
      city: data.city,
      language: data.language,
    ));
    return response.body;
  }

  @override
  Future<bool> deleteUser(int id, DeleteUserRequest deleteUserRequest) async {
    final response = await api.usersIdDelete(body: deleteUserRequest, id: id);

    return response.isSuccessful;
  }

  @override
  Future<bool> verifyAccount(int id, String code) async {
    final response = await api.authIdConfirmationPatch(body: ConfirmationCodeModel(value: code), id: id);
    return response.isSuccessful;
  }

  @override
  int? getUserIdFromToken(String? token) {
    if (token == null) {
      return null;
    }
    Map<String, dynamic> payload = Jwt.parseJwt(token);
    var id = payload['userId'];

    if (id.runtimeType == int) {
      return id;
    }

    return int.parse(id);
  }

  @override
  Future<void> forgotPassword(String email) async {
    await api.authForgotPasswordPost(body: ForgotPasswordRequest(email: email));
  }

  @override
  Future<UserIdResponse?> resetPassword(String email, String code, String password) async {
    final response = await api.authValidationPasswordPatch(
        body: ValidateCodePasswordRequest(email: email, newPassword: password, value: code));
    return response.body;
  }

  @override
  Future<void> resendVerificationCode(int id) async {
    await api.authIdResendPost(id: id);
  }

  @override
  Future<void> updateUser(int id, UserUpdateRequest updateRequest) async {
    await api.usersIdUpdatePatch(id: id, body: updateRequest);
  }

  @override
  Future<LoginResponse?> updateEmail(int id, UpdateEmailRequest updateEmailRequest) async {
    final response = await api.authIdEmailPatch(id: id, body: updateEmailRequest);
    return response.body;
  }

  @override
  Future<void> updatePassword(int id, UpdatePasswordRequest updatePasswordRequest) async {
    await api.authIdPasswordPatch(id: id, body: updatePasswordRequest);
  }

  @override
  Future<ProfileModel?> createProfile(int id, ProfileCreationRequest profile) async {
    final response = await api.idProfilesPost(id: id, body: profile);

    return response.body;
  }

  @override
  Future<void> deleteProfile(int id, int profileId) async {
    await api.idProfilesProfileDelete(id: id, profile: profileId);
  }

  @override
  Future<List<ProfileModel>?> getUserProfiles(int id) async {
    final response = await api.idProfilesGet(id: id);

    return response.body;
  }

  @override
  Future<void> updateProfile(int id, int profileId, ProfileUpdateRequest profileUpdateRequest) async {
    await api.idProfilesProfileUpdatePatch(id: id, profile: profileId, body: profileUpdateRequest);
  }

  @override
  Future<GoogleAuthResponse?> signInUpGoogle(SignInUpGoogleCredentials data) async {
    final response = await api.authGooglePost(
        body: GoogleRequest(
            email: data.email,
            firstname: data.firstname,
            lastname: data.lastname,
            phoneNumber: data.phoneNumber,
            profilePicture: data.profilePicture,
            accessToken: data.accessToken));

    return response.body;
  }

  @override
  Future<void> addUserToPrivateGroup(int groupId, String email) async {
    await api.groupsPrivateGroupUserPost(group: groupId, body: ModelWithEmail(email: email));
  }

  @override
  Future<GroupModel?> createPrivateGroup(int id, CreatePrivateGroupRequest createPrivateGroupRequest) async {
    final response = await api.groupsPrivateIdPost(id: id, body: createPrivateGroupRequest);

    return response.body;
  }

  @override
  Future<void> deletePrivateGroup(int groupId) async {
    await api.groupsPrivateGroupDelete(group: groupId);
  }

  @override
  Future<List<GroupModel>?> getGroups(int id) async {
    final response = await api.groupsIdGet(id: id);

    return response.body;
  }

  @override
  Future<List<GroupModel>?> getUserInvitesGroups(int id) async {
    final response = await api.groupsInvitesIdGet(id: id);
    return response.body;
  }

  @override
  Future<void> declineGroupInvitation(int groupId, int userId) async {
    await api.groupsGroupDeclineIdPatch(group: groupId, id: userId);
  }

  @override
  Future<void> joinPrivateGroup(int groupId, int userId) async {
    await api.groupsGroupJoinIdPatch(group: groupId, id: userId);
  }

  @override
  Future<void> leaveGroup(int groupId, int userId) async {
    await api.groupsGroupUserIdDelete(group: groupId, id: userId);
  }

  @override
  Future<void> removeUserFromPrivateGroup(int groupId, int userId) async {
    await api.groupsPrivateGroupUserIdDelete(group: groupId, id: userId);
  }

  @override
  Future<void> updatePrivateGroup(int groupId, UpdatePrivateGroupRequest groupUpdateRequest) async {
    await api.groupsPrivateGroupPatch(group: groupId, body: groupUpdateRequest);
  }

  @override
  Future<void> updatePublicGroup(int groupId, UpdatePublicGroupRequest groupUpdateRequest) async {
    await api.groupsGroupPatch(group: groupId, body: groupUpdateRequest);
  }

  @override
  Future<List<ChannelModel>> getChannels(int groupId) async {
    final response = await api.channelsGroupGet(group: groupId);

    return response.body != null ? response.body! : [];
  }

  @override
  Future<ChannelModel?> createChannel(int groupId, CreateChannelRequest createChannelRequest) async {
    final response = await api.channelsGroupPost(group: groupId, body: createChannelRequest);
    return response.body;
  }

  @override
  Future<ChannelModel?> updateChannel(num channelId, UpdateChannelRequest updateChannelRequest) async {
    final response = await api.channelsIdPatch(id: channelId, body: updateChannelRequest);
    return response.body;
  }

  @override
  Future<void> deleteChannel(num channelId) async {
    await api.channelsIdDelete(id: channelId);
  }

  @override
  Future<MatchMakingResult?> getMatchmakingResult(int taskId) async {
    final response = await api.matchmakingTaskIdGet(taskId: taskId);

    return response.body;
  }

  @override
  Future<MatchMakingResponse?> startMatchmaking(int userId, ProfileCreationRequest profile) async {
    final response = await api.matchmakingPost(userId: userId, body: profile);

    try {
      return MatchMakingResponse(taskId: response.body!['taskId'], errorMessage: response.body!['errorMessage']);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<MatchMakingResponse?> retryMatchmaking(int userId, int profileId) async {
    final response = await api.matchmakingPatch(userId: userId, profileId: profileId);

    try {
      return MatchMakingResponse(taskId: response.body!['taskId'], errorMessage: response.body!['errorMessage']);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<StompClient?> loadWebSocketChannel(void Function(bool) onConnection) async {
    final requestUrl = api.client.baseUrl + '/wbsocket';
    StompClient stompClient = StompClient(
        config: StompConfig.SockJS(
            url: requestUrl,
            onConnect: (frame) {
              print('Connected to $requestUrl');
              onConnection(true);
            },
            onDisconnect: (frame) {
              print('Disconnected from $requestUrl');
              onConnection(false);
            },
            onStompError: (frame) {
              print('Error from $requestUrl');
              onConnection(false);
            }));

    stompClient.activate();
    return stompClient;
  }

  @override
  Future<List<MessageResponse>> getChannelMessages(num channelId, int page) async {
    final response = await api.chatChannelIdGet(channelId: channelId, page: page);
    return response.body!;
  }

  @override
  Future<List<MessageResponse>> getPinnedMessages(num channelId) async {
    final response = await api.chatChannelIdPinnedGet(channelId: channelId);
    return response.body!;
  }

  @override
  Future<GroupMemberModel?> getUserPublicInfo(int groupId, num userId) async {
    final response = await api.groupsGroupIdUsersUserIdGet(groupId: groupId, userId: userId);

    return response.body;
  }

  @override
  Future<MessageResponse?> togglePinnedMessage(num messageId, bool pinned) async {
    final response = await api.chatMessageIdPinnedPatch(messageId: messageId, pin: pinned);
    return response.body;
  }

  @override
  Future<List<ActivityModel>?> getActivities(int groupId) async {
    final response = await api.groupsGroupIdPlanningGet(groupId: groupId);
    return response.body;
  }

  @override
  Future<ActivityModel?> createActivity(int groupId, CreateActivityRequest request) async {
    final response = await api.groupsGroupIdPlanningPost(groupId: groupId, body: request);
    return response.body;
  }

  @override
  Future<void> deleteActivity(int groupId, num activityId) async {
    await api.groupsGroupIdPlanningActivityIdDelete(groupId: groupId, activityId: activityId);
  }

  @override
  Future<ActivityModel?> updateActivity(int groupId, num activityId, UpdateActivityRequest request) async {
    final response =
        await api.groupsGroupIdPlanningActivityIdPatch(groupId: groupId, activityId: activityId, body: request);
    return response.body;
  }

  @override
  Future<bool> toggleActivityMember(int groupId, num activityId, num userId, bool join) async {
    final response = join
        ? await api.groupsGroupIdPlanningActivityIdJoinPatch(groupId: groupId, activityId: activityId, userId: userId)
        : await api.groupsGroupIdPlanningActivityIdLeavePatch(groupId: groupId, activityId: activityId, userId: userId);
    return response.isSuccessful;
  }

  @override
  Future<List<String>?> getPlacesCategories() async {
    final response = await api.placesCategoriesGet();
    return response.body;
  }

  @override
  Future<List<PlaceResponse>?> getSuggestedActivities(PlacesFromCoordinatesRequest request) async {
    final response = await api.placesCoordinatesPost(body: request);
    return response.body;
  }

  @override
  Future<List<BalanceResponse>?> getBudgetBalance(int groupId) async {
    final response = await api.expensesGroupBalancesGet(group: groupId);
    return response.body;
  }
}
