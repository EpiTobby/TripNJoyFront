import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/providers/api/api.provider.dart';
import 'package:trip_n_joy_front/providers/groups/group.provider.dart';
import 'package:trip_n_joy_front/viewmodels/groups/qr_code.viewmodel.dart';

final qrCodeProvider = StateNotifierProvider<QRCodeViewModel, int?>((ref) {
  final httpService = ref.watch(apiProvider);
  final groupViewModel = ref.watch(groupProvider);

  return QRCodeViewModel(httpService, groupViewModel);
});
