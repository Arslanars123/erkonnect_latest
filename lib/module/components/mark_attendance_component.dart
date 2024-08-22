import 'package:flutter/material.dart';

class MarkAttendanceComponent extends StatefulWidget {
  MarkAttendanceComponent({
    super.key,
    required this.imageAddress,
    required this.rollNumber,
    required this.name,
    required this.email,
    required this.isChecked,
    this.showCheckbox = true,
  });

  String imageAddress, rollNumber, name, email;
  bool isChecked;
  bool showCheckbox;
  @override
  State<MarkAttendanceComponent> createState() =>
      _MarkAttendanceComponentState();
}

class _MarkAttendanceComponentState extends State<MarkAttendanceComponent> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.01, vertical: height * 0.01),
      margin: EdgeInsets.only(bottom: height * 0.0125),
      decoration: BoxDecoration(
        color: Color(0xffF8F8F8),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: const Color(0xffE8EAEB),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            child: Image(
              image: AssetImage(
                widget.imageAddress,
              ),
            ),
          ),
          SizedBox(
            width: width * 0.01,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.rollNumber,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color(
                      0xff8A8A8E,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Text(
                  widget.name,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Color(
                      0xff171721,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Email:  ',
                        style: TextStyle(
                          color: Color(0xff8A8A8E),
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                      TextSpan(
                        text: widget.email,
                        style: TextStyle(
                          color: Color(0xff171721),
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              widget.showCheckbox
                  ? Checkbox(
                      value: widget.isChecked,
                      onChanged: (bool? a) {
                        setState(() {
                          widget.isChecked = a!;
                        });
                      },
                      activeColor: Color(0xffCBAC78),
                    )
                  : Container(),
            ],
          )
        ],
      ),
    );
  }
}
