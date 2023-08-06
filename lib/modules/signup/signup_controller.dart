import 'package:beezar/models/my_user.dart';
import 'package:beezar/modules/signup/signup_service.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:flutter/material.dart';

SignUpService service = SignUpService();

class SignUpController extends GetxController{
  var keep =false ;
  var name;
  var address;
  var phone;
  var image=null;
  var email;
  var password;
  var SignUpStatuse=false;
  var message;




  Future<void>SignOnClick()async{
    User user = User(name: name, email: email, password: password, address: address, phone: phone);

    SignUpStatuse =await service.register(user);
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