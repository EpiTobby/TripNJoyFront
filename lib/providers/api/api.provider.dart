import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/services/api/codegen.service.dart';
import 'package:trip_n_joy_front/services/api/mock.service.dart';

const isMock = String.fromEnvironment("MOCK", defaultValue: "false");

final apiProvider =
    isMock == "true" ? Provider((_) => MockService()) : Provider((_) => CodegenService(const FlutterSecureStorage()));
