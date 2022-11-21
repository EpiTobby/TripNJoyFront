import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/models/api/news_article.model.dart';
import 'package:trip_n_joy_front/models/auth/signInUpGoogle.model.dart';
import 'package:trip_n_joy_front/models/auth/signup.model.dart';
import 'package:trip_n_joy_front/models/group/poll.dart';
import 'package:trip_n_joy_front/services/api/http.service.dart';
import 'package:trip_n_joy_front/viewmodels/auth/auth.viewmodel.dart';
import 'package:weather/weather.dart';
import 'package:http/http.dart' as http;

const BASE_URL = String.fromEnvironment("BASE_URL", defaultValue: "http://localhost:8080");
const WEATHER_API_KEY = String.fromEnvironment("WEATHER_API_KEY", defaultValue: "");
const NEWS_API_KEY = String.fromEnvironment("NEWS_API_KEY", defaultValue: "");

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
  Future<UserResponse?> loadUser() async {
    final response = await api.usersUsersMeGet();
    return response.body;
  }

  @override
  Future<LoginResponse?> login(String email, String password) async {
    final response = await api.usersAuthLoginPost(body: LoginRequest(password: password, username: email));
    return response.body;
  }

  @override
  Future<AuthTokenResponse?> signup(SignupCredentials data) async {
    final response = await api.usersAuthRegisterPost(
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
    final response = await api.usersUsersDelete(body: deleteUserRequest);

    return response.isSuccessful;
  }

  @override
  Future<UserResponse?> getUserById(int id) async {
    final response = await api.usersUsersIdGet(id: id);

    return response.body;
  }

  @override
  Future<bool> verifyAccount(int id, String code) async {
    final response = await api.usersAuthIdConfirmationPatch(body: ConfirmationCodeModel(value: code), id: id);
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
    await api.usersAuthForgotPasswordPost(body: ForgotPasswordRequest(email: email));
  }

  @override
  Future<UserIdResponse?> resetPassword(String email, String code, String password) async {
    final response = await api.usersAuthValidationPasswordPatch(
        body: ValidateCodePasswordRequest(email: email, newPassword: password, value: code));
    return response.body;
  }

  @override
  Future<void> resendVerificationCode(int id) async {
    await api.usersAuthIdResendPost(id: id);
  }

  @override
  Future<void> updateUser(int id, UserUpdateRequest updateRequest) async {
    await api.usersUsersUpdatePatch(body: updateRequest);
  }

  @override
  Future<LoginResponse?> updateEmail(int id, UpdateEmailRequest updateEmailRequest) async {
    final response = await api.usersAuthIdEmailPatch(id: id, body: updateEmailRequest);
    return response.body;
  }

  @override
  Future<void> updatePassword(int id, UpdatePasswordRequest updatePasswordRequest) async {
    await api.usersAuthIdPasswordPatch(id: id, body: updatePasswordRequest);
  }

  @override
  Future<ProfileModel?> createProfile(int id, ProfileCreationRequest profile) async {
    final response = await api.profilesProfilesPost(body: profile);

    return response.body;
  }

  @override
  Future<void> deleteProfile(int id, int profileId) async {
    await api.profilesProfilesProfileDelete(profile: profileId);
  }

  @override
  Future<List<ProfileModel>?> getUserProfiles(int id) async {
    final response = await api.profilesProfilesGet();

    return response.body;
  }

  @override
  Future<void> updateProfile(int id, int profileId, ProfileUpdateRequest profileUpdateRequest) async {
    await api.profilesProfilesProfileUpdatePatch(profile: profileId, body: profileUpdateRequest);
  }

  @override
  Future<GoogleAuthResponse?> signInUpGoogle(SignInUpGoogleCredentials data) async {
    final response = await api.usersAuthGooglePost(
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
  Future<GroupResponse?> createPrivateGroup(int id, CreatePrivateGroupRequest createPrivateGroupRequest) async {
    final response = await api.groupsPrivatePost(body: createPrivateGroupRequest);

    return response.body;
  }

  @override
  Future<void> deletePrivateGroup(int groupId) async {
    await api.groupsPrivateGroupDelete(group: groupId);
  }

  @override
  Future<List<GroupResponse>?> getGroups(int id) async {
    final response = await api.groupsIdGet(id: id);

    return response.body;
  }

  @override
  Future<List<GroupResponse>?> getUserInvitesGroups(int id) async {
    final response = await api.groupsInvitesIdGet(id: id);
    return response.body;
  }

  @override
  Future<void> declineGroupInvitation(int groupId, int userId) async {
    await api.groupsGroupDeclinePatch(group: groupId);
  }

  @override
  Future<void> joinPrivateGroup(int groupId, int userId) async {
    await api.groupsPrivateGroupJoinPatch(group: groupId, body: null);
  }

  @override
  Future<void> leaveGroup(int groupId, int userId) async {
    await api.groupsGroupUserDelete(group: groupId);
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
  Future<void> setGroupPublic(int groupId) async {}

  @override
  Future<List<ChannelModel>> getChannels(int groupId) async {
    final response = await api.chatChannelsGroupGet(group: groupId);

    return response.body != null ? response.body! : [];
  }

  @override
  Future<ChannelModel?> createChannel(int groupId, CreateChannelRequest createChannelRequest) async {
    final response = await api.chatChannelsGroupPost(group: groupId, body: createChannelRequest);
    return response.body;
  }

  @override
  Future<ChannelModel?> updateChannel(num channelId, UpdateChannelRequest updateChannelRequest) async {
    final response = await api.chatChannelsIdPatch(id: channelId, body: updateChannelRequest);
    return response.body;
  }

  @override
  Future<void> deleteChannel(num channelId) async {
    await api.chatChannelsIdDelete(id: channelId);
  }

  @override
  Future<MatchMakingResult?> getMatchmakingResult(int taskId) async {
    final response = await api.profilesMatchmakingTaskIdGet(taskId: taskId);

    return response.body;
  }

  @override
  Future<MatchMakingResponse?> startMatchmaking(int userId, ProfileCreationRequest profile) async {
    final response = await api.profilesMatchmakingPost(userId: userId, body: profile);

    try {
      return MatchMakingResponse(taskId: response.body!['taskId'], errorMessage: response.body!['errorMessage']);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<MatchMakingResponse?> retryMatchmaking(int userId, int profileId) async {
    final response = await api.profilesMatchmakingPatch(userId: userId, profileId: profileId);

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
    final response = await api.chatChatChannelIdGet(channelId: channelId, page: page);
    return response.body!;
  }

  @override
  Future<List<MessageResponse>> getPinnedMessages(num channelId) async {
    final response = await api.chatChatChannelIdPinnedGet(channelId: channelId);
    return response.body!;
  }

  @override
  Future<GroupMemberModel?> getUserPublicInfo(int groupId, num userId) async {
    final response = await api.groupsIdUsersUserIdGet(id: groupId, userId: userId);

    return response.body;
  }

  @override
  Future<MessageResponse?> togglePinnedMessage(num messageId, bool pinned) async {
    final response = await api.chatChatMessageIdPinnedPatch(messageId: messageId, pin: pinned);
    return response.body;
  }

  @override
  Future<List<ActivityResponse>?> getActivities(int groupId) async {
    final response = await api.planningGroupsGroupIdPlanningGet(groupId: groupId);
    return response.body;
  }

  @override
  Future<ActivityResponse?> createActivity(int groupId, CreateActivityRequest request) async {
    final response = await api.planningGroupsGroupIdPlanningPost(groupId: groupId, body: request);
    return response.body;
  }

  @override
  Future<void> deleteActivity(int groupId, num activityId) async {
    await api.planningGroupsGroupIdPlanningActivityIdDelete(groupId: groupId, activityId: activityId);
  }

  @override
  Future<ActivityResponse?> updateActivity(int groupId, num activityId, UpdateActivityRequest request) async {
    final response =
        await api.planningGroupsGroupIdPlanningActivityIdPatch(groupId: groupId, activityId: activityId, body: request);
    return response.body;
  }

  @override
  Future<bool> toggleActivityMember(int groupId, num activityId, num userId, bool join) async {
    final response = join
        ? await api.planningGroupsGroupIdPlanningActivityIdJoinPatch(groupId: groupId, activityId: activityId, userId: userId)
        : await api.planningGroupsGroupIdPlanningActivityIdLeavePatch(groupId: groupId, activityId: activityId, userId: userId);
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
  Future<List<ReportResponse>?> getReports(int submitterId) async {
    final response = await api.reportsReportsIdGet(id: submitterId);
    return response.body;
  }

  @override
  Future<ReportResponse?> submitReport(SubmitReportRequest submitReportRequest) async {
    final response = await api.reportsReportsPost(body: submitReportRequest);
    return response.body;
  }

  @override
  Future<ReportResponse?> updateReport(int reportId, UpdateReportRequest updateReportRequest) async {
    final response = await api.reportsReportsIdPatch(id: reportId, body: updateReportRequest);
    return response.body;
  }

  @override
  Future<void> deleteReport(int reportId) async {
    await api.reportsReportsIdDelete(id: reportId);
  }

  @override
  Future<List<RecommendationResponse>?> getRecommendations(int reviewedUserId) async {
    final response = await api.reportsRecommendationsIdGet(id: reviewedUserId);
    return response.body;
  }

  @override
  Future<RecommendationResponse?> submitRecommendation(SubmitRecommendationRequest request) async {
    final response = await api.reportsRecommendationsPost(body: request);
    return response.body;
  }

  @override
  Future<void> deleteRecommendation(int recommendationId) async {
    await api.reportsRecommendationsIdDelete(id: recommendationId);
  }

  @override
  Future<List<BalanceResponse>?> getBudgetBalance(int groupId) async {
    final response = await api.expensesExpensesGroupBalancesGet(group: groupId);
    return response.body;
  }

  @override
  Future<ExpenseModel?> createExpense(int groupId, num? userId, ExpenseRequest body) async {
    final response = await api.expensesExpensesGroupPurchaserUserPost(group: groupId, user: userId, body: body);
    return response.body;
  }

  @override
  Future<ExpenseModel?> updateExpense(int groupId, num? userId, num? expenseId, ExpenseRequest body) async {
    final response = await api.expensesExpensesGroupIdExpenseIdPurchaserUserPut(
        groupId: groupId, expenseId: expenseId, user: userId, body: body);
    return response.body;
  }

  @override
  Future<List<ExpenseModel>?> getExpenses(int groupId) async {
    final response = await api.expensesExpensesGroupGet(group: groupId);
    return response.body;
  }

  @override
  Future<void> deleteExpense(int groupId, num? expenseId) async {
    await api.expensesExpensesGroupIdExpenseIdDelete(groupId: groupId, expenseId: expenseId);
  }

  @override
  Future<List<MoneyDueResponse>?> getUserOwedMoney(int groupId, num? userId) async {
    final response = await api.expensesExpensesGroupUserUserDebtsDueGet(group: groupId, user: userId);
    return response.body;
  }

  @override
  Future<List<MoneyDueResponse>?> getUserDueMoney(int groupId, num? userId) async {
    final response = await api.expensesExpensesGroupUserUserDebtsGet(group: groupId, user: userId);
    return response.body;
  }

  @override
  Future<ScanResponse?> scanReceipt(String minioUrl) async {
    final response = await api.expensesScanPost(body: ScanRequest(minioUrl: minioUrl));

    return response.body;
  }

  @override
  Future<GroupMemoriesResponse?> addGroupMemory(int groupId, GroupMemoryRequest request) async {
    final response = await api.groupsGroupIdMemoriesPost(groupId: groupId, body: request);
    return response.body;
  }

  @override
  Future<GroupMemoriesResponse?> getGroupMemories(int groupId) async {
    final response = await api.groupsGroupIdMemoriesGet(groupId: groupId);

    return response.body;
  }

  @override
  Future<String?> getGroupQRCode(int groupId) async {
    final response = await api.groupsPrivateGroupQrcodeGet(group: groupId);
    return response.body;
  }

  @override
  Future<GroupInfoModel?> getGroupPublicInfoById(int groupId) async {
    final response = await api.groupsInfoIdGet(id: groupId);

    return response.body;
  }

  @override
  Future<void> joinPrivateGroupWithoutInvitation(int groupId, int userId, JoinGroupWithoutInviteModel body) async {
    await api.groupsPrivateGroupJoinPatch(group: groupId, body: body);
  }

  @override
  Future<void> setUserFirebaseToken(int userId, String token) async {
    await api.usersUsersIdFirebasePatch(id: userId, token: token);
  }

  @override
  Future<List<NotificationModel>> getNotifications() async {
    final response = await api.notificationsNotificationsGet();
    return response.body ?? [];
  }

  @override
  Future<Weather?> getWeather(String destination) async {
    final wf = WeatherFactory(WEATHER_API_KEY);
    final weather = await wf.currentWeatherByCityName(destination);
    return weather;
  }

  @override
  Future<List<Weather>?> getWeeklyWeather(String destination) async {
    final wf = WeatherFactory(WEATHER_API_KEY);
    final weathers = await wf.fiveDayForecastByCityName(destination);
    final filteredWeathers = List<Weather>.empty(growable: true);

    DateTime? lastDate;
    for (var weather in weathers) {
      if (lastDate == null) {
        lastDate = weather.date;
        filteredWeathers.add(weather);
        continue;
      }
      if (lastDate.day != weather.date?.day) {
        lastDate = weather.date;
        filteredWeathers.add(weather);
      }
    }
    return filteredWeathers;
  }

  @override
  Future<SurveyModel?> getPoll(int pollId) async {
    final response = await api.chatSurveysIdGet(id: pollId);

    return response.body;
  }

  @override
  Future<void> singleChoiceVote(int pollId, int answerId) async {
    await api.chatSurveysVoteIdPost(
      id: pollId,
      body: VoteSurveyRequest(answerId: answerId),
    );
  }

  @override
  Future<void> multipleChoiceVote(int pollId, int answerId, bool voted) async {
    if (voted) {
      await api.chatSurveysVoteIdPost(id: pollId, body: VoteSurveyRequest(answerId: answerId));
    } else {
      await api.chatSurveysVoteIdDelete(id: answerId);
    }
  }

  @override
  Future<SurveyModel?> addPoll(int channelId, PostSurveyRequest request) async {
    final response = await api.chatSurveysIdPost(id: channelId, body: request);
    return response.body;
  }

  @override
  Future<void> deletePoll(int pollId) async {
    await api.chatSurveysIdDelete(id: pollId);
  }

  @override
  Future<List<NewsArticle>> getNews(String destination) async {
    String url =
        "http://newsapi.org/v2/everything?q=$destination&language=fr&pageSize=20&sortBy=publishedAt&apiKey=$NEWS_API_KEY";

    var response = await http.get(Uri.parse(url));

    List<NewsArticle> news = [];

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        NewsArticle article = NewsArticle(
          title: element['title'] ?? "",
          author: element['author'] ?? "",
          description: element['description'] ?? "",
          urlToImage: element['urlToImage'] ?? "",
          publishedAt: DateTime.parse(element['publishedAt'] ?? ""),
          content: element["content"] ?? "",
          articleUrl: element["url"] ?? "",
        );
        news.add(article);
      });
    }

    return news;
  }
}
