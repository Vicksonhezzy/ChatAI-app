import 'package:flutter/material.dart';
import 'package:testai/controller/chat_controller.dart';
import 'package:testai/widgets/custom_icon_button.dart';

import '../../core/app_export.dart';

class ChatTextField extends StatelessWidget {
  const ChatTextField({super.key});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    DevicePlatform platform = getPlatform(size.width);
    final controller = Get.put(ChatController());
    final textTheme = Theme.of(context).textTheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: getPadding(
          top: 10,
          right: 4,
          bottom: 6,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                width: !(platform == DevicePlatform.mobile)
                    ? size.width / 1.9
                    : null,
                margin: getMargin(right: 10),
                decoration: AppDecoration.fillWhiteA700.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder10,
                  color: isDark ? Colors.white70 : null,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: IntrinsicHeight(
                        child: Container(
                          padding: getPadding(bottom: 1, top: 1),
                          child: Center(
                            child: Obx(
                              () => TextField(
                                enabled: controller.isRecording == false,
                                maxLines: 7,
                                minLines: 1,
                                controller: controller.isLoading.value
                                    ? null
                                    : controller.textController,
                                decoration: InputDecoration(
                                  hintText: 'Message',
                                  hintStyle: textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: isDark
                                        ? Colors.black54
                                        : ColorConstant.gray50001,
                                  ),
                                  contentPadding: getPadding(left: 8, right: 5),
                                  border: InputBorder.none,
                                ),
                                textAlign: TextAlign.left,
                                style: textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: isDark ? Colors.black : Colors.black54,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // audioRecorder(),
            CustomIconButton(
              height: size.height / 14,
              width: size.height / 14,
              onTap: () => controller.onSend(),
              margin: getMargin(bottom: 2),
              child: Icon(
                Icons.send,
                size: getSize(30),
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
