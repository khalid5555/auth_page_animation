import 'package:auth_page_animation/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/auth/auth_controller.dart';

import '../utils/app_images.dart';

class SocialButtons extends StatelessWidget {
  SocialButtons({Key? key}) : super(key: key);
  final AuthController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .2,
      decoration: BoxDecoration(
        color: AppColors.kreColor,
        borderRadius: BorderRadius.only(
          topLeft: !controller.showSignUp
              ? const Radius.circular(16)
              : const Radius.circular(0),
          topRight: controller.showSignUp
              ? const Radius.circular(16)
              : const Radius.circular(0),
        ),
      ),
      padding: const EdgeInsets.only(top: 10, bottom: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.google,
            width: 37,
            height: 20,
            fit: BoxFit.cover,
          ),
          const Center(
            child: Text(
              'Google',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: AppColors.kPrColor),
            ),
          ),
        ],
      ),
    );
  }
}
