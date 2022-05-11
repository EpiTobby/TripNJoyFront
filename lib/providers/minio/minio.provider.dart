import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/services/minio/minio.service.dart';

final minioProvider = Provider<MinioService>((_) => MinioService());
