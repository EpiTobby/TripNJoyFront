import 'package:stomp_dart_client/stomp.dart';
import 'package:trip_n_joy_front/models/auth/signInUpGoogle.model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../codegen/api.swagger.dart';
import '../../models/auth/signup.model.dart';

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

  Future<List<GroupModel>?> getGroups(int id);

  Future<List<GroupModel>?> getUserInvitesGroups(int id);

  Future<void> declineGroupInvitation(int groupId, int userId);

  Future<GroupModel?> createPrivateGroup(int id, CreatePrivateGroupRequest createPrivateGroupRequest);

  Future<void> addUserToPrivateGroup(int groupId, String email);

  Future<void> joinPrivateGroup(int groupId, int userId);

  Future<void> deletePrivateGroup(int groupId);

  Future<void> updatePrivateGroup(int groupId, UpdateGroupRequest groupUpdateRequest);

  Future<void> removeUserFromPrivateGroup(int groupId, int userId);

  Future<void> leaveGroup(int groupId, int userId);

  Future<List<ChannelModel>> getChannels(int groupId);

  Future<ChannelModel?> createChannel(int groupId, CreateChannelRequest createChannelRequest);

  Future<ChannelModel?> updateChannel(num channelId, UpdateChannelRequest updateChannelRequest);

  Future<void> deleteChannel(num channelId);

  Future<StompClient> loadWebSocketChannel(void Function(bool) onConnection);

  Future<WebSocketChannel> loadReadWebSocketChannel(num channelId);

  Future<List<MessageResponse>> getChannelMessages(num channelId, int page);

  Future<GroupMemberModel?> getUserPublicInfo(int groupId, num userId);
}
