import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/services/api/http.service.dart';

class ChannelViewModel extends StateNotifier<List<ChannelModel>> {
  ChannelViewModel(this.httpService) : super([]);

  final HttpService httpService;

  Future<void> fetchChannels(int groupId) async {
    final channels = await httpService.getChannels(groupId);
    state = channels;
  }

  Future<void> createChannel(int groupId, CreateChannelRequest request) async {
    await httpService.createChannel(groupId, request);
    await fetchChannels(groupId);
  }

  Future<void> deleteChannel(int groupId, int channelId) async {
    await httpService.deleteChannel(channelId);
    await fetchChannels(groupId);
  }

  Future<void> updateChannel(int groupId, int channelId, UpdateChannelRequest request) async {
    await httpService.updateChannel(channelId, request);
    await fetchChannels(groupId);
  }
}
