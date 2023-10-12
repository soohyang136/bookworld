import 'package:boda/state/auth/auth_getx.dart';
import 'package:get/get.dart';

class BodaGetx extends GetxController {
  static BodaGetx get to => Get.find();
  bool isVersionChecking = false;

  Future bodaAppVesionCheck() async {
    isVersionChecking = true;
    update();
    Future.delayed(
      const Duration(
        milliseconds: 1000,
      ),
      () {
        isVersionChecking = false;
        update();
      },
    );
    await AuthGetx.to.autoSignInNameCheck();
  }
}
