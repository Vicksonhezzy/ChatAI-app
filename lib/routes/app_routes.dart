import 'package:get/get.dart';
import 'package:testai/views/chat_screen.dart';

class AppRoutes {
  static const String chatScreen = '/chat';

  static List<GetPage> pages = [
    GetPage(
      name: chatScreen,
      page: () => const ChatScreen(),
    ),
  ];
}
