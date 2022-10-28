import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/providers/api/api.provider.dart';
import 'package:trip_n_joy_front/viewmodels/api/news.viewmodel.dart';

final newsProvider = ChangeNotifierProvider((ref) {
  final httpService = ref.watch(apiProvider);

  return NewsViewModel(httpService);
});
