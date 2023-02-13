import 'package:testai/presentation/chat_page/binding/chat_binding.dart';
import 'package:testai/presentation/chat_page/chat_main_screen.dart';
import 'package:get/get.dart';
import 'package:testai/presentation/chat_page/chat_screen.dart';

class AppRoutes {
  static const String iphone14OneScreen = '/iphone_14_one_screen';

  static String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: iphone14OneScreen,
      page: () => ChatScreen(),
      bindings: [
        ChatBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => ChatMainScreen(),
      bindings: [
        ChatBinding(),
      ],
    )
  ];
}
