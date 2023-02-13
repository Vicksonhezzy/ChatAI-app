import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:testai/core/app_export.dart';
import 'package:testai/core/network/apiCalls.dart';

import 'package:record/record.dart';
import 'package:testai/presentation/chat_page/models/chat_model.dart';

class ChatController extends GetxController {
  Rx<ChatModel> iphone14OneModelObj = ChatModel().obs;
  TextEditingController textController = TextEditingController();
  int dataLength = 0;
  bool isLoading = false;

  late Timer timer;

  ScrollController listScrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      // if (!loaded && listScrollController.hasClients && dataLength != 0) {
      //   final position = listScrollController.position.maxScrollExtent;
      //   listScrollController.jumpTo(position);
      //   listScrollController.animateTo(position,
      //       duration: Duration(seconds: 3), curve: Curves.easeOut);
      //   loaded = true;
      //   print('started');
      // }
      update();
    });
  }

  @override
  void onClose() {
    super.onClose();
    timer.cancel();
  }

  onSend() async {
    if (textController.text.isNotEmpty && !isLoading) {
      isLoading = true;
      update();
      await postRequest(
          url: 'sendMessage', body: {'message': textController.text});
      textController = TextEditingController();
      isLoading = false;
      update();
    }
  }

  bool isRecording = false;
  final record = Record();

  late Directory filePath;

  Future<Directory?> createDirectory(String path) async {
    final directory = Directory(path);

    if (await directory.exists()) {
      filePath = directory;
      return directory;
    }

    try {
      Directory _directory = await directory.create(recursive: true);
      _directory = filePath;
      return _directory;
    } catch (e) {
      print(e);
      return null;
    }
  }

  onRecord() async {
    if (isRecording) {
      await record.stop();
      print('stoped');
      update();
    } else {
      if (await record.hasPermission()) {
        Directory? dir = await createDirectory('testAI_audio');
        await record.start(
          path: dir!.path,
          encoder: AudioEncoder.AAC,
          bitRate: 128000,
          samplingRate: 44100,
        );
      }

      isRecording = await record.isRecording();
      print('started');
      update();
    }
  }

  Stream<List<ChatModel>> fetchChatSream() {
    return Stream.fromFuture(getRequest(url: 'getMessages')).asyncMap(
        (event) => (event as List).map((e) => ChatModel.fromJson(e)).toList());
  }
}
