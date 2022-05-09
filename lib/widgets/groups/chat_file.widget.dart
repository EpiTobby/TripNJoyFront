import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:trip_n_joy_front/constants/common/default_values.dart';
import 'package:trip_n_joy_front/services/log/logger.service.dart';

class ChatFile extends StatefulWidget {
  const ChatFile({Key? key, required this.path, required this.isUser}) : super(key: key);

  final String path;
  final bool isUser;

  @override
  State<ChatFile> createState() => _ChatFileState();
}

class _ChatFileState extends State<ChatFile> {
  final ReceivePort _port = ReceivePort();

  @override
  void initState() {
    super.initState();
    IsolateNameServer.registerPortWithName(_port.sendPort, 'downloader_send_port');
    _port.listen((dynamic data) {
      String id = data[0];
      DownloadTaskStatus status = data[1];
      int progress = data[2];
      setState(() {});
    });

    FlutterDownloader.registerCallback(downloadCallback);
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }

  static void downloadCallback(String id, DownloadTaskStatus status, int progress) {
    final SendPort send = IsolateNameServer.lookupPortByName('downloader_send_port')!;
    send.send([id, status, progress]);
    if (status == DownloadTaskStatus.complete) {
      logger.d('Download complete: $id');
    } else if (status == DownloadTaskStatus.failed) {
      logger.d('Download failed: $id');
    }
  }

  void _requestDownload(String link) async {
    final status = await Permission.storage.request();

    if (status.isGranted) {
      final savedDir = (await getExternalStorageDirectory())?.path ?? '/sdcard/download/';
      final fileName = link.split('/').last.split('?').first;
      logger.d("Downloading file: $fileName - saving to: $savedDir");
      final taskId = await FlutterDownloader.enqueue(
        fileName: fileName,
        url: link,
        savedDir: savedDir,
        showNotification: true,
        openFileFromNotification: true,
      );
    } else {
      logger.w('Storage permission denied');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _requestDownload(widget.path);
      },
      child: Padding(
        padding:
            widget.isUser ? const EdgeInsets.only(right: 32, bottom: 4) : const EdgeInsets.only(left: 32, bottom: 4),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.8,
          ),
          decoration: BoxDecoration(
            color: widget.isUser ? Theme.of(context).colorScheme.secondary : Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: widget.isUser
                    ? Theme.of(context).colorScheme.secondary.withOpacity(0.4)
                    : Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
                offset: const Offset(0, 8),
                blurRadius: 14,
                spreadRadius: -6,
              ),
            ],
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.file_present,
                  color: widget.isUser
                      ? Theme.of(context).colorScheme.onSecondary
                      : Theme.of(context).colorScheme.onSurface,
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.path.split("$MINIO_BUCKET/").last,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      color: widget.isUser
                          ? Theme.of(context).colorScheme.onSecondary
                          : Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
