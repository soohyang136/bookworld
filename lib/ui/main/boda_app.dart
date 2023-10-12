import 'package:boda/state/_constant/boda/boda_getx.dart';
import 'package:boda/state/auth/auth_getx.dart';
import 'package:boda/ui/auth/sign_up/sign_up_name.dart';
import 'package:boda/ui/main/boda_main.dart';
import 'package:boda/ui/splash/boda_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BodaApp extends StatelessWidget {
  const BodaApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return GetBuilder<BodaGetx>(
      builder: (boda) {
        // 버전 체크
        if (boda.isVersionChecking) {
          // 스플래쉬 스크린
          return const BodaSpalshScreen();
        } else {
          // 로그인 체크
          return GetBuilder<AuthGetx>(
            builder: (x) {
              // 스플래쉬
              if (x.isSplash) {
                return const BodaSpalshScreen();
              } else {
          
                  return const SignUpName();
                
              }
            },
          );
        }
      },
    );
  }
}
