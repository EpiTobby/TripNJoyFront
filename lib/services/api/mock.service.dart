import 'package:flutter/material.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/constants/common/colors.style.dart';
import 'package:trip_n_joy_front/constants/common/default_values.dart';
import 'package:trip_n_joy_front/models/auth/signInUpGoogle.model.dart';
import 'package:trip_n_joy_front/models/auth/signup.model.dart';
import 'package:trip_n_joy_front/services/api/http.service.dart';
import 'package:weather/weather.dart';

class MockService extends HttpService {
  @override
  Future<HttpService> init() async {
    return this;
  }

  @override
  void initInterceptors() {}

  @override
  Future<UserModel?> loadUser() async {
    return Future.delayed(const Duration(seconds: 1), () {
      return UserModel(
          firstname: "Tony",
          lastname: "Heng",
          email: "tony.heng@epita.fr",
          birthDate: DateTime.now(),
          phoneNumber: "0612345678");
    });
  }

  @override
  Future<LoginResponse?> login(String email, String password) {
    return Future.delayed(const Duration(seconds: 1), () {
      return LoginResponse(token: "token", username: "username");
    });
  }

  @override
  Future<AuthTokenResponse?> signup(SignupCredentials data) {
    return Future.delayed(const Duration(seconds: 1), () {
      return AuthTokenResponse(token: "token");
    });
  }

  @override
  Future<bool> deleteUser(int id, DeleteUserRequest deleteUserRequest) {
    return Future.delayed(const Duration(seconds: 1), () {
      return false;
    });
  }

  @override
  Future<bool> verifyAccount(int id, String code) {
    return Future.delayed(const Duration(seconds: 1), () {
      return true;
    });
  }

  @override
  int? getUserIdFromToken(String? token) {
    return 1;
  }

  @override
  Future<void> forgotPassword(String email) async {
    return Future.delayed(const Duration(seconds: 1), () {});
  }

  @override
  Future<UserIdResponse?> resetPassword(String email, String code, String password) async {
    return UserIdResponse(userId: 1);
  }

  @override
  Future<void> resendVerificationCode(int id) {
    return Future.delayed(const Duration(seconds: 1), () {});
  }

  @override
  Future<void> updateUser(int id, UserUpdateRequest updateRequest) {
    return Future.value();
  }

  @override
  Future<void> updatePassword(int id, UpdatePasswordRequest updatePasswordRequest) {
    return Future.value();
  }

  @override
  Future<LoginResponse?> updateEmail(int id, UpdateEmailRequest updateEmailRequest) {
    return Future.value();
  }

  @override
  Future<ProfileModel?> createProfile(int id, ProfileCreationRequest profile) {
    return Future.delayed(const Duration(seconds: 2), () {
      return ProfileModel();
    });
  }

