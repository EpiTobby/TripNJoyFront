import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/services/api/dio.service.dart';

final dioProvider = Provider((ref) => HttpService());
