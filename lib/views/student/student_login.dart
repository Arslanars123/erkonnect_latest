import 'dart:convert';
import 'package:er_konnect/views/student/student_home.dart';
import 'package:er_konnect/widgets/head.dart';
import 'package:er_konnect/widgets/my_button.dart';
import 'package:er_konnect/widgets/my_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../../helper/colors.dart';

class StudentLogin extends StatefulWidget {
  const StudentLogin({super.key});

  @override
  State<StudentLogin> createState() => _StudentLoginState();
}

class _StudentLoginState extends State<StudentLogin> {

  var email=TextEditingController(),password=TextEditingController(),instituteId=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackground,

      body: SafeArea(
        child: Column(
          children: [

          Head(),

            SizedBox(height: Get.height*0.05,),

            Expanded(
                child: Container(
                  width: Get.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30)
                      )
                  ),
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    
                        Text("Sign in as Student",style: GoogleFonts.barlow(color: appBlack,fontWeight: FontWeight.bold,fontSize: 25),),
                        const SizedBox(height: 10,),
                        Text("Enter your details to sign back in",style: GoogleFonts.barlow(color: appGrey,fontSize: 15),),
                    
                        const SizedBox(height: 40,),
                        
                        Text("Email",style: GoogleFonts.barlow(color: appBlack,fontWeight: FontWeight.bold,fontSize: 15),),
                        const SizedBox(height: 5,),
                        MyField(hint: 'Enter your email', controller: email),
                        const SizedBox(height: 10,),
                    
                        Text("Password",style: GoogleFonts.barlow(color: appBlack,fontWeight: FontWeight.bold,fontSize: 15),),
                        const SizedBox(height: 5,),
                        MyField(hint: 'Enter your password', controller: password),
                        const SizedBox(height: 10,),
                    
                    
                        Text("Institute ID",style: GoogleFonts.barlow(color: appBlack,fontWeight: FontWeight.bold,fontSize: 15),),
                        const SizedBox(height: 5,),
                        MyField(hint: 'Enter your institute ID', controller: instituteId),
                    
                        Align(
                          alignment: Alignment.topRight,
                            child: Text("Forgot Password?",style: GoogleFonts.barlow(color: appBrown),)
                        ),
                    
                        const SizedBox(height: 50,),
                    
                        Center(
                          child: MyButton(
                              onTap: () async{
                    
                                if(email.text.isEmpty || password.text.isEmpty || instituteId.text.isEmpty){
                                  EasyLoading.showError("Fill all the Blanks.");
                                }else{
                    
                                  await loginStudent(email.text, password.text, instituteId.text);
                    
                                }
                    
                    
                              },
                              text: 'Log in'
                          ),
                        )
                    
                    
                    
                    
                    
                    
                      ],
                    ),
                  ),
                )
            )


          ],
        ),
      ),

    );
  }

  Future<void> loginStudent(String emil,String password,String cod) async {
    EasyLoading.show();
    final url = Uri.parse('http://170.249.216.178/~filterba/schooling/public/api/login-student');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': emil,
        'password': password,
        'code': cod,
      }),
    );

    print(response.statusCode);
    if (response.statusCode == 200) {
      // Successful response
      final Map<String, dynamic> responseData = json.decode(response.body);
      final String message = responseData['message'];
      print(responseData);
      if(message.toLowerCase()=='logged in successfully'){
        EasyLoading.showSuccess(message);
        Get.offAll(()=>StudentHome(data: responseData,));
      }else{
        EasyLoading.showError(message);
      }


    } else {
      // Error response
      print('Error: ${response.statusCode}');
      EasyLoading.showError(response.statusCode.toString());
    }
    EasyLoading.dismiss();
  }


}
