import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:testai/views/models/chat_model.dart';
import 'package:testai/views/widgets/chatMessage_widget.dart';
import 'package:testai/controller/chat_controller.dart';

import '../../core/app_export.dart';

class ConverstaionWidget extends StatelessWidget {
  const ConverstaionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    final controller = ChatController.instance;
    return Container(
      height: size.height / 1.31,
      margin: getMargin(bottom: size.height / 200),
      child: Obx(
        () => Column(
          children: [
            if (controller.fetchingChats.value)
              const Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                ),
              ),
            Flexible(
              child: ListView(
                reverse: true,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                controller: controller.listScrollController,
                children: UnmodifiableListView(controller
                    .chatList.value.reversed
                    .map((e) => MessageTile(model: ChatModel.fromJson(e)))
                    .toList()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
