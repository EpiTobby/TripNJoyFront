import 'package:stomp_dart_client/stomp.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/models/auth/signInUpGoogle.model.dart';
import 'package:trip_n_joy_front/models/auth/signup.model.dart';
import 'package:trip_n_joy_front/providers/matchmaking/matchmaking.provider.dart';
import 'package:trip_n_joy_front/services/api/http.service.dart';
import 'package:web_socket_channel/src/channel.dart';

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
  Future<void> updatePrivateGroup(int groupId, UpdateGroupRequest groupUpdateRequest) {
    // TODO: implement updatePrivateGroup
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
  Future<StompClient> loadWebSocketChannel(void Function(bool) onConnection) {
    // TODO: implement loadWebSocketChannel
    throw UnimplementedError();
  }

  @override
  Future<WebSocketChannel> loadReadWebSocketChannel(num channelId) {
    // TODO: implement loadReadWebSocketChannel
    throw UnimplementedError();
  }

  @override
  Future<List<MessageResponse>> getChannelMessages(num channelId, int page) {
    // TODO: implement getChannelMessages
    throw UnimplementedError();
  }

  @override
  Future<List<MessageResponse>> getPinnedMessages(num channelId) {
    // TODO: implement getPinnedMessages
    throw UnimplementedError();
  }
}
