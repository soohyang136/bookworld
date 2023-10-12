import 'package:boda/state/_constant/boda/init_binding.dart';
import 'package:boda/ui/_constant/theme/app_scroll_behavior.dart';
import 'package:boda/ui/router/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  runApp(const Boda());
}

class Boda extends StatelessWidget {
  const Boda({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) {
        // 스테이터스바 색상 변경
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
        return ScrollConfiguration(
          // 스크롤 효과 : 디폴트 스크롤 효과 제거
          behavior: AppScrollBehavior(),
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: child ?? const SizedBox(),
          ),
        );
      },
      theme: ThemeData(
        appBarTheme: const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.dark),
        fontFamily: 'SpoqaHanSansNeoR',
        primaryColor: Colors.white,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        // VisualDesity : 사용자 인터페이스 구성요소의 시각적 밀도를 담당.
        // 프레임워크가 실행 중인 현재 플랫폼을 기반으로 적응형 VisualDensity를 반환
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      defaultTransition: Transition.cupertino,
      initialBinding: InitBinding(),
      initialRoute: '/',
      getPages: appRouter,
    );
  }
}
