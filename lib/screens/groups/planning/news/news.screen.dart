import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/app_localizations.dart';
import 'package:trip_n_joy_front/models/api/news_article.model.dart';
import 'package:trip_n_joy_front/providers/api/news.provider.dart';
import 'package:trip_n_joy_front/providers/groups/group.provider.dart';
import 'package:trip_n_joy_front/widgets/common/async_value.widget.dart';
import 'package:trip_n_joy_front/widgets/groups/planning/news/news_tile.widget.dart';

class NewsList extends HookConsumerWidget {
  const NewsList({Key? key, required this.groupId}) : super(key: key);

  final int groupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupViewModel = ref.watch(groupProvider);
    final group = groupViewModel.groups.firstWhere((group) => group.id == groupId);

    final newsViewModel = ref.watch(newsProvider);
    final news = newsViewModel.news;

    useEffect(() {
      if (group.destination != null) {
        Future.microtask(() => ref.read(newsProvider).getNews(group.destination!));
      }
      return null;
    }, [group.destination]);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('groups.planning.news.title')),
        foregroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        elevation: 0,
      ),
      body: AsyncValueWidget<List<NewsArticle>>(
        value: news,
        data: (data) => SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 16),
            child: ListView.builder(
              itemCount: data.length,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                return NewsTile(
                  imgUrl: data[index].urlToImage,
                  title: data[index].title,
                  desc: data[index].description,
                  content: data[index].content,
                  postUrl: data[index].articleUrl,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
