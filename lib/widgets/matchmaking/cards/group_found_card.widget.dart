import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/constants/common/default_values.dart';
import 'package:trip_n_joy_front/constants/navbar/navbar.enum.dart';
import 'package:trip_n_joy_front/providers/groups/group.provider.dart';
import 'package:trip_n_joy_front/providers/matchmaking/matchmaking.provider.dart';
import 'package:trip_n_joy_front/providers/matchmaking/profile.provider.dart';
import 'package:trip_n_joy_front/providers/navbar/navbar.provider.dart';
import 'package:trip_n_joy_front/services/minio/minio.service.dart';
import 'package:trip_n_joy_front/widgets/common/button.widget.dart';
import 'package:trip_n_joy_front/widgets/common/card.widget.dart';

class GroupFoundCard extends HookConsumerWidget {
  const GroupFoundCard({
    Key? key,
    this.groupId,
    required this.groupPhotoUrl,
    required this.membersPhotoUrls,
    this.isLoading = false,
  }) : super(key: key);

  final int? groupId;
  final String? groupPhotoUrl;
  final List<String?> membersPhotoUrls;
  final bool isLoading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animation = useAnimationController(
      duration: const Duration(milliseconds: 500),
    );
    final offset = Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0, -2))
        .animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut));
    final matchmakingViewModel = ref.watch(matchmakingProvider.notifier);
    final groupViewModel = ref.watch(groupProvider);

    final navbar = ref.watch(navbarStateProvider.notifier);

    final profiles = ref.watch(profileProvider);

    return SlideTransition(
      position: offset,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          StandardCard(
            title: AppLocalizations.of(context).translate('cards.group_found.title'),
            color: Theme.of(context).colorScheme.primary,
            backgroundColor: Theme.of(context).colorScheme.onPrimary,
            shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
            isLoading: isLoading,
            loadingTitle: AppLocalizations.of(context).translate('cards.group_found.loading.title'),
            loadingSubtitle: AppLocalizations.of(context).translate('cards.group_found.loading.subtitle'),
            child: Column(
              children: [
                Expanded(
                    child: Center(
                        child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(blurRadius: 20, color: Theme.of(context).colorScheme.surface, spreadRadius: -10)
                          ],
                        ),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(MinioService.getImageUrl(groupPhotoUrl, DEFAULT_URL.GROUP)),
                          radius: 70,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (final memberPhotoUrl in membersPhotoUrls)
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(MinioService.getImageUrl(memberPhotoUrl, DEFAULT_URL.AVATAR)),
                              radius: 20,
                            ),
                          ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        AppLocalizations.of(context).translate('cards.group_found.members',
                            {'count': membersPhotoUrls.isEmpty ? "1" : membersPhotoUrls.length.toString()}),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ))),
                PrimaryButton(
                    text: AppLocalizations.of(context).translate('cards.group_found.button'),
                    onPressed: () {
                      animation.forward().whenComplete(() async {
                        await groupViewModel.getGroups();
                        matchmakingViewModel.joinGroup();
                        navbar.navigate(NavbarPage.GROUPS);
                      });
                    }),
              ],
            ),
          ),
          if (!isLoading)
            SecondaryButton(
                text: AppLocalizations.of(context).translate('cards.group_found.retry'),
                onPressed: () async {
                  if (profiles != null) {
                    final activeProfile = profiles.where((profile) => profile.active!);
                    if (activeProfile.isNotEmpty) {
                      matchmakingViewModel.retryMatchmaking(activeProfile.first.id!.toInt(), groupId);
                    }
                  } else {
                    matchmakingViewModel.retryMatchmakingNoProfile(groupId);
                  }
                }),
        ],
      ),
    );
  }
}
