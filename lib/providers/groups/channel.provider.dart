import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/providers/api/api.provider.dart';
import 'package:trip_n_joy_front/viewmodels/groups/channel.viewmodel.dart';

final channelProvider = StateNotifierProvider<ChannelViewModel, List<ChannelModel>>((ref) {
  final httpService = ref.watch(apiProvider);

  return ChannelViewModel(httpService);
});
