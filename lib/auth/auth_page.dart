import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/constants.dart';
import '../widget/login_form.dart';
import '../widget/sign_up_form.dart';
import '../widget/social_buttons.dart';
import 'auth_controller.dart';


class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>
    with SingleTickerProviderStateMixin {
  final AuthController controller = Get.find();

  late AnimationController _animationController;
  late Animation<double> _textRotateAnimation;

  void setUpAnimation() {
    _animationController =
        AnimationController(vsync: this, duration: defaultDuration);

    _textRotateAnimation =
        Tween<double>(begin: 0, end: 90).animate(_animationController);
  }

  void updateView() {
    setState(() {
      controller.showSignUp = !controller.showSignUp;
    });
    controller.showSignUp
        ? _animationController.forward()
        : _animationController.reverse();
  }

  @override
  void initState() {
    setUpAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
    controller.email.dispose();
    controller.name.dispose();
    controller.password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: Get.height,
                  width: Get.width,
                  child: Stack(
                    children: [
                      // login form
                      AnimatedPositioned(
                        duration: defaultDuration,
                        width: size.width * 0.90,
                        height: size.height,
                        left: controller.showSignUp ? -size.width * 0.78 : 0,
                        child: Container(
                          padding: const EdgeInsets.only(right: 7),
                          color: AppColors.darkYellow,
                          child: LoginForm(),
                        ),
                      ),
                      // signUp form
                      AnimatedPositioned(
                        duration: defaultDuration,
                        height: size.height,
                        width: size.width * 0.88,
                        left: controller.showSignUp
                            ? size.width * 0.12
                            : size.width * 0.90,
                        child: Container(
                          color: AppColors.signupBg,
                          child: SignUpForm(),
                        ),
                      ),
                      // logo
                      AnimatedPositioned(
                        duration: defaultDuration,
                        left: 0,
                        right: controller.showSignUp
                            ? -size.width * 0.06
                            : size.width * 0.06,
                        top: size.height * 0.06,
                        child: CircleAvatar(
                          radius: 90,
                          backgroundColor: Colors.white70,
                          child: AnimatedSwitcher(
                            duration: defaultDuration,
                            child: Image.asset(
                              AppImages.kh1,
                              width: size.height * .2,
                              height: size.height * .18,
                              color: controller.showSignUp
                                  ? AppColors.signupBg
                                  : AppColors.kPrColor,
                            ),
                          ),
                        ),
                      ),
                      // social button
                      AnimatedPositioned(
                        duration: defaultDuration,
                        width: size.width * .48,
                        bottom: size.height * 0.1,
                        right: controller.showSignUp
                            ? size.width * .40
                            : size.width * .1,
                        child: InkWell(
                          onTap: () {
                            // return controller.signUpGoogle();
                          },
                          child: SocialButtons(),
                        ),
                      ),
                      // Text  login
                      AnimatedPositioned(
                        curve: Curves.easeInCirc,
                        duration: defaultDuration,
                        bottom: controller.showSignUp
                            ? size.height / 2 - 80
                            : size.height * 0.2,
                        left:
                            controller.showSignUp ? 0 : size.width * 0.44 - 80,
                        child: AnimatedDefaultTextStyle(
                          duration: defaultDuration,
                          curve: Curves.easeInCirc,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'molhim',
                            fontSize: controller.showSignUp ? 20 : 32,
                            fontWeight: FontWeight.bold,
                            color: controller.showSignUp
                                ? Colors.white
                                : Colors.white70,
                          ),
                          child: Transform.rotate(
                            angle: -_textRotateAnimation.value * pi / 180,
                            alignment: Alignment.topLeft,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: defaultPadding * 0.75,
                              ),
                              child: InkWell(
                                onTap: () async {
                                  debugPrint('tap login');
                                  if (controller.email.text.trim().isEmpty ||
                                      controller.password.text.trim().isEmpty) {
                                    EasyLoading.showError(
                                        'الرجاء تسجيل حساب جديد اولا');
                                    await Future.delayed(
                                        const Duration(seconds: 2));
                                    updateView();
                                  } else {
                                    // return controller.signIn();
                                  }
                                },
                                child: const Text(
                                  "تسجيل الدخول",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Text signUp
                      AnimatedPositioned(
                        duration: defaultDuration,
                        bottom: !controller.showSignUp
                            ? size.height / 2 - 80
                            : size.height * 0.2,
                        right: !controller.showSignUp
                            ? -7
                            : size.width * 0.44 - 80,
                        child: AnimatedDefaultTextStyle(
                          duration: defaultDuration,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'molhim',
                            fontSize: !controller.showSignUp ? 20 : 32,
                            fontWeight: FontWeight.bold,
                            color: !controller.showSignUp
                                ? Colors.white
                                : Colors.white70,
                          ),
                          child: Transform.rotate(
                            angle: (90 - _textRotateAnimation.value) * pi / 180,
                            alignment: Alignment.topRight,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: defaultPadding * 0.75,
                              ),
                              child: InkWell(
                                onTap: () async {
                                  printInfo(info: 'signUp tapped');
                                  if (controller.email.text.trim().isEmpty ||
                                      controller.password.text.trim().isEmpty ||
                                      controller.name.text.trim().isEmpty) {
                                    EasyLoading.showError(
                                        'الرجاء ملئ الحقول الفارعة');
                                    await Future.delayed(
                                        const Duration(seconds: 3));

                                    updateView();
                                  } else {
                                    // return controller.createUser();
                                  }
                                },
                                child: const Text(
                                  "حساب جديد",
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
