import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:testai/presentation/chat_page/models/chat_model.dart';

import '../core/app_export.dart';

class ReceivedMesssge extends StatelessWidget {
  ChatModel model;
  ReceivedMesssge({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
            clipBehavior: Clip.antiAlias,
            elevation: 0,
            margin: getMargin(left: 8, top: 10),
            color: ColorConstant.whiteA700,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusStyle.customBorderBL15),
            child: Container(
                // height: getVerticalSize(57.00),
                width: getHorizontalSize(kIsWeb ? 100 : 253.00),
                padding: getPadding(left: 13, top: 6, right: 13, bottom: 6),
                decoration: AppDecoration.fillWhiteA700
                    .copyWith(borderRadius: BorderRadiusStyle.customBorderBL15),
                child: Stack(alignment: Alignment.bottomRight, children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                          width: getHorizontalSize(209.00),
                          child: Text(model.message!.tr,
                              maxLines: null,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterRegular15))),
                  CustomImageView(
                      svgPath: ImageConstant.imgCamera,
                      height: getVerticalSize(13.00),
                      width: getHorizontalSize(15.00),
                      alignment: Alignment.bottomRight,
                      onTap: () {
                        // onTapImgCamera();
                      }),
                ]))),
        Padding(
            padding: getPadding(left: 17, top: 9),
            child: Text(dateFormatter(model.time!).tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtInterRegular12)),
      ],
    );
  }
}

class SentMessage extends StatelessWidget {
  ChatModel model;
  SentMessage({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topRight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: getHorizontalSize(kIsWeb ? 100 : 209.00),
              margin: getMargin(top: 14),
              child: Container(
                  alignment: Alignment.topRight,
                  padding: getPadding(left: 4, top: 10, right: 4, bottom: 10),
                  decoration: AppDecoration.fillIndigoA700.copyWith(
                      borderRadius: BorderRadiusStyle.customBorderTL15),
                  child: Container(
                      // width: getHorizontalSize(208.00),
                      margin: getMargin(top: 1),
                      child: Text(model.message!.tr,
                          maxLines: null,
                          textAlign: TextAlign.right,
                          style: AppStyle.txtInterRegular15WhiteA700))),
            ),
            // Padding(
            //     padding: getPadding(left: 17, top: 9),
            //     child: Text(dateFormatter(model.time!).tr,
            //         overflow: TextOverflow.ellipsis,
            //         textAlign: TextAlign.left,
            //         style: AppStyle.txtInterRegular12)),
          ],
        ));
  }
}

// class ChatAudioPlayer extends StatefulWidget {
//   final String audioUrl;

//   ChatAudioPlayer({Key? key, required this.audioUrl}) : super(key: key);

//   @override
//   _ChatAudioPlayerState createState() => _ChatAudioPlayerState();
// }

// class _ChatAudioPlayerState extends State<ChatAudioPlayer> {
//   AudioPlayer _audioPlayer = AudioPlayer();
//   bool _isPlaying = false;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(8.0),
//       child: Row(
//         children: [
//           IconButton(
//             icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
//             onPressed: () async {
//               if (_isPlaying) {
//                 await _audioPlayer.pause();
//               } else {
//                 await _audioPlayer.play(widget.audioUrl);
//               }
//               setState(() {
//                 _isPlaying = !_isPlaying;
//               });
//             },
//           ),
//           Text('Audio'),
//         ],
//       ),
//     );
//   }
// }

class MessageTile extends StatelessWidget {
  final ChatModel model;

  const MessageTile({required this.model});

  @override
  Widget build(BuildContext context) {
    // File fileImage = image != null ? File(image) : null;
    return Container(
      alignment: model.sentByMe! ? Alignment.centerRight : Alignment.centerLeft,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(
          top: 8,
          bottom: 8,
          left: model.sentByMe! ? 100 : 0,
          right: model.sentByMe! ? 0 : 100),
      padding: model.sentByMe!
          ? getPadding(left: 4, top: 10, right: 4, bottom: 10)
          : getPadding(left: 13, top: 6, right: 13, bottom: 6),
      child: Column(
        crossAxisAlignment:
            model.sentByMe! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            decoration: model.sentByMe!
                ? AppDecoration.fillIndigoA700
                    .copyWith(borderRadius: BorderRadiusStyle.customBorderTL15)
                : AppDecoration.fillWhiteA700
                    .copyWith(borderRadius: BorderRadiusStyle.sentRadius),
            padding: EdgeInsets.all(8),
            child: Text(
              model.message!,
              style: model.sentByMe!
                  ? AppStyle.txtInterRegular15WhiteA700
                  : AppStyle.txtInterRegular15,
            ),
          ),
          if (!model.sentByMe!)
            Padding(
              padding: getPadding(top: 9),
              child: Text(dateFormatter(model.time!).tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtInterRegular12),
            ),
        ],
      ),
    );
  }
}
