// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:beezar/components/custom_btn.dart';
import 'package:beezar/components/custom_textfeild1.dart';
import 'package:beezar/modules/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogIn extends StatelessWidget {
  Loginontroller loginontroller = Get.put(Loginontroller());
  var formKey = GlobalKey<FormState>();

  LogIn({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Colors.white,
                  Colors.white12,
                ]),
          ),
          child: Center(
            child: Form(
              key: formKey,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.05,
                        left: MediaQuery.of(context).size.width * 0.07,
                        right: MediaQuery.of(context).size.width * 0.1),
                    child: Image.asset(
                      'assets/images/logo1.png',
                      width: 300,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.25),
                    child: SizedBox(
                      height: double.infinity,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          const Center(
                            child: Text(
                              "تسجيل دخول",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 37,
                                  fontFamily: "ca1"),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(
                              "مرحبًا بعودتك يرجى تسجيل الدخول الآن",
                              style: TextStyle(
                                  color: Colors.black87.withOpacity(0.47),
                                  fontSize: 13,
                                  fontFamily: "ca1",
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.width * 0.07,
                                left: MediaQuery.of(context).size.width * 0.07,
                                right:
                                    MediaQuery.of(context).size.width * 0.07),
                            child: FormFields(
                                "البريد الاليكتروني",
                                const Icon(Icons.email),
                                null,
                                false,
                                loginontroller.emailController,
                                (value) {}),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.width * 0.07,
                                left: MediaQuery.of(context).size.width * 0.07,
                                right:
                                    MediaQuery.of(context).size.width * 0.07),
                            child: FormFields(
                                "كلمة المرور",
                                const Icon(Icons.lock),
                                IconButton(
                                  icon: Icon(
                                    loginontroller.passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    loginontroller.changeState();
                                  },
                                ),
                                loginontroller.Issecure,
                                loginontroller.passwordController,
                                (value) {}),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.07,
                                right:
                                    MediaQuery.of(context).size.width * 0.07),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'نسيت كلمة المرور ؟',
                                      style: TextStyle(
                                        fontFamily: 'ca1',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.07,
                              right: MediaQuery.of(context).size.width * 0.07,
                            ),
                            child: CustomBtn(
                              onTapBtn: () {
                                // if (formKey.currentState!.validate()) {
                                loginontroller.LoginOnClick();

                                // Get.toNamed('/signup');
                                // }
                              },
                              btnText: 'تأكيد',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.07,
                              right: MediaQuery.of(context).size.width * 0.07,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'ليس لديك حساب ؟',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'ca2',
                                      color: Colors.black),
                                ),
                                TextButton(
                                  onPressed: () => Get.toNamed('/signup'),
                                  child: const Text('سجل الآن',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'ca2',
                                          color: Colors.black)),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
