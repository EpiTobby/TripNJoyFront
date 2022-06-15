import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:minio/minio.dart';
import 'package:trip_n_joy_front/constants/common/default_values.dart';
import 'package:trip_n_joy_front/services/log/logger.service.dart';

class MinioService {
  MinioService();

  Future<String> upload(String name, Stream<Uint8List> bytes) async {
    final minio = Minio(
        endPoint: MINIO_ENDPOINT,
        accessKey: MINIO_ACCESS_KEY,
        secretKey: MINIO_SECRET_KEY,
        useSSL: false,
        port: MINIO_PORT);

    await minio.putObject(MINIO_BUCKET, name, bytes);

    return (await minio.presignedGetObject(MINIO_BUCKET, name)).split('?')[0];
  }

  Future<String?> uploadImage({bool gallery = true}) async {
    var pickedFile = await ImagePicker().pickImage(
      source: gallery ? ImageSource.gallery : ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    if (pickedFile == null) {
      return null;
    }

    var imageBytes = pickedFile.readAsBytes().asStream();

    var imageURL = await upload(pickedFile.name, imageBytes);
    logger.d(imageURL.split('$MINIO_ENDPOINT:$MINIO_PORT/$MINIO_BUCKET/').last);
    return imageURL.split('$MINIO_ENDPOINT:$MINIO_PORT/$MINIO_BUCKET/').last;
  }

  static String? getImageUrl(String? name) {
    if (name == null) {
      return null;
    }
    return 'http://$MINIO_ENDPOINT:$MINIO_PORT/$MINIO_BUCKET/$name';
  }
}
