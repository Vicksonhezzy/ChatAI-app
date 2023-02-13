class ChatModel {
  String? message;
  String? time;
  // bool? isAudio;
  String? id;
  bool? sentByMe;

  ChatModel({this.id, this.message, this.sentByMe, this.time});

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json['_id'].toString(),
      message: json['message'].toString(),
      sentByMe: json['sentByMe'],
      time: json['time'],
      // isAudio: json['isAudio'],
    );
  }
}
