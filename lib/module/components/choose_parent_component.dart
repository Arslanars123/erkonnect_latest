import 'package:flutter/material.dart';

class ChooseParentComponent extends StatelessWidget {
  ChooseParentComponent({super.key, required this.title});

  String title;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: height * 0.025,
        horizontal: width * 0.025,
      ),
      margin: EdgeInsets.only(
        bottom: height * 0.0115,
      ),
      decoration: BoxDecoration(
        color: Color(0xffF8F8F8),
        borderRadius: BorderRadius.circular(
          width * 0.04,
        ),
      ),
      child: Row(
        children: [
          Image(
            height: height * 0.03,
            width: height * 0.03,
            image: AssetImage('assets/escalator_warning_black.png'),
          ),
          SizedBox(
            width: width * 0.025,
          ),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: Color(0xff333333),
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Image(
            height: height * 0.02,
            width: height * 0.02,
            image: AssetImage('assets/arrow_forward.png'),
          ),
        ],
      ),
    );
  }
}
