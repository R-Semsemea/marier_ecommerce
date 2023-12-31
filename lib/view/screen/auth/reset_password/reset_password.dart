import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marier_ecommerce/view/widget/auth/auth_button.dart';
import 'package:marier_ecommerce/view/widget/auth/body_text.dart';

import '../../../../controller/auth/auth_controller.dart';
import '../../../../controller/auth/reset_password_controller.dart';
import '../../../../core/constant/screen_dimensions.dart';
import '../../../../core/functions/input_validator.dart';
import '../../../widget/auth/auth_text_form_field.dart';
import '../../../widget/auth/auth_title.dart';

class ResetPassword extends StatelessWidget {
  final AuthControllerImp authController;

  const ResetPassword({Key? key, required this.authController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller =
        Get.put(ResetPasswordControllerImp());

    return Column(
      children: [
        CustomAuthTitle(titleText: "reset_password_title".tr),
        Expanded(
          child: Form(
            key: controller.formKey,
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
                  CustomBodyText(bodyText: "reset_password_body_text".tr),
                  Divider(height: ScreenDimension.height * 0.0197),
                  GetBuilder<ResetPasswordControllerImp>(
                    builder: (controller) => CustomAuthTextFieldForm(
                      inputValidator: (val) {
                        return inputValidator(val!, 8, 30, "resetPassword");
                      },
                      keyboardType: TextInputType.text,
                      fieldName: "password_field_label".tr,
                      hintText: "password_filed_hint_text".tr,
                      suffixIcon: controller.obscureText
                          ? Icons.visibility_off
                          : Icons.visibility,
                      onPressedSuffixIcon: controller.onPressPasswordVisibility,
                      textEditingController: controller.passwordController,
                      obscureText: controller.obscureText,
                    ),
                  ),
                  GetBuilder<ResetPasswordControllerImp>(
                    builder: (controller) => CustomAuthTextFieldForm(
                      inputValidator: (val) {
                        return inputValidator(val!, 8, 30, "resetPassword");
                      },
                      keyboardType: TextInputType.text,
                      fieldName: "password_field_label".tr,
                      hintText: "re_password_filed_hint_text".tr,
                      suffixIcon: controller.obscureText
                          ? Icons.visibility_off
                          : Icons.visibility,
                      onPressedSuffixIcon: controller.onPressPasswordVisibility,
                      textEditingController: controller.rePasswordController,
                      obscureText: controller.obscureText,
                    ),
                  ),
                  GetBuilder<ResetPasswordControllerImp>(
                    builder: (controller) => AbsorbPointer(
                      absorbing: controller.isWaiting,
                      child: CustomAuthButton(
                          isWaiting: controller.isWaiting,
                          onPressed: controller.onPressChangePassword,
                          buttonLabel: "change_password_button".tr),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
