import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:trip_n_joy_front/models/group/article.dart';
import 'package:trip_n_joy_front/widgets/groups/budget/input_dialog_article.widget.dart';

class BudgetReceiptArticle extends StatelessWidget {
  const BudgetReceiptArticle({
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
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  article.name,
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: Text(
                  '${article.price}€',
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),
                  textAlign: TextAlign.end,
                ),
              ),
              IconButton(
                icon: Icon(Icons.edit, color: Theme.of(context).colorScheme.secondary),
                onPressed: () {
                  showBarModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return InputDialogArticle(
                        groupId: groupId,
                        article: article,
                        onEdit: onEdit,
                        onDelete: onDelete,
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
