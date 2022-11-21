import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/services/api/http.service.dart';
import 'package:trip_n_joy_front/services/notification/push_notification.service.dart';
import 'package:trip_n_joy_front/viewmodels/auth/auth.viewmodel.dart';

class UserViewModel extends StateNotifier<AsyncValue<UserResponse?>> {
  UserViewModel(this.httpService, this.authViewModel, this.pushNotificationService) : super(const AsyncValue.loading());
  final HttpService httpService;
  final AuthViewModel authViewModel;
  final PushNotificationService pushNotificationService;
  UserResponse? user;

  Future<UserResponse?> loadUser() async {
    try {
      state = const AsyncLoading();
      user = await httpService.loadUser().timeout(const Duration(seconds: 10));
      state = AsyncData(user);
      if (user != null && user!.id != null) {
        pushNotificationService.setUserToken(user!.id!.toInt());
      }
      return user;
    } catch (e) {
      state = AsyncError(e);
    }
    return null;
  }

  Future<bool> deleteUser(String token, DeleteUserRequest deleteUserRequest) async {
    try {
      var id = httpService.getUserIdFromToken(token);
      final success = await httpService.deleteUser(id!, deleteUserRequest).timeout(const Duration(seconds: 10));
      if (success) {
        state = const AsyncData(null);
      }
      return success;
    } catch (e) {
      return false;
    }
  }

  Future<void> updateUser(String token, UserUpdateRequest updateRequest) async {
    try {
      state = const AsyncLoading();
      var id = httpService.getUserIdFromToken(token);
      await httpService.updateUser(id!, updateRequest);
      user = await httpService.loadUser().timeout(const Duration(seconds: 10));
      state = AsyncData(user);
    } catch (e) {
      state = AsyncError(e);
    }
  }

  Future<void> updateEmail(int id, UpdateEmailRequest updateEmailRequest) async {
    try {
      state = const AsyncLoading();
      final loginResponse = await httpService.updateEmail(id, updateEmailRequest);
      if (loginResponse != null && loginResponse.token != null) {
        await authViewModel.logout();
      } else {
        state = AsyncError(Exception(AppLocalizations.instance.translate("errors.unexpected")));
      }
    } catch (e) {
      state = AsyncError(e);
    }
  }

  Future<UserResponse?> getUserById(int id) async {
    final response = await httpService.getUserById(id);

    return response;
  }

  num? get userId => user?.id;
}
