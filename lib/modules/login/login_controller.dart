import 'package:beezar/models/my_user.dart';
import 'package:beezar/modules/login/login_service.dart';
import 'package:get/get.dart';

LoginService service = LoginService();

class Loginontroller extends GetxController {
  var keep = false;
  var email;
  var password;
  var LoginStatuse = false;
  var message;

  Future<void> LoginOnClick() async {
    await service
        .login((User(
      email: email,
      password: password,
    )))
        .then((value) {
      if (value) {
        Get.toNamed('/home');
      }
    });
    //  message = service.error;

    if (message is List) {
      String temp = '';
      for (String s in message) {
        temp += s + '\n';
        message = temp;
      }
    }
  }
}
