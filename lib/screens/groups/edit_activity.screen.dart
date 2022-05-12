import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/constants/common/colors.style.dart';
import 'package:trip_n_joy_front/widgets/common/input_dialog.widget.dart';
import 'package:trip_n_joy_front/widgets/common/input_dialog_choice.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_box.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_item.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_item_value.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_row_item.widget.dart';
import 'package:trip_n_joy_front/widgets/common/layout_row_item_member.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/planning_activity.widget.dart';

class EditActivity extends HookConsumerWidget {
  const EditActivity({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('groups.planning.activity.title')),
        foregroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          PlanningActivity(
            prefix: Icon(
              Icons.airplane_ticket,
              color: Theme.of(context).colorScheme.background,
              size: 64,
            ),
            title: "Flight Departure",
            subtitle: "Airport CDG",
            subsubtitle: "12/12/2022",
            description: "Go to Terminal 1, take the first flight to CDG, then take the second flight to JFK",
          ),
          Divider(
            height: 5,
            thickness: 1,
            color: Theme.of(context).colorScheme.primary.withAlpha(0x33),
          ),
          Expanded(
            child: ListView(
              children: [
                LayoutBox(
                  title: AppLocalizations.of(context).translate("groups.planning.activity.edit.title"),
                  children: <Widget>[
                    LayoutItem(
                      title: AppLocalizations.of(context).translate("groups.planning.activity.edit.name.title"),
                      child: LayoutItemValue(
                        value: "groups.planning.activity.edit.name.title",
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return InputDialog(
                                title:
                                    AppLocalizations.of(context).translate("groups.planning.activity.edit.name.edit"),
                                label:
                                    AppLocalizations.of(context).translate("groups.planning.activity.edit.name.title"),
                                initialValue: "",
                                onConfirm: (value) async {},
                              );
                            },
                          );
                        },
                      ),
                    ),
                    LayoutItem(
                      title: AppLocalizations.of(context).translate("groups.planning.activity.edit.location.title"),
                      child: LayoutItemValue(
                        value: "groups.planning.activity.edit.location.title",
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return InputDialog(
                                title: AppLocalizations.of(context)
                                    .translate("groups.planning.activity.edit.location.edit"),
                                label: AppLocalizations.of(context)
                                    .translate("groups.planning.activity.edit.location.title"),
                                initialValue: "",
                                onConfirm: (value) async {},
                              );
                            },
                          );
                        },
                      ),
                    ),
                    LayoutItem(
                      title: AppLocalizations.of(context).translate("groups.planning.activity.edit.begin.title"),
                      child: LayoutItemValue(
                        value: "groups.planning.activity.edit.begin.title",
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return InputDialog(
                                title:
                                    AppLocalizations.of(context).translate("groups.planning.activity.edit.begin.edit"),
                                label:
                                    AppLocalizations.of(context).translate("groups.planning.activity.edit.begin.title"),
                                initialValue: "",
                                onConfirm: (value) async {},
                              );
                            },
                          );
                        },
                      ),
                    ),
                    LayoutItem(
                      title: AppLocalizations.of(context).translate("groups.planning.activity.edit.end.title"),
                      child: LayoutItemValue(
                        value: "groups.planning.activity.edit.end.title",
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return InputDialog(
                                title: AppLocalizations.of(context).translate("groups.planning.activity.edit.end.edit"),
                                label:
                                    AppLocalizations.of(context).translate("groups.planning.activity.edit.end.title"),
                                initialValue: "",
                                onConfirm: (value) async {},
                              );
                            },
                          );
                        },
                      ),
                    ),
                    LayoutItem(
                      title: AppLocalizations.of(context).translate("groups.planning.activity.edit.description.title"),
                      child: LayoutItemValue(
                        value: "groups.planning.activity.edit.description.title",
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return InputDialog(
                                title: AppLocalizations.of(context)
                                    .translate("groups.planning.activity.edit.description.edit"),
                                label: AppLocalizations.of(context)
                                    .translate("groups.planning.activity.edit.description.title"),
                                initialValue: "",
                                onConfirm: (value) async {},
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Row(
                        children: [
                          LayoutRowItem(
                            title: AppLocalizations.of(context).translate("groups.planning.activity.edit.icon.title"),
                            child: const Icon(
                              Icons.airplane_ticket,
                              size: 48,
                            ),
                            onTap: () {},
                          ),
                          LayoutRowItem(
                            title: AppLocalizations.of(context).translate("groups.planning.activity.edit.color.title"),
                            child: const CircleAvatar(
                              backgroundColor: ActivityColors.blue,
                              radius: 24,
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: LayoutItem(
                        title: AppLocalizations.of(context).translate("groups.planning.activity.edit.members.title"),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: SizedBox(
                            height: 100,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                LayoutRowItemMember(name: "Tony Heng", isSelected: true, onSelected: (value) {}),
                                LayoutRowItemMember(name: "Yanis Chaabane", isSelected: false, onSelected: (value) {}),
                                LayoutRowItemMember(name: "Yanis Chaabane", isSelected: false, onSelected: (value) {}),
                                LayoutRowItemMember(name: "Yanis Chaabane", isSelected: false, onSelected: (value) {}),
                                LayoutRowItemMember(name: "Yanis Chaabane", isSelected: false, onSelected: (value) {}),
                                LayoutRowItemMember(name: "Yanis Chaabane", isSelected: false, onSelected: (value) {}),
                                LayoutRowItemMember(name: "Yanis Chaabane", isSelected: false, onSelected: (value) {}),
                                LayoutRowItemMember(name: "Yanis Chaabane", isSelected: false, onSelected: (value) {}),
                                LayoutRowItemMember(name: "Yanis Chaabane", isSelected: false, onSelected: (value) {}),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: LayoutItem(
                        child: LayoutItemValue(
                          value: AppLocalizations.of(context).translate("groups.planning.activity.edit.delete.title"),
                          icon: Icons.close,
                          customColor: Theme.of(context).colorScheme.error,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return InputDialogChoice(
                                  title: AppLocalizations.of(context)
                                      .translate('groups.planning.activity.edit.delete.content'),
                                  cancelChoice: AppLocalizations.of(context).translate('common.decline'),
                                  confirmChoice: AppLocalizations.of(context).translate('common.accept'),
                                  onConfirm: (value) {},
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
