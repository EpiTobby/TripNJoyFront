import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:minio/minio.dart';
import 'package:trip_n_joy_front/constants/common/default_values.dart';

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

    return await minio.presignedGetObject(MINIO_BUCKET, name);
  }

  Future<String?> uploadImage() async {
    var pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    if (pickedFile == null) {
      return null;
    }

    var imageBytes = pickedFile.readAsBytes().asStream();

    return await upload(pickedFile.name, imageBytes);
  }
}
