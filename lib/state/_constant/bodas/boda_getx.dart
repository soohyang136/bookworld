import 'package:get/get.dart';

class BodaGetx extends GetxController {
  static BodaGetx get to => Get.find();
  bool isVersionChecking = false;

  Future boolAppVersionCheck() async {
    isVersionChecking = true;
    update();
  }
}