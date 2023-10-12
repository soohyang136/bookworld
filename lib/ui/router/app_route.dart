import 'package:boda/ui/detail/book_detail_screen.dart';
import 'package:boda/ui/main/boda_app.dart';
import 'package:get/get.dart';

List<GetPage> appRouter = [
  // 경로가 필요한 앱 페이지 목록
  GetPage(
    name: '/',
    page: () => const BodaApp(),
    transition: Transition.fadeIn,
    transitionDuration: const Duration(
      milliseconds: 500,
    ),
  ),

  // 책 상세페이지
    GetPage(
    name: '/book/:itemId',
    page: () => BookDetailScreen(),
  ),
];
