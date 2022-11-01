import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/providers/api/api.provider.dart';
import 'package:trip_n_joy_front/viewmodels/groups/poll.viewmodel.dart';

final pollProvider = ChangeNotifierProvider<PollViewModel>((ref) {
  final httpService = ref.watch(apiProvider);
  return PollViewModel(httpService);
});
