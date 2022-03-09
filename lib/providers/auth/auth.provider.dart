import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/services/api/dio.service.dart';

import '../../services/auth/auth.service.dart';

final authProvider =
    ChangeNotifierProvider((ref) => AuthService(HttpService()));
final authLoginStateProvider =
    StateProvider((ref) => ref.watch(authProvider).loginState);
