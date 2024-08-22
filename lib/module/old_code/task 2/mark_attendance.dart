import 'package:er_konnect/widgets/head.dart';
import 'package:flutter/material.dart';

class MarkAttendance extends StatelessWidget {
  MarkAttendance({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 1;
    var width = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      backgroundColor: Color(0xff3E4648),
      appBar: AppBar(
        backgroundColor: const Color(0xff3E4648),
        automaticallyImplyLeading: false,
        toolbarHeight: height * 0.12,
        title: Head(),
      ),
      body: Padding(
        padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/30),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(width * 0.035),
              topRight: Radius.circular(width * 0.035),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.02),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.03,
                ),
                const Text(
                  'Mark Attendance',
                  style: TextStyle(
                    color: Color(0xff171721),
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                  ),
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                const Text(
                  'Date: 22 Dec 2022',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff3C3C43),
                  ),
                ),
                SizedBox(
                  height: height * 0.025,
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: ListView(
                    children: [
                      MarkAttendanceComponent(
                        imageAddress: 'assets/student_1.png',
                        rollNumber: 'Roll no: 01',
                        name: 'Dianne Russell',
                        email: '****@gmail.com',
                        isChecked: true,
                      ),
                      MarkAttendanceComponent(
                        imageAddress: 'assets/student_2.png',
                        rollNumber: 'Roll no: 02',
                        name: 'Leslie Alexander',
                        email: '****@gmail.com',
                        isChecked: false,
                      ),
                      MarkAttendanceComponent(
                        imageAddress: 'assets/student_3.png',
                        rollNumber: 'Roll no: 03',
                        name: 'Theresa Webb',
                        email: '****@gmail.com',
                        isChecked: false,
                      ),
                    ],
                  ),
                ),
        
                // const Spacer(),
                Container(),
                Center(
                  child: Container(
                    height: height * 0.07,
                    width: width * 0.25,
                    decoration: BoxDecoration(
                      color: const Color(0xffCBAC78),
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MarkAttendanceComponent extends StatefulWidget {
  MarkAttendanceComponent({
    super.key,
    required this.imageAddress,
    required this.rollNumber,
    required this.name,
    required this.email,
    required this.isChecked,
  });

  String imageAddress, rollNumber, name, email;
  bool isChecked;

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
            width: width * 0.03,
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
              Checkbox(
                value: widget.isChecked,
                onChanged: (bool? a) {
                  setState(() {
                    widget.isChecked = a!;
                  });
                },
                activeColor: Color(0xffCBAC78),
              )
            ],
          )
        ],
      ),
    );
  }
}
