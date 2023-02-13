// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:testai/core/app_export.dart';
import 'package:testai/presentation/chat_page/chat_screen.dart';
import 'package:testai/presentation/chat_page/controller/chat_controller.dart';

class ChatMainScreen extends GetWidget<ChatController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChatScreen(),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width / 6.5,
      padding: getPadding(top: 10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: getMargin(left: 3, bottom: 30),
              child: Text('Recent Chats', style: AppStyle.txtInterBold15)),
          ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  RecentChatBuilder(),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class RecentChatBuilder extends StatefulWidget {
  const RecentChatBuilder({Key? key}) : super(key: key);

  @override
  State<RecentChatBuilder> createState() => _RecentChatBuilderState();
}

class _RecentChatBuilderState extends State<RecentChatBuilder> {
  FocusNode focusNode = FocusNode();
  bool showDropDown = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        onPressed: () {
          setState(() {
            focusNode.requestFocus();
            showDropDown = !showDropDown;
          });
        },
        focusNode: focusNode,
        focusColor: Colors.white70,
        child: Stack(
          children: [
            Column(
              children: [
                ListTile(
                  trailing: focusNode.hasFocus
                      ? const Icon(Icons.keyboard_arrow_down)
                      : null,
                  title: Text(
                      'Clause for renters best interest for a  rental property',
                      style: AppStyle.txtInterMedium878.copyWith(
                          fontWeight: FontWeight.w500, color: Colors.black)),
                ),
                Divider(color: Colors.grey.shade200)
              ],
            ),
            if (showDropDown && focusNode.hasFocus)
              Positioned(
                  right: 5,
                  top: 10,
                  child: Container(
                    color: Colors.white,
                    width: getHorizontalSize(30),
                    padding: getPadding(top: 3, bottom: 10, left: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.edit_note,
                                size: 12,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Edit Tile',
                                  style: AppStyle.txtInterMedium878.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontSize: 10),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // SizedBox(height: 10),
                        Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.delete_forever,
                                color: Colors.red,
                                size: 12,
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Delete Tile',
                                    style: AppStyle.txtInterMedium878.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.red,
                                        fontSize: 10),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ))
          ],
        ),
      ),
    );
  }
}
