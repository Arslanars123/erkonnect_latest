import 'package:er_konnect/helper/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class MyButton extends StatelessWidget {
  Function() onTap;
  String text;
  MyButton({super.key,required this.onTap,required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 50,
      child: ElevatedButton(
          onPressed: onTap,
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(appBrown),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              )
            )
          ),
          child: Text(text,style: GoogleFonts.barlow(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)
      ),
    );
  }
}
