import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:er_konnect/widgets/head.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../../helper/colors.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_field.dart';

class ParentLogin extends StatefulWidget {
  const ParentLogin({super.key});

  @override
  State<ParentLogin> createState() => _ParentLoginState();
}

class _ParentLoginState extends State<ParentLogin> {
  var email = TextEditingController(),
      password = TextEditingController(),
      instituteId = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackground,
      body: SafeArea(
        child: Column(
          children: [
             Head(),
            SizedBox(
              height: Get.height * 0.05,
            ),
            Expanded(
              child: Container(
                width: Get.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30))),
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sign in as Parent",
                      style: GoogleFonts.barlow(
                          color: appBlack,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Enter your details to sign back in",
                      style: GoogleFonts.barlow(color: appGrey, fontSize: 15),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Email",
                      style: GoogleFonts.barlow(
                          color: appBlack,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    MyField(hint: 'Enter your email', controller: email),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Password",
                      style: GoogleFonts.barlow(
                          color: appBlack,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    MyField(hint: 'Enter your password', controller: password),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Institute ID",
                      style: GoogleFonts.barlow(
                          color: appBlack,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    MyField(
                        hint: 'Enter your institute ID',
                        controller: instituteId),
                    Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "Forgot Password?",
                          style: GoogleFonts.barlow(color: appBrown),
                        )),
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: MyButton(
                          onTap: () async {
                            await _loginParent();
                          },
                          text: 'Log in'),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _loginParent() async {
    final emailText = email.text;
    final passwordText = password.text;
    final instituteIdText = instituteId.text;

    if (emailText.isEmpty || passwordText.isEmpty || instituteIdText.isEmpty) {
      EasyLoading.showError("Please fill all fields");
      return;
    }

    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      EasyLoading.showError("No internet connection");
      return;
    }

    try {
      EasyLoading.show(status: 'Loading...');
      final url = Uri.parse(
          'http://170.249.216.178/~filterba/schooling/public/api/login-parent');

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': emailText,
          'password': passwordText,
          'code': instituteIdText,
        }),
      );

      final Map<String, dynamic> responseData = json.decode(response.body);

      if (response.statusCode == 200 && responseData['status'] == 200) {
        final String message = responseData['message'];
        EasyLoading.showSuccess(message);

        // Handle login success and navigate or perform other actions
        final userData = responseData['data'];
        // You can use userData as needed, for example:
        print('User ID: ${userData['id']}');
        print('User Name: ${userData['name']}');

      } else {
        final String errorMessage = responseData['message'] ?? 'Login failed';
        EasyLoading.showError(errorMessage);
      }
    } catch (e) {
      EasyLoading.showError("An error occurred: $e");
    } finally {
      EasyLoading.dismiss();
    }
  }
}
