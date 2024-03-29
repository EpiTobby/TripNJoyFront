import 'package:stomp_dart_client/stomp.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/models/auth/signInUpGoogle.model.dart';
import 'package:trip_n_joy_front/models/auth/signup.model.dart';

enum Method { POST, GET, PUT, DELETE, PATCH }

abstract class HttpService {
  Future<HttpService> init();

  void initInterceptors();

  Future<UserModel?> loadUser();

  Future<LoginResponse?> login(String email, String password);

  Future<AuthTokenResponse?> signup(SignupCredentials data);

  Future<GoogleAuthResponse?> signInUpGoogle(SignInUpGoogleCredentials data);

  Future<bool> verifyAccount(int id, String code);

  Future<bool> deleteUser(int id, DeleteUserRequest deleteUserRequest);

  Future<void> updateUser(int id, UserUpdateRequest updateRequest);

  int? getUserIdFromToken(String? token);

  Future<void> forgotPassword(String email);

  Future<UserIdResponse?> resetPassword(String email, String code, String password);

  Future<void> resendVerificationCode(int id);

  Future<void> updatePassword(int id, UpdatePasswordRequest updatePasswordRequest);

  Future<LoginResponse?> updateEmail(int id, UpdateEmailRequest updateEmailRequest);

  Future<List<ProfileModel>?> getUserProfiles(int id);

  Future<ProfileModel?> createProfile(int id, ProfileCreationRequest profile);

  Future<void> updateProfile(int id, int profileId, ProfileUpdateRequest profileUpdateRequest);

  Future<void> deleteProfile(int id, int profileId);

  Future<MatchMakingResponse?> startMatchmaking(int userId, ProfileCreationRequest profile);

  Future<MatchMakingResult?> getMatchmakingResult(int taskId);

  Future<MatchMakingResponse?> retryMatchmaking(int userId, int profileId);

  Future<List<GroupModel>?> getGroups(int id);

  Future<List<GroupModel>?> getUserInvitesGroups(int id);

  Future<void> declineGroupInvitation(int groupId, int userId);

  Future<GroupModel?> createPrivateGroup(int id, CreatePrivateGroupRequest createPrivateGroupRequest);

  Future<void> addUserToPrivateGroup(int groupId, String email);

  Future<void> joinPrivateGroup(int groupId, int userId);

  Future<void> joinPrivateGroupWithoutInvitation(int groupId, int userId, JoinGroupWithoutInviteModel body);

  Future<void> deletePrivateGroup(int groupId);

  Future<void> updatePrivateGroup(int groupId, UpdatePrivateGroupRequest groupUpdateRequest);

  Future<void> updatePublicGroup(int groupId, UpdatePublicGroupRequest groupUpdateRequest);

  Future<void> removeUserFromPrivateGroup(int groupId, int userId);

  Future<void> leaveGroup(int groupId, int userId);

  Future<void> setGroupPublic(int groupId);

  Future<List<ChannelModel>> getChannels(int groupId);

  Future<ChannelModel?> createChannel(int groupId, CreateChannelRequest createChannelRequest);

  Future<ChannelModel?> updateChannel(num channelId, UpdateChannelRequest updateChannelRequest);

  Future<void> deleteChannel(num channelId);

  Future<StompClient?> loadWebSocketChannel(void Function(bool) onConnection);

  Future<List<MessageResponse>> getChannelMessages(num channelId, int page);

  Future<List<MessageResponse>> getPinnedMessages(num channelId);

  Future<GroupMemberModel?> getUserPublicInfo(int groupId, num userId);

  Future<MessageResponse?> togglePinnedMessage(num messageId, bool pinned);

  Future<List<ActivityModel>?> getActivities(int groupId);

  Future<ActivityModel?> createActivity(int groupId, CreateActivityRequest request);

  Future<void> deleteActivity(int groupId, num activityId);

  Future<ActivityModel?> updateActivity(int groupId, num activityId, UpdateActivityRequest request);

  Future<bool> toggleActivityMember(int groupId, num activityId, num userId, bool join);

  Future<List<String>?> getPlacesCategories();

  Future<List<PlaceResponse>?> getSuggestedActivities(PlacesFromCoordinatesRequest request);

  Future<ReportModel?> submitReport(SubmitReportRequest submitReportRequest);

  Future<List<ReportModel>?> getReports(int submitterId);

  Future<ReportModel?> updateReport(int reportId, UpdateReportRequest updateReportRequest);

  Future<void> deleteReport(int reportId);

  Future<RecommendationModel?> submitRecommendation(SubmitRecommendationRequest request);

  Future<List<RecommendationModel>?> getRecommendations(int reviewedUserId);

  Future<void> deleteRecommendation(int recommendationId);

  Future<List<BalanceResponse>?> getBudgetBalance(int groupId);

  Future<ExpenseModel?> createExpense(int groupId, num? userId, ExpenseRequest body);

  Future<ExpenseModel?> updateExpense(int groupId, num? userId, num? expenseId, ExpenseRequest body);

  Future<List<ExpenseModel>?> getExpenses(int groupId);

  Future<void> deleteExpense(int groupId, num? expenseId);

  Future<List<MoneyDueResponse>?> getUserOwedMoney(int groupId, num? userId);

  Future<List<MoneyDueResponse>?> getUserDueMoney(int groupId, num? userId);

  Future<ScanResponse?> scanReceipt(String minioUrl);

  Future<GroupMemoriesResponse?> getGroupMemories(int groupId);

  Future<GroupMemoriesResponse?> addGroupMemory(int groupId, GroupMemoryRequest request);

  Future<String?> getGroupQRCode(int groupId);

  Future<GroupInfoModel?> getGroupPublicInfoById(int groupId);

  Future<void> setUserFirebaseToken(int userId, String token);

  Future<List<NotificationModel>> getNotifications();
}
