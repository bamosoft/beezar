// ignore_for_file: unused_local_variable

import 'package:beezar/config/server_config.dart';
import 'package:beezar/models/my_user.dart';
import 'package:http/http.dart' as http;

class LoginService {
  var url = Uri.parse(ServerConfig.DNS + ServerConfig.login);
  var message;
  var error;
  var token;

  Future<bool> login(User user) async {
    // print("leeeeeettttttssss gggoooooo");
    try {
      var response = await http.post(
        Uri.parse('http://127.0.0.1:8000/api/login'),
        headers: {
          'Accept': 'application/json',
        },
        body: {
          // 'email': 'user.email',
          // 'password':' user.password',
          'email': 'amma@gmail.com',
          'password': '123456',
        },
      );
      print(response.statusCode);
      print(response.body);
    } catch (e) {
      print('$e + asdaasdas');
    }
    // print(url);
    return true;

    // if (response.statusCode == 200) {
    //   var jsonResponse = jsonDecode(response.body);
    //   // message=jsonResponse['success'];
    //   return true;
    // } else if (response.statusCode == 422) {
    //   var jsonResponse = jsonDecode(response.body);
    //   //  message= jsonResponse['errors'];
    //   return false;
    // } else if (response.statusCode == 500) {
    //   var jsonResponse = jsonDecode(response.body);
    //   //  message= jsonResponse['errors'];
    //   return false;
    // } else {
    //   var jsonResponse = jsonDecode(response.body);
    //   // message= jsonResponse['errors'];
    //   return false;
    // }
  }
}
