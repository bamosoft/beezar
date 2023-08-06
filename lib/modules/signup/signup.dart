import 'package:beezar/components/custom_btn.dart';
import 'package:beezar/components/custom_textfeild1.dart';
import 'package:beezar/modules/login/login.dart';
import 'package:beezar/modules/signup/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  SignUpController controller = SignUpController();
  var formKey = GlobalKey<FormState>();
  bool passwordVisible = false;
  bool Issecure = true;

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
                    child: Container(
                      height: double.infinity,
                      child: ListView(
                        children: [
                          Center(
                            child: Text(
                              "مرحبًا بك يرجى تسجيل بياناتك الآن",
                              style: TextStyle(
                                  color: Colors.black87.withOpacity(0.47),
                                  fontSize: 13,
                                  fontFamily: "ca1",
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.width * 0.03,
                                left: MediaQuery.of(context).size.width * 0.03,
                                right:
                                    MediaQuery.of(context).size.width * 0.07),
                            child: FormFields("الاسم", Icon(Icons.person), null,
                                false, nameController, (value) {
                              controller.name = value;
                            }),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.width * 0.03,
                                left: MediaQuery.of(context).size.width * 0.03,
                                right:
                                    MediaQuery.of(context).size.width * 0.07),
                            child: FormFields(
                                "البريد الاليكتروني",
                                Icon(Icons.email),
                                null,
                                false,
                                emailController, (value) {
                              controller.email = value;
                            }),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.width * 0.03,
                                left: MediaQuery.of(context).size.width * 0.03,
                                right:
                                    MediaQuery.of(context).size.width * 0.07),
                            child: FormFields(
                                "كلمة المرور",
                                Icon(Icons.lock),
                                IconButton(
                                  icon: Icon(
                                    passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      Issecure = !Issecure;
                                      passwordVisible = !passwordVisible;
                                    });
                                  },
                                ),
                                Issecure,
                                passwordController, (value) {
                              controller.password = value;
                            }),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.width * 0.03,
                                left: MediaQuery.of(context).size.width * 0.03,
                                right:
                                    MediaQuery.of(context).size.width * 0.07),
                            child: FormFields("العنوان", Icon(Icons.home), null,
                                false, addressController, (value) {
                              controller.address = value;
                            }),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.width * 0.03,
                                left: MediaQuery.of(context).size.width * 0.03,
                                right:
                                    MediaQuery.of(context).size.width * 0.07),
                            child: FormFields(
                                "رقم الهاتف المحمول",
                                Icon(Icons.phone),
                                null,
                                false,
                                phoneController, (value) {
                              controller.phone = value;
                            }),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.width * 0.07,
                              left: MediaQuery.of(context).size.width * 0.07,
                              right: MediaQuery.of(context).size.width * 0.07,
                            ),
                            child: CustomBtn(
                              onTapBtn: () {
                                registerOnclick();
                              },
                              btnText: 'تأكيد',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.07,
                              right: MediaQuery.of(context).size.width * 0.09,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  ' لديك حساب بالفعل ؟',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'ca2',
                                      color: Colors.black),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LogIn()));
                                  },
                                  child: const Text('سجل دخول الآن',
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

  registerOnclick() async {
    EasyLoading.show(status: "Loading..");
    await controller.SignOnClick();

    if (controller.SignUpStatuse == true) {
      await EasyLoading.showSuccess('Register Successfully');
      Get.offNamed('/login');
    } else {
      EasyLoading.showError(controller.message);
      print(controller.message);
    }
  }
}
