import 'package:er_konnect/helper/colors.dart';
import 'package:er_konnect/widgets/head.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class StudentSubjects extends StatefulWidget {
  const StudentSubjects({super.key});

  @override
  State<StudentSubjects> createState() => _StudentSubjectsState();
}

class _StudentSubjectsState extends State<StudentSubjects> {
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
                          
                          Row(
                            children: [
                      
                              IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(Icons.arrow_back_ios,color: appBlack,)
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Subjects",style: GoogleFonts.barlow(color: appBlack,fontWeight: FontWeight.bold,fontSize: 25),),
                                  Text("Select your subject from below",style: GoogleFonts.barlow(color: appGrey,fontSize: 15),),
                      
                                ],
                              )
                      
                            ],
                          ),
                          
                          const SizedBox(height: 40,),
                          
                          data('English'),
                          const SizedBox(height: 10,),
                      
                          data('Math'),
                          const SizedBox(height: 10,),
                      
                      
                          data('Science'),
                          const SizedBox(height: 10,),
                      
                      
                          data('Art & Design'),
                          const SizedBox(height: 10,),
                      
                      
                          data('Geography'),
                          const SizedBox(height: 10,),
                      
                      
                          data('Class'),
                          const SizedBox(height: 10,),
                      
                      
                          
                          
                        ],
                      ),
                    ),
                  )
              )


            ],
          )
      ),

    );
  }

  Widget data(String name){
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xffF8F8F8)
      ),
      padding: const EdgeInsets.all(10),
      child: ListTile(
        title: Text(name,style: GoogleFonts.barlow(color: appBlack,fontWeight: FontWeight.bold,fontSize: 16),),
        trailing: Icon(Icons.arrow_forward_outlined,color: appBlack,),
      ),
    );
  }
  
}
