import 'package:flutter/material.dart';

class TeacherAddStudentTextFieldComponent extends StatelessWidget {
  TeacherAddStudentTextFieldComponent({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.showSuffixIcon = false,
    this.suffixIcon = Icons.add,
    this.showImageInsteadOfPrefix = false,
    this.addressOfImageInsteadOfPrefix = '',
  });

  String hintText;
  IconData prefixIcon;
  bool showSuffixIcon;
  IconData suffixIcon;
  bool showImageInsteadOfPrefix;
  String addressOfImageInsteadOfPrefix;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
        bottom: height * 0.015,
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(width * 0.02),
            borderSide: BorderSide(
              color: Color(0xffE4E6E8),
            ),
          ),
          prefixIcon: showImageInsteadOfPrefix
              ? Image(
                  height: height * 0.0265,
                  width: height * 0.0265,
                  image: AssetImage(
                    addressOfImageInsteadOfPrefix,
                  ),
                )
              : Icon(
                  prefixIcon,
                  color: Color(0xff8A8A8E),
                ),
          suffixIcon: showSuffixIcon ? Icon(suffixIcon) : null,
          suffixIconColor: Color(0xff3C3C43),
          hintStyle: TextStyle(
            color: Color(0xff8A8A8E),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
