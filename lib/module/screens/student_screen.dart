
import 'package:er_konnect/module/components/complete_screen_component.dart';
import 'package:flutter/material.dart';

import '../components/mark_attendance_component.dart';

class StudentScreen extends StatelessWidget {
  StudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 1;
    var width = MediaQuery.of(context).size.height * 1;
    return CompleteScreenComponent(
        bodyWidget: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: height * 0.03,
        ),
        const Text(
          'Students',
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
                showCheckbox: false,
              ),
              MarkAttendanceComponent(
                imageAddress: 'assets/student_2.png',
                rollNumber: 'Roll no: 02',
                name: 'Leslie Alexander',
                email: '****@gmail.com',
                isChecked: false,
                showCheckbox: false,
              ),
              MarkAttendanceComponent(
                imageAddress: 'assets/student_3.png',
                rollNumber: 'Roll no: 03',
                name: 'Theresa Webb',
                email: '****@gmail.com',
                isChecked: false,
                showCheckbox: false,
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
                'Add Parent',
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
    ));
  }
}