  @override
  Future<void> deleteProfile(int id, int profileId) {
    return Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<List<ProfileModel>> getUserProfiles(int id) {
    return Future.delayed(const Duration(seconds: 2), () {
      return [];
    });
  }

  @override
  Future<void> updateProfile(int id, int profileId, ProfileUpdateRequest profileUpdateRequest) {
    return Future.delayed(const Duration(seconds: 2));
  }

  @override
  Future<GoogleAuthResponse?> signInUpGoogle(SignInUpGoogleCredentials data) {
    return Future.delayed(const Duration(seconds: 1), () {
      return GoogleAuthResponse(token: "token", username: "username", newUser: true);
    });
  }

  @override
  Future<void> addUserToPrivateGroup(int groupId, String email) {
    // TODO: implement addUserToPrivateGroup
    throw UnimplementedError();
  }

  @override
  Future<GroupModel> createPrivateGroup(int id, CreatePrivateGroupRequest createPrivateGroupRequest) {
    // TODO: implement createPrivateGroup
    throw UnimplementedError();
  }

  @override
  Future<void> deletePrivateGroup(int groupId) {
    // TODO: implement deletePrivateGroup
    throw UnimplementedError();
  }

  @override
  Future<List<GroupModel>?> getGroups(int id) {
    return Future.delayed(const Duration(seconds: 1), () {
      return [
        GroupModel(
            id: 1,
            state: GroupModelState.closed,
            name: "A very long title that should be truncated in the appbar",
            members: [
              MemberModel(firstname: "tony", lastname: "stark"),
              MemberModel(firstname: "steve", lastname: "rogers")
            ],
            picture: "https://www.pngkey.com/png/full/115-1150152_default-profile-picture-avatar-png-green.png"),
      ];
    });
  }

  @override
  Future<List<GroupModel>?> getUserInvitesGroups(int id) async {
    return Future.delayed(const Duration(seconds: 1), () {
      return [
        GroupModel(
            id: 1,
            state: GroupModelState.closed,
            name: "A very long title that should be truncated in the appbar",
            members: [
              MemberModel(firstname: "tony", lastname: "stark"),
              MemberModel(firstname: "steve", lastname: "rogers")
            ],
            picture: "https://www.pngkey.com/png/full/115-1150152_default-profile-picture-avatar-png-green.png"),
      ];
    });
  }

  @override
  Future<void> declineGroupInvitation(int groupId, int userId) async {
    return Future.value();
  }

  @override
  Future<void> joinPrivateGroup(int groupId, int userId) {
    // TODO: implement joinPrivateGroup
    throw UnimplementedError();
  }

  @override
  Future<void> leaveGroup(int groupId, int userId) {
    // TODO: implement leaveGroup
    throw UnimplementedError();
  }

  @override
  Future<void> removeUserFromPrivateGroup(int groupId, int userId) {
    // TODO: implement removeUserFromGroup
    throw UnimplementedError();
  }

  @override
  Future<void> updatePrivateGroup(int groupId, UpdatePrivateGroupRequest groupUpdateRequest) {
    // TODO: implement updatePrivateGroup
    throw UnimplementedError();
  }

  @override
  Future<void> updatePublicGroup(int groupId, UpdatePublicGroupRequest groupUpdateRequest) {
    throw UnimplementedError();
  }

  @override
  Future<void> setGroupPublic(int groupId) async {
    // TODO: implement setGroupPublic
    throw UnimplementedError();
  }

  @override
  Future<ChannelModel?> createChannel(int groupId, CreateChannelRequest createChannelRequest) {
    return Future.value(ChannelModel(id: 1, name: "Channel 1", index: 1));
  }

  @override
  Future<void> deleteChannel(num channelId) {
    return Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<List<ChannelModel>> getChannels(int groupId) {
    return Future.delayed(const Duration(seconds: 1), () {
      return [
        ChannelModel(id: 1, name: "Channel 1", index: 1),
        ChannelModel(id: 2, name: "Channel 2", index: 2),
        ChannelModel(id: 3, name: "Channel 3", index: 3)
      ];
    });
  }

  @override
  Future<ChannelModel?> updateChannel(num channelId, UpdateChannelRequest updateChannelRequest) {
    return Future.value(ChannelModel(id: channelId, name: "Channel 2", index: 1));
  }

  @override
  Future<MatchMakingResult?> getMatchmakingResult(int taskId) {
    return Future.value(MatchMakingResult(
        group: GroupModel(
            id: 1,
            state: GroupModelState.closed,
            name: "A very long title that should be truncated in the appbar",
            members: [
              MemberModel(firstname: "tony", lastname: "stark"),
              MemberModel(firstname: "steve", lastname: "rogers")
            ],
            picture: "https://www.pngkey.com/png/full/115-1150152_default-profile-picture-avatar-png-green.png"),
        type: MatchMakingResultType$.joined));
  }

  @override
  Future<MatchMakingResponse?> startMatchmaking(int userId, ProfileCreationRequest profile) {
    return Future.value(MatchMakingResponse(taskId: 1));
  }

  @override
  Future<MatchMakingResponse?> retryMatchmaking(int userId, int profileId) async {
    return Future.value(MatchMakingResponse(taskId: 1));
  }

  @override
  Future<StompClient?> loadWebSocketChannel(void Function(bool) onConnection) {
    onConnection(true);
    return Future.value(null);
  }

  @override
  Future<List<MessageResponse>> getChannelMessages(num channelId, int page) {
    return Future.delayed(
      const Duration(milliseconds: 500),
      () => [
        MessageResponse(
          id: 1,
          content: "Hello",
          type: MessageResponseType$.text,
          modifiedDate: DateTime.parse("2020-01-01T00:00:00.000Z"),
          sentDate: DateTime.parse("2020-01-01T00:00:00.000Z"),
          channelId: 1,
          userId: 1,
          pinned: true,
        ),
        MessageResponse(
          id: 2,
          content: "Hello!",
          type: MessageResponseType$.text,
          modifiedDate: DateTime.parse("2020-01-02T00:00:00.000Z"),
          sentDate: DateTime.parse("2020-01-02T00:00:00.000Z"),
          channelId: 1,
          userId: 2,
          pinned: true,
        ),
        MessageResponse(
          id: 3,
          content: "file.txt",
          type: MessageResponseType$.file,
          modifiedDate: DateTime.parse("2020-01-03T00:00:00.000Z"),
          sentDate: DateTime.parse("2020-01-03T00:00:00.000Z"),
          channelId: 1,
          userId: 1,
          pinned: false,
        ),
        MessageResponse(
          id: 4,
          content: "https://as2.ftcdn.net/v2/jpg/01/81/75/23/1000_F_181752325_chPCE32kZXwYmHxhwPdfaaGio7Pr3v5V.jpg",
          type: MessageResponseType$.image,
          modifiedDate: DateTime.parse("2020-01-04T00:00:00.000Z"),
          sentDate: DateTime.parse("2020-01-04T00:00:00.000Z"),
          channelId: 1,
          userId: 2,
          pinned: false,
        ),
      ].reversed.toList(),
    );
  }

  @override
  Future<List<MessageResponse>> getPinnedMessages(num channelId) {
    return Future.delayed(
      const Duration(milliseconds: 500),
      () => [
        MessageResponse(
          id: 1,
          content: "Hello",
          type: MessageResponseType$.text,
          modifiedDate: DateTime.parse("2020-01-01T00:00:00.000Z"),
          sentDate: DateTime.parse("2020-01-01T00:00:00.000Z"),
          channelId: 1,
          userId: 1,
          pinned: true,
        ),
        MessageResponse(
          id: 2,
          content: "Hello!",
          type: MessageResponseType$.text,
          modifiedDate: DateTime.parse("2020-01-02T00:00:00.000Z"),
          sentDate: DateTime.parse("2020-01-02T00:00:00.000Z"),
          channelId: 1,
          userId: 2,
          pinned: true,
        ),
      ].reversed.toList(),
    );
  }

  @override
  Future<GroupMemberModel?> getUserPublicInfo(int groupId, num userId) {
    return Future.value(
      userId == 1
          ? GroupMemberModel(
              userId: 1,
              firstname: "Tony",
              lastname: "Heng",
              profilePicture:
                  "https://as2.ftcdn.net/v2/jpg/01/81/75/23/1000_F_181752325_chPCE32kZXwYmHxhwPdfaaGio7Pr3v5V.jpg",
            )
          : GroupMemberModel(
              userId: 2,
              firstname: "Yanis",
              lastname: "Chaabane",
            ),
    );
  }

  @override
  Future<MessageResponse?> togglePinnedMessage(num messageId, bool pinned) {
    return Future.value(null);
  }

  @override
  Future<List<ActivityModel>?> getActivities(int groupId) {
    return Future.delayed(
      const Duration(milliseconds: 500),
      () => [
        ActivityModel(
          id: 1,
          icon: Icons.airplane_ticket.codePoint.toString(),
          name: "Flight Departure",
          location: "Airport CDG",
          startDate: DateTime.parse("2020-01-01T00:00:00.000Z"),
          endDate: DateTime.parse("2020-01-01T00:00:00.000Z"),
          color: ActivityColors.blue.toString(),
          description: "Go to Terminal 1, take the first flight to CDG, then take the second flight to JFK",
          participants: [
            GroupMemberModel(userId: 1, firstname: "Tony", lastname: "Heng", profilePicture: DEFAULT_AVATAR_URL),
            GroupMemberModel(userId: 2, firstname: "Yanis", lastname: "Chaabane", profilePicture: DEFAULT_AVATAR_URL),
            GroupMemberModel(userId: 3, firstname: "Gabriels", lastname: "Raynik", profilePicture: DEFAULT_AVATAR_URL),
          ],
        ),
        ActivityModel(
          id: 2,
          icon: Icons.beach_access.codePoint.toString(),
          name: "Beach Time !",
          location: "JFK Beach",
          startDate: DateTime.parse("2020-01-01T00:00:00.000Z"),
          endDate: DateTime.parse("2020-01-01T00:00:00.000Z"),
          color: ActivityColors.turquoise.toString(),
          description: "Chill and swim at the beach",
          participants: [
            GroupMemberModel(userId: 1, firstname: "Tony", lastname: "Heng", profilePicture: DEFAULT_AVATAR_URL),
            GroupMemberModel(userId: 2, firstname: "Yanis", lastname: "Chaabane", profilePicture: DEFAULT_AVATAR_URL),
          ],
        ),
        ActivityModel(
          id: 1,
          icon: Icons.airplane_ticket.codePoint.toString(),
          name: "Flight Return",
          location: "Airport JFK",
          startDate: DateTime.parse("2020-01-01T00:00:00.000Z"),
          endDate: DateTime.parse("2020-01-01T00:00:00.000Z"),
          color: ActivityColors.blue.toString(),
          description: "Go to Terminal 1, take the first flight to CDG, then take the second flight to JFK",
          participants: [
            GroupMemberModel(userId: 1, firstname: "Tony", lastname: "Heng", profilePicture: DEFAULT_AVATAR_URL),
            GroupMemberModel(userId: 2, firstname: "Yanis", lastname: "Chaabane", profilePicture: DEFAULT_AVATAR_URL),
            GroupMemberModel(userId: 3, firstname: "Gabriels", lastname: "Raynik", profilePicture: DEFAULT_AVATAR_URL),
          ],
        ),
      ],
    );
  }

  @override
  Future<ActivityModel?> createActivity(int groupId, CreateActivityRequest request) {
    return Future.value(
      ActivityModel(),
    );
  }

  @override
  Future<void> deleteActivity(int groupId, num activityId) {
    return Future.value(null);
  }

  @override
  Future<ActivityModel?> updateActivity(int groupId, num activityId, UpdateActivityRequest request) {
    throw UnimplementedError();
  }

  @override
  Future<bool> toggleActivityMember(int groupId, num activityId, num userId, bool join) {
    return Future.value(true);
  }

  @override
  Future<List<String>?> getPlacesCategories() {
    return Future.value([]);
  }

  @override
  Future<List<PlaceResponse>?> getSuggestedActivities(PlacesFromCoordinatesRequest request) {
    return Future.value([]);
  }

  @override
  Future<void> deleteReport(int reportId) {
    return Future.value();
  }

  @override
  Future<List<ReportModel>?> getReports(int submitterId) {
    return Future.value([]);
  }

  @override
  Future<ReportModel?> submitReport(SubmitReportRequest submitReportRequest) {
    return Future.value(null);
  }

  @override
  Future<ReportModel?> updateReport(int reportId, UpdateReportRequest updateReportRequest) {
    return Future.value(null);
  }

  @override
  Future<void> deleteRecommendation(int recommendationId) {
    return Future.value();
  }

  @override
  Future<List<RecommendationModel>?> getRecommendations(int reviewedUserId) {
    return Future.value([]);
  }

  @override
  Future<RecommendationModel?> submitRecommendation(SubmitRecommendationRequest request) {
    return Future.value(null);
  }

  @override
  Future<List<BalanceResponse>?> getBudgetBalance(int groupId) {
    // TODO: implement getBudgetBalance
    throw UnimplementedError();
  }

  @override
  Future<ExpenseModel?> createExpense(int groupId, num? userId, ExpenseRequest body) {
    // TODO: implement createExpense
    throw UnimplementedError();
  }

  @override
  Future<List<ExpenseModel>?> getExpenses(int groupId) {
    // TODO: implement getExpenses
    throw UnimplementedError();
  }

  @override
  Future<ExpenseModel?> updateExpense(int groupId, num? userId, num? expenseId, ExpenseRequest body) {
    // TODO: implement updateExpense
    throw UnimplementedError();
  }

  @override
  Future<void> deleteExpense(int groupId, num? expenseId) {
    // TODO: implement deleteExpense
    throw UnimplementedError();
  }

  @override
  Future<List<MoneyDueResponse>?> getUserDueMoney(int groupId, num? userId) {
    // TODO: implement getUserDueMoney
    throw UnimplementedError();
  }

  @override
  Future<List<MoneyDueResponse>?> getUserOwedMoney(int groupId, num? userId) {
    // TODO: implement getUserOwedMoney
    throw UnimplementedError();
  }

  @override
  Future<ScanResponse?> scanReceipt(String minioUrl) {
    return Future.value(null);
  }

  @override
  Future<GroupMemoriesResponse?> addGroupMemory(int groupId, GroupMemoryRequest request) {
    return Future.value(GroupMemoriesResponse());
  }

  @override
  Future<GroupMemoriesResponse?> getGroupMemories(int groupId) {
    return Future.value(GroupMemoriesResponse());
  }

  @override
  Future<String?> getGroupQRCode(int groupId) {
    return Future.value(
        "iVBORw0KGgoAAAANSUhEUgAAAMgAAADIAQAAAACFI5MzAAABMElEQVR4Xu2WTa7DIAyEnRXH4Kb83JRjsMKdsaM2avt2T8WLWCRy/GUxtWEa0b9C3gvPuMlNGP9PmiByk9x11MmHIwzpuCYJ7lxeCUKmHDPjXpm7/FikpVESOhqRIFlp8JVQRDntrkMSO3pWYhA/JajZ+jw/O4nHgmQdrHnEIC1BeFYdRdjXcvk920nnsvJkDX3VUGRSL+ZcacyByJK86Cti7oLT/OzofqLwYxbM/ERs5lFIE+o9KN+TUcMQPaeNgPlxSzKNQkxyAhezQP7lBiFwl2WFwm+o607cTzxgft3kN57jKASpmCtbO3FW7M0YpOv5FVAS8+67MgiZbi0ce+O0wxF1d0FrXzsxClkcOFXD/GocojZtW5T8cpf9xE9Jp7tAsl46up98j5vchPEr8gDE3gIVopb0oQAAAABJRU5ErkJggg==");
  }

  @override
  Future<GroupInfoModel?> getGroupPublicInfoById(int groupId) {
    return Future.value(
        GroupInfoModel(name: 'Group TripNJoy', id: groupId, members: [], maxSize: 10, state: GroupInfoModelState.open));
  }

  @override
  Future<void> joinPrivateGroupWithoutInvitation(int groupId, int userId, JoinGroupWithoutInviteModel body) {
    return Future.value();
  }

  @override
  Future<void> setUserFirebaseToken(int userId, String token) {
    return Future.value();
  }

  @override
  Future<List<NotificationModel>> getNotifications() {
    return Future.value([]);
  }

  @override
  Future<Weather?> getWeather(String destination) {
    return Future.value(null);
  }
}
