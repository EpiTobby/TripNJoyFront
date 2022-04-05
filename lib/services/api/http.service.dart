import '../../codegen/api.swagger.dart';
import '../../models/auth/signup.model.dart';

enum Method { POST, GET, PUT, DELETE, PATCH }

abstract class HttpService {
  Future<HttpService> init();

  void initInterceptors();

  Future<UserModel?> loadUser();

  Future<LoginResponse?> login(String email, String password);

  Future<AuthTokenResponse?> signup(SignupCredentials data);

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

  Future<void> reuseProfile(int id, int profileId, AvailabilityAnswerModel profileAvailability);

  Future<void> deleteProfile(int id, int profileId);
}
