import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../helper/colors.dart';
import '../../widgets/head.dart';


class StudentChat extends StatefulWidget {
  const StudentChat({super.key});

  @override
  State<StudentChat> createState() => _StudentChatState();
}

class _StudentChatState extends State<StudentChat> {
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

                            Container(
                              height: 50,width: 50,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(image: AssetImage('img/noImage.jpg'),fit: BoxFit.cover)
                              ),
                            ),
                            const SizedBox(width: 20,),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("James Trenton",style: GoogleFonts.barlow(color: appBlack,fontWeight: FontWeight.bold,fontSize: 20),),
                                  Text('Last online 2h ago',style: GoogleFonts.barlow(color: appBlack,fontSize: 13),)
                                ],
                              ),
                            ),

                            Icon(Icons.search,color: appBlack,)





                          ],
                        ),

                        const SizedBox(height: 50,),
                        Expanded(
                            child: Column(
                              children: [

                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: appBrown
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    child: Text("Hey, just wondering when you think the next course is coming out?",
                                      style: GoogleFonts.barlow(color: Colors.white,fontSize: 17),textAlign: TextAlign.start,),
                                  ),
                                ),

                                const SizedBox(height: 20,),

                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    child: Text("I'm almost done with the introduction title screens, should be within the next 3 weeks hopefully ✌️",
                                      style: GoogleFonts.barlow(color: Colors.black,fontSize: 17),textAlign: TextAlign.start,),
                                  ),
                                ),
                                const SizedBox(height: 20,),

                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: appBrown
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    child: Text("Sweet, thanks!",
                                      style: GoogleFonts.barlow(color: Colors.white,fontSize: 17),textAlign: TextAlign.start,),
                                  ),
                                ),




                              ],
                            )
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Compose a message"
                                  ),
                                )
                            ),
                            Icon(Icons.edit_note_outlined,color: appBlack,size: 30,),
                            const SizedBox(width: 20,),
                            Icon(Icons.camera_alt_outlined,color: appBlack,size: 30,),
                          ],
                        )





                      ],
                    ),
                  )
              )


            ],
          )
      ),

    );
  }
}
