import 'package:get/get.dart';


class AppStore {
  RxBool isLoading = false.obs;

  void setIsLoading(bool value) {
    isLoading.value = value;
  }
}
