import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_n_joy_front/services/api/codegen.service.dart';

final codegenProvider = Provider((ref) => CodegenService(const FlutterSecureStorage()));
//final codegenProvider = Provider((ref) => MockService());
