import 'package:er_konnect/helper/colors.dart';
import 'package:er_konnect/views/student/bottom_nav/student_chat_nav.dart';
import 'package:er_konnect/views/student/student_books.dart';
import 'package:er_konnect/views/student/student_subjects.dart';
import 'package:er_konnect/widgets/head.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentHomeNav extends StatefulWidget {
  var data;
   StudentHomeNav({super.key,this.data});

  @override
  State<StudentHomeNav> createState() => _StudentHomeNavState();
}

class _StudentHomeNavState extends State<StudentHomeNav> {
  @override
  Widget build(BuildContext context) {
    print("here 2 screen data");
    print(widget.data);
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
                    
                        Text("Good morning, Alex",style: GoogleFonts.barlow(color: appBlack,fontWeight: FontWeight.bold,fontSize: 25),),
                        const SizedBox(height: 10,),
                        Text("Your class:"+widget.data["data"]["id"].toString(),style: GoogleFonts.barlow(color: appGrey,fontSize: 15),),
                    
                        const SizedBox(height: 40,),
                    
                        Text("Quick Menu",style: GoogleFonts.barlow(color: appBlack,fontWeight: FontWeight.bold,fontSize: 16),),
                    
                        const SizedBox(height: 20,),
                        
                        GestureDetector(
                          onTap: () {
                            Get.to(()=>const StudentSubjects());
                          },
                            child: data('img/student/home/home_img1.png', 'Subjects')
                        ),
                    
                    
                        const SizedBox(height: 10,),
                    
                        data('img/student/home/home_img2.png', 'Time Table'),
                    
                        const SizedBox(height: 10,),
                    
                        GestureDetector(
                            onTap: () {
                              Get.to(()=>const StudentChatNav());
                            },
                            child: data('img/student/home/home_img3.png', 'Chats')
                        ),
                    
                        const SizedBox(height: 10,),
                    
                        data('img/student/home/home_img4.png', 'Report'),
                    
                    
                        const SizedBox(height: 10,),
                    
                        data('img/student/home/home_img2.png', 'Attendance'),
                    
                    
                        const SizedBox(height: 10,),
                    
                        GestureDetector(
                          onTap: () {
                            Get.to(()=>const StudentBooks());
                          },
                            child: data('img/student/home/home_img5.png', 'Book')
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


  Widget data(String img,String name){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xffF8F8F8)
      ),
      padding: const EdgeInsets.all(10),
      child: ListTile(
        leading: Image.asset(img,height: 40,width: 40,),
        title: Text(name,style: GoogleFonts.barlow(color: appBlack,fontWeight: FontWeight.bold,fontSize: 16),),
        trailing: Icon(Icons.arrow_forward_outlined,color: appBlack,),
      ),
    );
  }

}
