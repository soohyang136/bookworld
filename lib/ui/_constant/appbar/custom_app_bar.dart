import 'package:boda/ui/_constant/theme/colors.dart';
import 'package:boda/ui/report/report_create_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

AppBar customAppBar({
  Function()? backAction,
  bool? isReport,
  int? itemId,
  String? title,
}) {
  return AppBar(
    backgroundColor: CustomColor.b40,
    elevation: 0,
    toolbarHeight: 56,
    leading: GestureDetector(
      onTap: backAction ?? () => Get.back(),
      child: SvgPicture.asset(
        'assets/svg/back.svg',
        width: 24,
        height: 24,
        fit: BoxFit.none,
      ),
    ),
    actions: isReport == null
        ? null
        : [
            GestureDetector(
              onTap: () => Get.to(() => ReportCreateScreen(
                    itemId: itemId!,
                    isUpdate: isReport,
                    title: title!,
                  )),
              child: SvgPicture.asset(
                'assets/svg/${isReport ? 'edit' : 'write'}.svg',
                width: 24,
                height: 24,
                fit: BoxFit.none,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
  );
}
