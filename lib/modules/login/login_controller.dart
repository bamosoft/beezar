import 'package:beezar/models/my_user.dart';
import 'package:beezar/modules/login/login_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

LoginService service = LoginService();

class Loginontroller extends GetxController {
  var keep = false;
  String email = "amma@gmail.com";
  String password = "123456";
  var LoginStatuse = false;
  var message;
  bool passwordVisible = false;
  bool Issecure = true;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  Future<void> LoginOnClick() async {
    var as = await service
        .login((User(
      email: email,
      password: password,
    )))
        .then((value) {
      if (value) {
        Get.toNamed('/home');
      } else {
        Get.showSnackbar(const GetSnackBar(
          title: "برجاء العلم حدثت مشكله بتسجيل الدخول",
        ));
      }
    });
    print(as.toString());
    //  message = service.error;

    if (message is List) {
      String temp = '';
      for (String s in message) {
        temp += s + '\n';
        message = temp;
      }
    }
  }

  void changeState() {
    Issecure = !Issecure;
    passwordVisible = !passwordVisible;
    update();
  }
}
