import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/providers/api/api.provider.dart';
import 'package:trip_n_joy_front/providers/auth/auth.provider.dart';
import 'package:trip_n_joy_front/providers/minio/minio.provider.dart';
import 'package:trip_n_joy_front/viewmodels/groups/chat.viewmodel.dart';

final chatProvider = ChangeNotifierProvider.autoDispose<ChatViewModel>((ref) {
  final httpService = ref.watch(apiProvider);
  final authViewModel = ref.watch(authProvider);
  final minioService = ref.watch(minioProvider);
  return ChatViewModel(httpService, authViewModel, minioService);
});
