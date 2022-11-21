import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/codegen/api.swagger.dart';
import 'package:trip_n_joy_front/constants/common/default_values.dart';
import 'package:trip_n_joy_front/providers/groups/call.provider.dart';
import 'package:trip_n_joy_front/providers/groups/group.provider.dart';
import 'package:trip_n_joy_front/screens/groups/chat/calls/video_call.widget.dart';
import 'package:trip_n_joy_front/services/minio/minio.service.dart';
import 'package:trip_n_joy_front/widgets/common/async_value.widget.dart';

class CallPage extends HookConsumerWidget {
  const CallPage({
    Key? key,
    required this.groupId,
  }) : super(key: key);

  final int groupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupViewModel = ref.watch(groupProvider);
    final group = groupViewModel.groupInfo;
    useEffect(() {
      Future.microtask(() => ref.read(groupProvider).getGroupPublicInfoById(groupId));
      return null;
    }, [groupId]);

    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .colorScheme
          .secondary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AsyncValueWidget<GroupInfoModel>(
              value: group,
              data: (data) =>
                  Column(
                    children: [
                      CircleAvatar(
                          radius: 70,
                          backgroundColor: Theme
                              .of(context)
                              .colorScheme
                              .surface,
                          backgroundImage: NetworkImage(MinioService.getImageUrl(data.picture, DEFAULT_URL.GROUP))),
                      Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(data.name ?? "",
                              style: TextStyle(color: Theme
                                  .of(context)
                                  .colorScheme
                                  .onSecondary, fontSize: 32))),
                      Padding(
                          padding: const EdgeInsets.only(bottom: 72),
                          child: Text(AppLocalizations.of(context).translate("groups.call.notification"),
                              style: TextStyle(color: Theme
                                  .of(context)
                                  .colorScheme
                                  .onSecondary, fontSize: 24))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                              icon: Icon(Icons.call_end, color: Theme
                                  .of(context)
                                  .colorScheme
                                  .error, size: 48),
                              onPressed: () {
                                ref.read(callProvider).setOnCall(false);
                                Navigator.of(context).pop();
                              }
                          ),
                          IconButton(
                            icon: Icon(Icons.call, color: Theme
                                .of(context)
                                .colorScheme
                                .background, size: 48),
                            onPressed: () async {
                              final callViewModel = ref.read(callProvider);
                              await callViewModel.getPermissions();
                              final channelName = callViewModel.getChannelName(data.id!.toInt());
                              final token = await callViewModel.getToken(data.id!.toInt());
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      VideoCall(
                                        channelName: channelName,
                                        role: ClientRole.Broadcaster,
                                        token: token,
                                      ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ].toList(),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
