import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';

Future<String> writeByteToImageFile(Uint8List data) async {
  var dir = Platform.isAndroid ? await getExternalStorageDirectory() : await getApplicationDocumentsDirectory();
  File imageFile = File("${dir?.path}/flutter/${DateTime.now().millisecondsSinceEpoch}.png");
  imageFile.createSync(recursive: true);
  imageFile.writeAsBytesSync(data);
  return imageFile.path;
}
