import 'package:boda/state/auth/auth_getx.dart';
import 'package:boda/ui/_constant/button/app_custom_button.dart';
import 'package:boda/ui/_constant/theme/boda_reg_exp.dart';
import 'package:boda/ui/_constant/theme/colors.dart';
import 'package:boda/ui/_constant/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SignUpName extends StatelessWidget {
  const SignUpName({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthGetx>(builder: (x) {
      return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: CustomColor.b40,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 80,
                            bottom: 16,
                          ),
                          child: RichText(
                            text: TextSpan(
                              text: '안녕하세요.\n',
                              style: CustomTextStyle.headline1_700.copyWith(
                                color: CustomColor.b80,
                              ),
                              children: [
                                TextSpan(
                                  text: '이름',
                                  style: CustomTextStyle.headline1_700.copyWith(
                                    color: CustomColor.p50,
                                  ),
                                ),
                                TextSpan(
                                  text: '을 입력하세요.',
                                  style: CustomTextStyle.headline1_700.copyWith(
                                    color: CustomColor.b80,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: CustomColor.b40,
                            border: Border.all(
                              color: CustomColor.b80,
                            ),
                            borderRadius: BorderRadius.circular(
                              8,
                            ),
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            controller: x.nameController,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 9,
                                horizontal: 16,
                              ),
                              hintText: '이름이 뭐예요?',
                              hintStyle: CustomTextStyle.body2_500.copyWith(
                                color: CustomColor.b20,
                              ),
                              border: InputBorder.none,
                            ),
                            style: CustomTextStyle.body2_500.copyWith(
                              color: CustomColor.b80,
                            ),
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(
                                RegExp(r'''[\n\s]*$'''),
                              ),
                              FilteringTextInputFormatter.deny(
                                BodaRegExp.withOutEmoji,
                              ),
                            ],
                            onChanged: (value) => x.changedName(
                              text: value,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  wideSquareBoxWithText(
                    text: '완료',
                    onTap: ()  {
                      FocusScope.of(context).unfocus();
                      x.signUpName();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
