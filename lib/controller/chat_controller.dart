import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:testai/core/app_export.dart';
import 'package:testai/core/network/apiCalls.dart';

import 'package:record/record.dart';
import 'package:testai/views/models/chat_model.dart';

class ChatController extends GetxController {
  static final ChatController instance = Get.find();

  TextEditingController textController = TextEditingController();
  Rx<bool> isLoading = false.obs;

  late Timer timer;

  ScrollController listScrollController = ScrollController();

  Rx<List> chatList = Rx<List>([]);

  Rx<bool> fetchingChats = true.obs;

  @override
  void onInit() {
    super.onInit();
    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      loadStreams();
    });
  }

  loadStreams() {
    fetchChatSream().listen((event) {
      chatList.value = event;
      fetchingChats.value = false;
    });
  }

  onSend() async {
    if (textController.text.isNotEmpty && !isLoading.value) {
      isLoading.value = true;
      await postRequest(
          url: 'sendMessage', body: {'message': textController.text});
      textController = TextEditingController();
      isLoading.value = false;
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
      Directory directory0 = await directory.create(recursive: true);
      directory0 = filePath;
      return directory0;
    } catch (e) {
      return null;
    }
  }

  onRecord() async {
    if (isRecording) {
      await record.stop();
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
      update();
    }
  }

  // final channel =
  //     WebSocketChannel.connect(Uri.parse('${webSocketBaseUrl}getMessages'));

  // void streamMessages() {
  //   channel.stream.listen((data) {
  //     print('Received: $data');
  //     chats.value = (json.decode(data.toString()) as List)
  //         .map((e) => ChatModel.fromJson(e))
  //         .toList();
  //   }, onDone: () {
  //     print('WebSocket connection is closed.');
  //   }, onError: (error) {
  //     print('Error: $error');
  //   });
  // }

  Stream fetchChatSream() {
    return Stream.fromFuture(getRequest(url: 'getMessages'))
        .asyncMap((event) => event);
  }
}
