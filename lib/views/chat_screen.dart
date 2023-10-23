import 'package:social_media_recorder/audio_encoder_type.dart';
import 'package:social_media_recorder/screen/social_media_recorder.dart';
import 'package:testai/views/widgets/settings/settings.dart';
import 'package:testai/views/widgets/chat_appbar.dart';
import 'package:testai/views/widgets/chat_text_field.dart';
import 'package:testai/views/widgets/conversation_widget.dart';

import 'package:flutter/material.dart';
import 'package:testai/core/app_export.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    DevicePlatform platform = getPlatform(size.width);
    // bool isMobile = size.width <= 600;
    final textTheme = Theme.of(context).textTheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
        // backgroundColor: ColorConstant.gray100,
        body: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: !(platform == DevicePlatform.mobile)
              ? size.width / 1.3
              : size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ChatAppBar(),
              Expanded(
                child: Container(
                  padding: getPadding(
                    left: 13,
                    top: 10,
                    right: 13,
                    bottom: 16,
                  ),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              padding: getPadding(
                                left: 10,
                                top: 8,
                                right: 10,
                                bottom: 8,
                              ),
                              decoration:
                                  AppDecoration.txtFillBluegray100.copyWith(
                                borderRadius:
                                    BorderRadiusStyle.txtRoundedBorder8,
                              ),
                              child: Text(
                                "This chat is end to end chat encrypted".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: textTheme.labelSmall!
                                    .copyWith(color: Colors.black),
                              ),
                            ),
                          ),
                          const ConverstaionWidget(),
                        ],
                      ),
                      const ChatTextField(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        if (!(platform == DevicePlatform.mobile))
          Row(
            children: [
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
              const SettingsScreen(),
            ],
          ),
      ],
    ));
  }

  Widget audioRecorder() {
    return SocialMediaRecorder(
      backGroundColor: Colors.transparent,
      recordIcon: CustomImageView(svgPath: ImageConstant.imgMicrophone),
      radius: BorderRadius.circular(10),
      // lockButton: Icon(
      //   Icons.lock,
      //   size: 10,
      // ),
      sendRequestFunction: (soundFile) {},
      encode: AudioEncoderType.AAC,
    );
  }

  // Widget voiceMessage(){
  //   return Container(
  //     child: VoiceMessage(audioSrc: audioSrc, me: me),
  //   );
  // }

  onTapImgCamera() async {
    await PermissionManager.askForPermission(Permission.camera);
    await PermissionManager.askForPermission(Permission.storage);
    List<String?> imageList = [];
    await FileManager().showModelSheetForImage(getImages: (value) async {
      imageList = value;
    });
  }
}
