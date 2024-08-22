import 'package:er_konnect/helper/colors.dart';
import 'package:er_konnect/views/Institute/institute_register.dart';
import 'package:er_konnect/views/parent/parent_login.dart';
import 'package:er_konnect/views/student/student_login.dart';
import 'package:er_konnect/views/teacher/teacher_login.dart';
import 'package:er_konnect/widgets/head.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Selection extends StatefulWidget {
  const Selection({super.key});

  @override
  State<Selection> createState() => _SelectionState();
}

class _SelectionState extends State<Selection> {
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
                        
                        Text("What is your role?",style: GoogleFonts.barlow(color: appBlack,fontWeight: FontWeight.bold,fontSize: 25),),
                        const SizedBox(height: 10,),
                        Text("Choose your user type to get started.",style: GoogleFonts.barlow(color: appGrey,fontSize: 15),),
                    
                        const SizedBox(height: 40,),
                    
                        Row(
                          children: [
                    
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(()=>const StudentLogin(),transition: Transition.rightToLeft,duration: const Duration(seconds: 1));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0xff939393).withOpacity(0.3),
                                        spreadRadius: 2,
                                        blurRadius: 2,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  padding: const EdgeInsets.only(left: 30,right: 30,top: 20,bottom: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Image.asset('img/sel_img2.png',height: Get.height*0.15),
                                      const SizedBox(height: 10,),
                                      Text("Student",style: GoogleFonts.barlow(color: appBlack,fontSize: 18,fontWeight: FontWeight.w500),)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                    
                            const SizedBox(width: 20,),
                    
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(()=>const TeacherLogin(),transition: Transition.rightToLeft,duration: const Duration(seconds: 1));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0xff939393).withOpacity(0.3),
                                        spreadRadius: 2,
                                        blurRadius: 2,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  padding: const EdgeInsets.only(left: 30,right: 30,top: 20,bottom: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Image.asset('img/sel_img3.png',height: Get.height*0.15),
                                      const SizedBox(height: 10,),
                                      Text("Teachers",style: GoogleFonts.barlow(color: appBlack,fontSize: 18,fontWeight: FontWeight.w500),)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                    
                          ],
                        ),
                    
                        const SizedBox(height: 20,),
                    
                        Row(
                          children: [
                    
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(()=>const ParentLogin(),transition: Transition.rightToLeft,duration: const Duration(seconds: 1));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0xff939393).withOpacity(0.3),
                                        spreadRadius: 2,
                                        blurRadius: 2,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  padding: const EdgeInsets.only(left: 30,right: 30,top: 20,bottom: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Image.asset('img/sel_img4.png',height: Get.height*0.15),
                                      const SizedBox(height: 10,),
                                      Text("Parents",style: GoogleFonts.barlow(color: appBlack,fontSize: 18,fontWeight: FontWeight.w500),)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                    
                            const SizedBox(width: 20,),
                    
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(()=>const InstituteRegister(),transition: Transition.rightToLeft,duration: const Duration(seconds: 1));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0xff939393).withOpacity(0.3),
                                        spreadRadius: 2,
                                        blurRadius: 2,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  padding: const EdgeInsets.only(left: 30,right: 30,top: 20,bottom: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Image.asset('img/sel_img5.png',height: Get.height*0.15),
                                      const SizedBox(height: 10,),
                                      Text("Institute",style: GoogleFonts.barlow(color: appBlack,fontSize: 18,fontWeight: FontWeight.w500),)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                    
                          ],
                        ),
                    
                    
                    
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
}
