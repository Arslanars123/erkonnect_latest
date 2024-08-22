import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helper/colors.dart';


class Head extends StatelessWidget {
  final image;
  Head({this.image});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
      child: Row(
        children: [

          Image.asset("img/sel_img1.png",height: height/15,),
          SizedBox(width: Get.width*0.1,),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text('Unlock Your Potential',style: GoogleFonts.cormorant(color: appBrown,fontSize: 20),),
          )

        ],
      ),
    );
  }
}
