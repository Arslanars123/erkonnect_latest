import 'dart:convert';
import 'dart:io';

import 'package:er_konnect/helper/methods.dart';
import 'package:er_konnect/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../../helper/colors.dart';
import '../../widgets/head.dart';
import '../../widgets/my_field.dart';

class InstituteRegister extends StatefulWidget {
  const InstituteRegister({super.key});

  @override
  State<InstituteRegister> createState() => _InstituteRegisterState();
}

class _InstituteRegisterState extends State<InstituteRegister> {

  var name=TextEditingController(),contactName=TextEditingController(),email=TextEditingController(),
  password=TextEditingController(),country=TextEditingController(),address=TextEditingController();

  File? image;

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

                        Text("Institute Registration",style: GoogleFonts.barlow(color: appBlack,fontWeight: FontWeight.bold,fontSize: 25),),
                        const SizedBox(height: 10,),
                        Text("Enter your details to further proceed",style: GoogleFonts.barlow(color: appGrey,fontSize: 15),),

                        const SizedBox(height: 40,),

                        Text("Institute Name",style: GoogleFonts.barlow(color: appBlack,fontWeight: FontWeight.bold,fontSize: 15),),
                        const SizedBox(height: 5,),
                        MyField(hint: 'Enter your institute name', controller: name),
                        const SizedBox(height: 10,),

                        Text("Contact Name",style: GoogleFonts.barlow(color: appBlack,fontWeight: FontWeight.bold,fontSize: 15),),
                        const SizedBox(height: 5,),
                        MyField(hint: 'Enter your contact name', controller: contactName),
                        const SizedBox(height: 10,),


                        Text("Email",style: GoogleFonts.barlow(color: appBlack,fontWeight: FontWeight.bold,fontSize: 15),),
                        const SizedBox(height: 5,),
                        MyField(hint: 'Enter your email', controller: email),
                        const SizedBox(height: 10,),


                        Text("Password",style: GoogleFonts.barlow(color: appBlack,fontWeight: FontWeight.bold,fontSize: 15),),
                        const SizedBox(height: 5,),
                        MyField(hint: 'Enter your password', controller: password),
                        const SizedBox(height: 10,),


                        Text("Country",style: GoogleFonts.barlow(color: appBlack,fontWeight: FontWeight.bold,fontSize: 15),),
                        const SizedBox(height: 5,),
                        MyField(hint: 'Enter your country', controller: country),
                        const SizedBox(height: 10,),


                        Text("Address",style: GoogleFonts.barlow(color: appBlack,fontWeight: FontWeight.bold,fontSize: 15),),
                        const SizedBox(height: 5,),
                        MyField(hint: 'Enter your address', controller: address),
                        const SizedBox(height: 30,),

                        Text("Upload Image",style: GoogleFonts.barlow(color: appBlack,fontWeight: FontWeight.bold,fontSize: 15),),
                        const SizedBox(height: 5,),

                        GestureDetector(
                          onTap: () async{
                            image=await imagePickGalleryAndroid();
                            if(image!=null){
                              setState(() {

                              });
                            }
                          },
                          child: Container(
                            height: 100,width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: image==null ? const DecorationImage(image: AssetImage("img/noImage.jpg"),fit: BoxFit.cover) :
                                  DecorationImage(image: FileImage(image!),fit: BoxFit.cover)
                            ),
                          ),
                        ),


                        const SizedBox(height: 30,),

                        MyButton(
                            onTap: () {
                              _uploadData(email: email.text, password: password.text, phone: '1526', address: address.text,
                                  name: name.text, plan: 'plan', image: image!);
                            },
                            text: 'Submit'
                        ),
                        const SizedBox(height: 10,),
                        Center(
                          child: RichText(
                              text: TextSpan(
                                children: [

                                  TextSpan(
                                    text: "Already have an account?",
                                    style: GoogleFonts.barlow(color: appBlack,fontSize: 15)
                                  ),
                                  TextSpan(
                                    text: " Log in",
                                    style: GoogleFonts.barlow(color: appBrown,fontSize: 15,fontWeight: FontWeight.bold)
                                  ),

                                ]
                              )
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

  Future<void> _uploadData({required String email, required String password, required String phone, required String address,
    required String name, required String plan, required File image,}) async {

    final uri = Uri.parse('http://170.249.216.178/~filterba/schooling/public/api/register-school');


    var request = http.MultipartRequest('POST', uri);


    request.fields['email'] = email;
    request.fields['password'] = password;
    request.fields['phone'] = phone;
    request.fields['address'] = address;
    request.fields['name'] = name;
    request.fields['plan'] = plan;


    request.files.add(
      await http.MultipartFile.fromPath(
        'picture',
        image.path,
      ),
    );


    var response = await request.send();
print(response);

    if (response.statusCode == 200) {

      var responseData = await http.Response.fromStream(response);

      var data = json.decode(responseData.body);

      String message = data['message'];

      if(message.toLowerCase()=='registered successfully'){

        EasyLoading.showSuccess('Registered successfully');

      }else{
        EasyLoading.showError(message);
      }

    } else {
      print('Upload failed: ${response.statusCode}');
    }

  }



}
