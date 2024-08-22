import 'package:er_konnect/module/old_code/task%202/mark_attendance.dart';
import 'package:er_konnect/module/screens/student_screen.dart';
import 'package:er_konnect/module/screens/teacher_add_student_screen_2.dart';
import 'package:er_konnect/views/splash.dart';
import 'package:er_konnect/views/student/student_home.dart';
import 'package:er_konnect/views/teacher/create_class.dart';
import 'package:er_konnect/views/teacher/teacher_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(
    MyApp()
    // DevicePreview(
    //   enabled: true,
    //   tools: const [
    //     ...DevicePreview.defaultTools,
       
    //   ],
    //   builder: (context) => const MyApp(),
    // ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  Splash(),
      builder: EasyLoading.init(),
    );
  }
}
