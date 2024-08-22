import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../helper/colors.dart';
import '../../widgets/head.dart';

class StudentBooks extends StatefulWidget {
  const StudentBooks({super.key});

  @override
  State<StudentBooks> createState() => _StudentBooksState();
}

class _StudentBooksState extends State<StudentBooks> {
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
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        
                            Text("Good morning, Alex",style: GoogleFonts.barlow(color: appBlack,fontWeight: FontWeight.bold,fontSize: 25),),
                            Text("How would you like to start today?",style: GoogleFonts.barlow(color: appGrey,fontSize: 15),),
                        
                            const SizedBox(height: 30,),
                            Text("Popular Choice",style: GoogleFonts.barlow(color: appBlack,fontWeight: FontWeight.w700,fontSize: 20),),
                            
                            const SizedBox(height: 40,),
                            
                            
                            Row(
                              children: [
                                data('img/student/home/book_img1.png', 'Fashionopolis', 'Dana Thomas'),
                                const SizedBox(width: 20,),
                                data('img/student/home/book_img2.png', 'Fashionopolis', 'Dana Thomas'),
                              ],
                            ),
                            const SizedBox(height: 40,),
                            Text("Newest",style: GoogleFonts.barlow(color: appBlack,fontWeight: FontWeight.w700,fontSize: 20),),
                        
                            data1('img/student/home/book_img2.png', 'Fashionopolis', 'Dana Thomas'),
                        
                        
                        
                          ],
                        ),
                      ),
                    ),
                  )
              )


            ],
          )
      ),

    );
  }
  
  Widget data(String img,String title,String subTitle){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        Container(
          height: 200,width: 130,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(img),fit: BoxFit.contain)
          ),
        ),
        const SizedBox(height: 10,),
        Text(title,style: GoogleFonts.barlow(color: appBlack,fontSize: 17,fontWeight: FontWeight.bold),),
        Text(subTitle,style: GoogleFonts.barlow(color: appBlack),)
        
      ],
    );
  }

  Widget data1(String img,String title,String subTitle){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Container(
          height: 200,width: 130,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(img),fit: BoxFit.contain)
          ),
        ),
        const SizedBox(width: 20,),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,style: GoogleFonts.barlow(color: appBlack,fontSize: 20,fontWeight: FontWeight.bold),),
            Text(subTitle,style: GoogleFonts.barlow(color: appBlack),)

          ],
        ),
        const Spacer(),
        Icon(Icons.favorite_border_rounded)

      ],
    );
  }

}
