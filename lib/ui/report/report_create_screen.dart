import 'package:boda/state/report/report_getx.dart';
import 'package:boda/ui/_constant/appbar/custom_app_bar.dart';
import 'package:boda/ui/_constant/button/app_custom_button.dart';
import 'package:boda/ui/_constant/dialog/custom_dialog.dart';
import 'package:boda/ui/_constant/theme/colors.dart';
import 'package:boda/ui/_constant/theme/text_style.dart';
import 'package:boda/ui/report/widgets/image_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportCreateScreen extends StatelessWidget {
  final int itemId;
  final bool isUpdate;
  final String title;
  const ReportCreateScreen({
    super.key,
    required this.itemId,
    required this.title,
    this.isUpdate = false,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReportGetx>(
      init: ReportGetx()
        ..started(
          itemId: itemId,
          isUpdate: isUpdate,
        ),
      builder: (x) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            backgroundColor: CustomColor.b40,
            appBar: customAppBar(backAction: () {
              FocusScope.of(context).unfocus();
              customDialog(
                title: '독후감 작성 취소',
                description: '작성했던 내용은 저장되지 않습니다.\n정말 그만 작성하시겠습니까?',
                onTap: () {
                  Get
                    ..back()
                    ..back();
                },
              );
            }),
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 16,
                          ),
                          child: Text(
                            title,
                            style: CustomTextStyle.body1_700.copyWith(
                              color: CustomColor.b80,
                            ),
                          ),
                        ),
                        Divider(
                          height: 8,
                          thickness: 8,
                          color: CustomColor.p50,
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 24,
                            ),
                            width: Get.width - 40,
                            height: Get.width - 40,
                            color: CustomColor.b40,
                            child: TextFormField(
                              controller: x.reportController,
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: '어떤 책이었나요?',
                                hintStyle: CustomTextStyle.body2_400.copyWith(
                                  color: CustomColor.b20,
                                ),
                                border: InputBorder.none,
                              ),
                              style: CustomTextStyle.body2_400.copyWith(
                                color: CustomColor.b80,
                              ),
                              onChanged: (value) => x.changedReport(
                                text: value,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: wideSquareBoxWithText(
                      text: isUpdate ? '수정 완료' : '저장',
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        customDialog(
                          title: '독후감 ${isUpdate ? '수정' : '저장'}',
                          description: '독후감을 ${isUpdate ? '수정' : '저장'}하시겠습니까?',
                          isReverse: true,
                          onTap: () {
                            x.submitReport(
                              isUpdate: isUpdate,
                              itemId: itemId,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
