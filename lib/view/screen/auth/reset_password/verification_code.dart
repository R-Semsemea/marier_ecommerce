import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:marier_ecommerce/controller/auth/verification_code_controller.dart';
import 'package:marier_ecommerce/view/widget/auth/body_text.dart';

import '../../../../controller/auth/auth_controller.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/constant/screen_dimensions.dart';
import '../../../widget/auth/auth_title.dart';

class VerificationCode extends StatelessWidget {
  final AuthControllerImp authController;

  const VerificationCode({Key? key, required this.authController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp controller = Get.put(VerifyCodeControllerImp());
    return Column(
      children: [
        CustomAuthTitle(titleText: "verification_title".tr),
        Expanded(
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification overscroll) {
              overscroll.disallowIndicator();
              return true;
            },
            child: ListView(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenDimension.width * 0.064),
              children: [
                Divider(height: ScreenDimension.height * 0.0197),
                CustomBodyText(bodyText: "verification_body_text".tr),
                Divider(height: ScreenDimension.height * 0.06),
                GetBuilder<VerifyCodeControllerImp>(
                  builder: (controller) => AbsorbPointer(
                    absorbing: controller.isWaiting,
                    child: OtpTextField(
                      showCursor: false,
                      focusedBorderColor: AppColor.primaryColor,
                      enabledBorderColor: AppColor.grey,
                      cursorColor: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                      numberOfFields: 6,
                      fieldWidth: ScreenDimension.width * 0.1,
                      borderWidth: 2,

                      //set to true to show as box or false to show as dash
                      showFieldAsBox: true,
                      //runs when a code is typed in
                      onCodeChanged: (String code) {
                        //handle validation or checks here
                      },
                      //runs when every textfield is filled
                      onSubmit: (String verificationCode) {
                        controller.checkCode(code: verificationCode);
                        //authController.onVerificationCodeComplete();
                      }, // end onSubmit
                    ),
                  ),
                ),
                Divider(height: ScreenDimension.height * 0.07),
                GetBuilder<VerifyCodeControllerImp>(
                  builder: (controller) => InkWell(
                    onTap: controller.onPressResendCode,
                    child: Text(
                      "resend_code_button".tr,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: AppColor.primaryColor,
                          ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
