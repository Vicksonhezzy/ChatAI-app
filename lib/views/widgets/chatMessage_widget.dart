// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:testai/views/models/chat_model.dart';

import '../../core/app_export.dart';

class MessageTile extends StatelessWidget {
  final ChatModel model;

  const MessageTile({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      alignment: model.sentByMe! ? Alignment.centerRight : Alignment.centerLeft,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(
          top: 8,
          bottom: 8,
          left: model.sentByMe! ? 100 : 0,
          right: model.sentByMe! ? 0 : 100),
      padding: getPadding(left: 5, top: 6, right: 5, bottom: 6),
      child: Column(
        crossAxisAlignment:
            model.sentByMe! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            decoration: model.sentByMe!
                ? AppDecoration.fillIndigoA700
                    .copyWith(borderRadius: BorderRadiusStyle.customBorderTL15)
                : AppDecoration.fillWhiteA700.copyWith(
                    borderRadius: BorderRadiusStyle.sentRadius,
                    color: isDark ? Colors.white70 : null),
            padding: const EdgeInsets.all(8),
            child: SelectableText(
              model.message!,
              style: model.sentByMe!
                  ? textTheme.bodyMedium!.copyWith(color: Colors.white)
                  : textTheme.bodyMedium!
                      .copyWith(color: isDark ? Colors.black : Colors.black45),
            ),
          ),
          // if (!model.sentByMe!)
          Padding(
            padding: getPadding(top: 9),
            child: Text(
              dateFormatter(model.time!).tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: textTheme.bodySmall!
                  .copyWith(color: ColorConstant.blueGray10001),
            ),
          ),
        ],
      ),
    );
  }
}
