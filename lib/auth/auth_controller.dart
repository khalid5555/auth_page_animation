
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth_page.dart';

class AuthController extends GetxController {
  var formkey = GlobalKey<FormState>();
  bool showSignUp = false;
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  // final _myAuth = Auth();
  // final _box = GetStorage();
  final keyTheme = 'isDarkMode'.obs;

  // void signIn() async {
  //   if (formkey.currentState!.validate()) {
  //     try {
  //       formkey.currentState!.save();

  //       final res = await _myAuth.signIn(email.text, password.text);

  //       if (res.user!.uid == 'VKapbktiIQUo1S5FBD0MqSX7v842'
  //           // ||
  //           //     res.user!.uid == 'k62J3ToKQEOHvG8NUflJAWCiF3D2'
  //           ) {
  //         EasyLoading.showSuccess('${res.user!.displayName}يا  اهلا بيك ');

  //         Get.off(
  //           () => const Admin(),
  //           binding: AuthBindings(),
  //           transition: Transition.size,
  //           duration: const Duration(seconds: 1),
  //         );
  //       } else {
  //         Get.off(
  //           () => const HomeView(),
  //           transition: Transition.size,
  //           binding: AuthBindings(),
  //           duration: const Duration(seconds: 1),
  //         );
  //         EasyLoading.showToast('اهلا بيك  ');
  //       }
  //     } catch (e) {
  //       EasyLoading.showError(e.toString());
  //     }
  //     upDateLogin('login', true);
  //   }
  // }

  // void signUpGoogle() async {
  //   try {
  //     final res = await _myAuth.signInWithGoogle();
  //     await _myAuth.createUser(
  //       UserModel(
  //         id: res.user!.uid,
  //         name: res.user!.displayName ?? '',
  //         email: res.user!.email ?? '',
  //       ),
  //     );
  //   } catch (e) {
  //     print(e);
  //     EasyLoading.showSuccess(
  //       'اهلا بيك كلنا حوليك ',
  //     );
  //   }

  //   upDateLogin('login', true);
  //   Get.offAll(
  //     () => const HomeView(),
  //     transition: Transition.size,
  //     duration: const Duration(seconds: 1),
  //   );
  // }

  // void createUser() async {
  //   if (formkey.currentState!.validate()) {
  //     await _myAuth.createNewUser(email.text, password.text).then((value) {
  //       _myAuth.createUser(
  //         UserModel(
  //           id: value.user!.uid,
  //           name: name.text,
  //           email: value.user!.email ?? '',
  //         ),
  //       );
  //       EasyLoading.showSuccess('تم انشاء حساب بنجاح');
  //     });

  //     Get.off(
  //       () => const AuthPage(),
  //       binding: AuthBindings(),
  //       transition: Transition.size,
  //       duration: const Duration(seconds: 1),
  //     );
  //   }
  // }

  // void upDateLogin(String key, bool value) async {
  //   _box.write(key, value);
  //   //   box.write('login', true);
  //   //   box.write('seen', true);
  //   // }
  // }

  // void signOut() async {
  //   await _myAuth.signOut();
  //   upDateLogin('login', false);
  //   Get.off(() => const AuthPage(), binding: AuthBindings());
  // }

  // Future<User> getUser() async {
  //   return _myAuth.getUser();
  // }

  // bool loadThemeBox() => _box.read(keyTheme.value) ?? false;
  // ThemeMode get changeTheme =>
  //     loadThemeBox() ? ThemeMode.dark : ThemeMode.light;

  // void switchTheme() {
  //   Get.changeThemeMode(loadThemeBox() ? ThemeMode.light : ThemeMode.dark);
  //   _saveToBox(!loadThemeBox());
  // }

  // void _saveToBox(bool isDarkMode) {
  //   _box.write(keyTheme.value, isDarkMode);
  // }

  bool checkTheme() {
    return Get.isDarkMode ? true : false;
  }
}
