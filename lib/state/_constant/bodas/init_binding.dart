import 'package:boda/state/_constant/bodas/boda_getx.dart';
import 'package:get/get.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(BodaGetx()..boolAppVersionCheck());
  }
}