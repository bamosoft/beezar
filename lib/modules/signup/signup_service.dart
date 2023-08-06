import 'dart:convert';
import 'package:beezar/config/server_config.dart';
import 'package:beezar/models/my_user.dart';
import 'package:http/http.dart' as http;

class SignUpService{
  var url = Uri.parse(ServerConfig.DNS+ServerConfig.signup);
 // var url1 = Uri.parse(ServerConfig.DNS+ServerConfig.login);
  var message;
  var error;
  var token;


  Future<bool> register(User user) async{
            print("leeeeeettttttssss gggoooooo");
    var response = await http.post(
      url,
      headers: {
        'Accept':'application/json',
      },
      body: {
        'name':user.name,
        'password':user.password,
        'email': user.email,
        'address':user.address,
        'phone':user.phone,


      },
    );
    print(url);
    print(response.statusCode);
    print(response.body);


    if(response.statusCode==200){
      var jsonResponse=jsonDecode(response.body);
     // message=jsonResponse['success'];
      return true;
    }
    else if(response.statusCode==422){
      var jsonResponse=jsonDecode(response.body);
    //  message= jsonResponse['errors'];
      return false;
    }
    else if(response.statusCode==500){
      var jsonResponse=jsonDecode(response.body);
      //  message= jsonResponse['errors'];
      return false;
    }
    else{
      var jsonResponse=jsonDecode(response.body);
     // message= jsonResponse['errors'];
      return false;
    }
  }


}