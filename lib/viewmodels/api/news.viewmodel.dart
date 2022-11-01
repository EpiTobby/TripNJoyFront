import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/models/api/news_article.model.dart';
import 'package:trip_n_joy_front/services/api/http.service.dart';

class NewsViewModel extends ChangeNotifier {
  NewsViewModel(this.httpService);

  final HttpService httpService;

  AsyncValue<List<NewsArticle>> news = const AsyncValue.loading();

  void getNews(String destination) async {
    news = const AsyncValue.loading();
    notifyListeners();

    var response = await httpService.getNews(destination);

    news = response != null ? AsyncValue.data(response) : const AsyncValue.error('Failed to get news');
    notifyListeners();
  }
}
