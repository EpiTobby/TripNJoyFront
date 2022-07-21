import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/constants/common/default_values.dart';
import 'package:trip_n_joy_front/models/group/article.dart';
import 'package:trip_n_joy_front/providers/groups/group.provider.dart';
import 'package:trip_n_joy_front/services/minio/minio.service.dart';
import 'package:trip_n_joy_front/widgets/common/button.widget.dart';
import 'package:trip_n_joy_front/widgets/common/input/input.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout/layout_row_item_member.widget.dart';

class InputDialogArticle extends HookConsumerWidget {
  const InputDialogArticle({
    Key? key,
    required this.groupId,
    required this.article,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  final int groupId;
  final Article article;
  final void Function(Article) onEdit;
  final void Function(Article) onDelete;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupViewModel = ref.watch(groupProvider);
    final group = groupViewModel.groups.firstWhere((group) => group.id == groupId);

    final newName = useTextEditingController(text: article.name);
    final newPrice = useTextEditingController(text: article.price.toString());
    final newParticipants = useState(article.participants);
    return AnimatedPadding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 200),
      child: Material(
        color: Theme.of(context).colorScheme.background,
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InputField(
                  hint: "Article",
                  controller: newName,
                ),
                InputField(
                  hint: "Amount",
                  controller: newPrice,
                  keyboardType: TextInputType.number,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 100,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: group.members
                              ?.map(
                                (e) => LayoutRowItemMember(
                                  name: "${e.firstname} ${e.lastname}",
                                  avatarUrl: MinioService.getImageUrl(e.profilePicture, DEFAULT_URL.AVATAR),
                                  isSelected: newParticipants.value.contains(e.id!.toInt()),
                                  onTap: (value) {
                                    if (newParticipants.value.any((p) => p == e.id!.toInt())) {
                                      newParticipants.value.remove(e.id!.toInt());
                                      newParticipants.value = [...newParticipants.value];
                                    } else {
                                      newParticipants.value.add(e.id!.toInt());
                                      newParticipants.value = [...newParticipants.value, e.id!.toInt()];
                                    }
                                  },
                                ),
                              )
                              .toList() ??
                          [],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PrimaryButton(
                        text: AppLocalizations.of(context).translate('common.delete'),
                        onPressed: () {
                          onDelete(Article(
                            id: article.id,
                            name: newName.text,
                            price: double.tryParse(newPrice.text) ?? article.price,
                            participants: newParticipants.value,
                          ));
                          Navigator.of(context).pop();
                        },
                        fitContent: true,
                        color: Theme.of(context).errorColor,
                      ),
                      PrimaryButton(
                        text: AppLocalizations.of(context).translate("groups.scan.adjust"),
                        onPressed: () {
                          onEdit(Article(
                            id: article.id,
                            name: newName.text,
                            price: double.tryParse(newPrice.text) ?? article.price,
                            participants: newParticipants.value,
                          ));
                          Navigator.of(context).pop();
                        },
                        fitContent: true,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
