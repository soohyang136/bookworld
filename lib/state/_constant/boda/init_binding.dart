import 'package:boda/state/_constant/boda/boda_getx.dart';
import 'package:boda/state/auth/auth_getx.dart';
import 'package:boda/state/home/main_getx.dart';
import 'package:get/get.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    // getx controller 등록
    Get.put(AuthGetx());
    Get.put(BodaGetx()..bodaAppVesionCheck());
    Get.put(MainGetx());
  }
}