import 'package:testai/core/app_export.dart';
import 'package:testai/controller/chat_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PrefUtils());
    Connectivity connectivity = Connectivity();
    Get.put(NetworkInfo(connectivity));
    Get.lazyPut(() => ChatController());
  }
}
