import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:social_media_recorder/audio_encoder_type.dart';
import 'package:social_media_recorder/screen/social_media_recorder.dart';
import 'package:testai/presentation/chatMessage_widget.dart';
import 'package:testai/presentation/chat_page/chat_main_screen.dart';
import 'package:testai/presentation/chat_page/models/chat_model.dart';

import 'controller/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:testai/core/app_export.dart';
import 'package:testai/widgets/app_bar/custom_app_bar.dart';
import 'package:testai/widgets/custom_icon_button.dart';

class ChatScreen extends GetWidget<ChatController> {
  Widget drawer() {
    return Container(
        height: getVerticalSize(2.00),
        width: getHorizontalSize(30.00),
        margin: getMargin(top: 2, bottom: 2),
        decoration: BoxDecoration(color: ColorConstant.gray500));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
        init: ChatController(),
        builder: (controller) {
          return Scaffold(
              backgroundColor: ColorConstant.gray100,
              // appBar: CustomAppBar(
              //     height: getVerticalSize(70.00),
              //     title: Padding(
              //         padding: getPadding(left: 30, top: 10, bottom: 10),
              //         child: Column(
              //             mainAxisAlignment: MainAxisAlignment.start,
              //             children: [
              //               Row(children: [
              //                 Column(
              //                   children: [
              //                     drawer(),
              //                     drawer(),
              //                     drawer(),
              //                   ],
              //                 ),
              //                 Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     Padding(
              //                         padding: getPadding(left: 25),
              //                         child: Text("lbl_real_assist_ai".tr,
              //                             overflow: TextOverflow.ellipsis,
              //                             textAlign: TextAlign.left,
              //                             style: AppStyle.txtInterBold15)),
              //                     Padding(
              //                         padding: getPadding(left: 25),
              //                         child: Text("msg_this_is_private".tr,
              //                             overflow: TextOverflow.ellipsis,
              //                             textAlign: TextAlign.left,
              //                             style: AppStyle.txtInterMedium878))
              //                   ],
              //                 )
              //               ]),
              //             ])),
              //     actions: [
              //       Stack(
              //         children: [
              //           CustomImageView(
              //               svgPath: ImageConstant.imgFile,
              //               height: getSize(29.00),
              //               width: getSize(29.00),
              //               margin: getMargin(top: 21, right: 29, bottom: 25)),
              //         ],
              //       )
              //     ],
              //     styleType: Style.bgFillWhiteA700),
              body: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: kIsWeb ? size.width / 1.6 : size.width,
                    padding: kIsWeb
                        ? null
                        : getPadding(left: 13, top: 10, right: 13, bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: getVerticalSize(70.00),
                          decoration: BoxDecoration(
                            color: ColorConstant.whiteA700,
                          ),
                          child: Padding(
                            padding: getPadding(left: 10, top: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width:
                                          kIsWeb ? getHorizontalSize(5) : null,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          drawer(),
                                          drawer(),
                                          drawer(),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          kIsWeb ? getMargin(right: 50) : null,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding: getPadding(left: 15),
                                              child: Text(
                                                  "lbl_real_assist_ai".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      AppStyle.txtInterBold15)),
                                          Padding(
                                              padding: getPadding(left: 15),
                                              child: Text(
                                                  "msg_this_is_private".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtInterMedium878))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                if (!kIsWeb)
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: CustomImageView(
                                        svgPath: ImageConstant.imgFile,
                                        height: getSize(29.00),
                                        width: getSize(29.00),
                                        margin: getMargin(
                                          top: 10,
                                          right: 29,
                                        )),
                                  )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            // width: size.width,
                            padding: getPadding(
                                left: 13, top: 10, right: 13, bottom: 16),
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Align(
                                          alignment: Alignment.topCenter,
                                          child: Container(
                                              // width: getHorizontalSize(181.00),
                                              // height: getVerticalSize(30),
                                              padding: getPadding(
                                                  left: 10,
                                                  top: 8,
                                                  right: 10,
                                                  bottom: 8),
                                              decoration: AppDecoration
                                                  .txtFillBluegray100
                                                  .copyWith(
                                                      borderRadius:
                                                          BorderRadiusStyle
                                                              .txtRoundedBorder8),
                                              child: Text(
                                                  "msg_this_chat_is_end".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                  style: AppStyle
                                                      .txtInterRegular932))),
                                      Container(
                                        margin: getMargin(bottom: 50),
                                        child: chatMessageBuilder(controller),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                        padding: getPadding(
                                            // left: 15,
                                            top: 10,
                                            right: 4,
                                            bottom: 6),
                                        child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: getHorizontalSize(170),
                                                padding: getPadding(
                                                    left: 5,
                                                    // top: 12,
                                                    right: 10,
                                                    bottom: 12),
                                                decoration: AppDecoration
                                                    .fillWhiteA700
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        height:
                                                            getVerticalSize(30),
                                                        padding: getPadding(
                                                            bottom: 3),
                                                        child: Center(
                                                          child: TextField(
                                                            enabled: controller
                                                                    .isRecording ==
                                                                false,
                                                            maxLines: 2,
                                                            controller: controller
                                                                    .isLoading
                                                                ? null
                                                                : controller
                                                                    .textController,
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  'Message',
                                                              hintStyle: AppStyle
                                                                  .txtInterMedium15,
                                                              contentPadding:
                                                                  getPadding(
                                                                      left: 8,
                                                                      right: 8),
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtInterMedium15
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                        padding:
                                                            getPadding(top: 4),
                                                        child: Text("lbl".tr,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtInterMedium24))
                                                  ],
                                                ),
                                              ),
                                              // audioRecorder(),
                                              Container(
                                                margin: kIsWeb
                                                    ? getMargin(left: 10)
                                                    : null,
                                                child: CustomIconButton(
                                                  height: 61,
                                                  width: 61,
                                                  onTap: () =>
                                                      controller.onSend(),
                                                  margin: getMargin(bottom: 2),
                                                  child: controller
                                                          .textController
                                                          .text
                                                          .isNotEmpty
                                                      ? Icon(
                                                          Icons.send,
                                                          size: getSize(30),
                                                          color: Colors.white,
                                                        )
                                                      : CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgMicrophone),
                                                ),
                                              )
                                            ])))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: Colors.white60,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  if (kIsWeb) SettingsScreen(),
                ],
              ));
        });
  }

  Widget audioRecorder() {
    return Container(
      // width: getHorizontalSize(20),
      // height: getVerticalSize(15),
      child: SocialMediaRecorder(
        backGroundColor: Colors.transparent,
        recordIcon: CustomImageView(svgPath: ImageConstant.imgMicrophone),
        radius: BorderRadius.circular(10),
        // lockButton: Icon(
        //   Icons.lock,
        //   size: 10,
        // ),
        sendRequestFunction: (soundFile) {},
        encode: AudioEncoderType.AAC,
      ),
    );
  }

  Widget chatMessageBuilder(ChatController controller) {
    return StreamBuilder<List<ChatModel>>(
        stream: controller.fetchChatSream(),
        builder: (context, AsyncSnapshot<List<ChatModel>> snapshot) {
          return Container(
            height: size.height - getVerticalSize(200),
            child: Column(
              children: [
                // if (snapshot.connectionState == ConnectionState.waiting &&
                //     snapshot.data == null)
                //   Center(child: CircularProgressIndicator()),
                if (snapshot.hasData)
                  Flexible(
                      child: ListView(
                    reverse: true,
                    shrinkWrap: true,
                    controller: controller.listScrollController,
                    children: UnmodifiableListView(snapshot.data!.reversed
                        .map((e) => MessageTile(model: e))
                        .toList()),
                  )),
                // Container(
                //   child: ListView.builder(
                //       controller: controller.listScrollController,
                //       addAutomaticKeepAlives: true,
                //       addRepaintBoundaries: true,
                //       addSemanticIndexes: true,
                //       shrinkWrap: true,
                //       itemCount: snapshot.data!.length,
                //       physics: NeverScrollableScrollPhysics(),
                //       itemBuilder: (context, index) {
                //         controller.dataLength = snapshot.data!.length;
                //         ChatModel model = snapshot.data![index];
                //         return model.sentByMe!
                //             ? SentMessage(model: model)
                //             : ReceivedMesssge(model: model);
                //       }),
                // ),
              ],
            ),
          );
        });
  }

  // Widget voiceMessage(){
  //   return Container(
  //     child: VoiceMessage(audioSrc: audioSrc, me: me),
  //   );
  // }

  onTapImgCamera() async {
    await PermissionManager.askForPermission(Permission.camera);
    await PermissionManager.askForPermission(Permission.storage);
    List<String?>? imageList = [];
    await FileManager().showModelSheetForImage(getImages: (value) async {
      imageList = value;
    });
  }

  onTapImgCameraOne() async {
    await PermissionManager.askForPermission(Permission.camera);
    await PermissionManager.askForPermission(Permission.storage);
    List<String?>? imageList = [];
    await FileManager().showModelSheetForImage(getImages: (value) async {
      imageList = value;
    });
  }
}
