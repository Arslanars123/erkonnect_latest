import 'package:er_konnect/module/components/complete_screen_component.dart';
import 'package:er_konnect/module/components/teacher_add_student_text_field_component.dart';
import 'package:flutter/material.dart';

class TeacherAddStudentScreen extends StatelessWidget {
  const TeacherAddStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return CompleteScreenComponent(
      bodyWidget: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: height * 0.025,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_back_ios_new_outlined,
                ),
                SizedBox(
                  width: width * 0.025,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add Student',
                      style: TextStyle(
                        color: Color(0xff171721),
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                      ),
                    ),
                    Text(
                      'Fill the form below.',
                      style: TextStyle(
                        color: Color(0xff3C3C43),
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: height * 0.025,
            ),
            TeacherAddStudentTextFieldComponent(
              hintText: 'Full Name',
              prefixIcon: Icons.person,
            ),
            TeacherAddStudentTextFieldComponent(
              hintText: 'Email',
              prefixIcon: Icons.email,
            ),
            TeacherAddStudentTextFieldComponent(
              hintText: 'Password',
              prefixIcon: Icons.lock,
              suffixIcon: Icons.remove_red_eye_outlined,
              showSuffixIcon: true,
            ),
            TeacherAddStudentTextFieldComponent(
              hintText: 'Institute ID',
              prefixIcon: Icons.add,
              showImageInsteadOfPrefix: true,
              // addressOfImageInsteadOfPrefix: 'assets/universal_currency.png',
            ),
            TeacherAddStudentTextFieldComponent(
              hintText: 'Parent',
              prefixIcon: Icons.lock,
              suffixIcon: Icons.arrow_drop_down,
              showImageInsteadOfPrefix: true,
              // addressOfImageInsteadOfPrefix: 'assets/escalator_warning.png',
              showSuffixIcon: true,
            ),
            SizedBox(
              height: height * 0.25,
            ),
          ],
        ),
      ),
    );
  }
}
