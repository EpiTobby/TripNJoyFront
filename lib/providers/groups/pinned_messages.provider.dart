import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/providers/api/api.provider.dart';
import 'package:trip_n_joy_front/viewmodels/groups/pinned_messages.viewmodel.dart';

final pinnedMessagesProvider = ChangeNotifierProvider<PinnedMessagesViewModel>((ref) {
  final httpService = ref.watch(apiProvider);
  return PinnedMessagesViewModel(httpService);
});
