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

    var imageURL = await upload(pickedFile.name, imageBytes);
    logger.d(imageURL.split('$MINIO_ENDPOINT:$MINIO_PORT/$MINIO_BUCKET/').last);
    return imageURL.split('$MINIO_ENDPOINT:$MINIO_PORT/$MINIO_BUCKET/').last;
  }

  static String getImageUrl(String? name, DEFAULT_URL defaultUrl) {
    if (name == null) {
      if (defaultUrl == DEFAULT_URL.AVATAR) {
        return DEFAULT_AVATAR_URL;
      } else if (defaultUrl == DEFAULT_URL.GROUP) {
        return DEFAULT_GROUP_AVATAR_URL;
      } else{
        return DEFAULT_IMAGE_URL;
      }
    }

    final uri = Uri.tryParse(name);
    if (uri != null && uri.host.isNotEmpty && uri.origin.isNotEmpty){
      return name;
    }

    return 'http://$MINIO_ENDPOINT:$MINIO_PORT/$MINIO_BUCKET/$name';
  }
}
