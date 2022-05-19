import 'package:character/screen/controller/home_controller.dart';
import 'package:get/get.dart';


class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    // Get.put(SavedController());
  }
}
