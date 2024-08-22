import 'package:er_konnect/views/student/student_chat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../helper/colors.dart';
import '../../../widgets/head.dart';


class StudentChatNav extends StatefulWidget {
  final data;
  const StudentChatNav({super.key,this.data});

  @override
  State<StudentChatNav> createState() => _StudentChatNavState();
}

class _StudentChatNavState extends State<StudentChatNav> {
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

                          Text("Chat",style: GoogleFonts.barlow(color: appBlack,fontWeight: FontWeight.bold,fontSize: 25),),

                          const SizedBox(height: 20,),
                          
                          searchBar(),

                          const SizedBox(height: 40,),


                          GestureDetector(
                            onTap: () {
                              Get.to(()=>const StudentChat());
                            },
                              child: data("img/noImage.jpg", 'James Trenton', 'Hey, just wanted to say that...')
                          ),
                          const SizedBox(height: 20,),
                          GestureDetector(
                            onTap: () {
                              Get.to(()=>const StudentChat());
                            },
                              child: data("img/noImage.jpg", 'James Trenton', 'Hey, just wanted to say that...')
                          ),
                          const SizedBox(height: 20,),
                          GestureDetector(
                            onTap: () {
                              Get.to(()=>const StudentChat());
                            },
                              child: data("img/noImage.jpg", 'James Trenton', 'Hey, just wanted to say that...')
                          ),
                          const SizedBox(height: 20,),





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

  Widget searchBar(){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xffE4E6E8))
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Icon(Icons.search,color: appBlack,),
          const SizedBox(width: 20,),
          Text("Search",style: GoogleFonts.barlow(color: appGrey,fontSize: 15),)
        ],
      ),
    );
  }


  Widget data(String image,String title,String subTitle){
    return Row(
      children: [
        
        Container(
          height: 50,width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: AssetImage(image),fit: BoxFit.cover)
          ),
        ),
        const SizedBox(width: 20,),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,style: GoogleFonts.barlow(color: appBlack,fontWeight: FontWeight.bold,fontSize: 16),),
              Text(subTitle,style: GoogleFonts.barlow(color: appBlack,fontSize: 13),)
            ],
          ),
        ),

        Text("12:00PM",style: GoogleFonts.barlow(color: appBlack,fontWeight: FontWeight.bold,fontSize: 12),)
        
        
      ],
    );
  }

}
