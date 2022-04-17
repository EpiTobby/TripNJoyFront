import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/constants/matchmaking/matchmaking_status.enum.dart';
import 'package:trip_n_joy_front/constants/matchmaking/popup_menu.enum.dart';
import 'package:trip_n_joy_front/providers/matchmaking/matchmaking.provider.dart';
import 'package:trip_n_joy_front/providers/matchmaking/profile.provider.dart';
import 'package:trip_n_joy_front/widgets/matchmaking/profile_detail.widget.dart';

import '../../codegen/api.swagger.dart';

class ProfileMenu extends ConsumerWidget {
  const ProfileMenu({Key? key, required this.value, required this.profileModel, required this.parentContext})
      : super(key: key);

  final String value;
  final ProfileModel profileModel;
  final BuildContext parentContext;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileViewModel = ref.watch(profileProvider.notifier);
    final matchmakingViewModel = ref.watch(matchmakingProvider.notifier);
    final matchmakingStatus = ref.watch(matchmakingProvider).status;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 24)),
        PopupMenuButton(
          onSelected: (result) {
            if (result == PopupMenuItemType.EDIT) {
              Navigator.push(
                  parentContext, MaterialPageRoute(builder: (_) => ProfileDetail(profileId: profileModel.id!.toInt())));
            }
          },
          itemBuilder: (context) => [
            if (matchmakingStatus != MatchmakingStatus.WAITING_MATCHMAKING && !profileModel.active!)
              PopupMenuItem(
                child: Row(
                  children: <Widget>[
                    Text(AppLocalizations.of(context).translate('profile.defineActive')),
                  ],
                ),
                onTap: () {
                  profileViewModel.updateProfile(
                      profileModel.id!.toInt(), ProfileUpdateRequest.fromJsonFactory({"active": true}));
                },
              ),
              PopupMenuItem(child: Row(
                children: <Widget>[
                  Flexible(child: Text(AppLocalizations.of(context).translate('matchmaking.retryProfile'))),
                ],
              ),
                onTap: () async {
                  if (!profileModel.active!) {
                    await profileViewModel.updateProfile(
                        profileModel.id!.toInt(), ProfileUpdateRequest.fromJsonFactory({"active": true}));
                  }
                  matchmakingViewModel.retryMatchmaking();
                }),
            PopupMenuItem(
              value: PopupMenuItemType.EDIT,
              child: Row(
                children: <Widget>[
                  Text(AppLocalizations.of(context).translate('profile.edit')),
                ],
              ),
            ),
            if (matchmakingStatus != MatchmakingStatus.WAITING_MATCHMAKING || !profileModel.active!)
              PopupMenuItem(
                child: Row(
                  children: <Widget>[
                    Text(
                      AppLocalizations.of(context).translate('profile.delete'),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  profileViewModel.deleteProfile(profileModel.id!.toInt());
                },
              ),
          ],
        )
      ],
    );
  }
}
