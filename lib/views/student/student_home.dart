import 'package:er_konnect/helper/colors.dart';
import 'package:er_konnect/views/student/bottom_nav/student_chat_nav.dart';
import 'package:er_konnect/views/student/bottom_nav/student_contact_nav.dart';
import 'package:er_konnect/views/student/bottom_nav/student_home_nav.dart';
import 'package:er_konnect/views/student/bottom_nav/student_profile_nav.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class StudentHome extends StatefulWidget {
  var data;
   StudentHome({this.data});

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {

  int index=0;
 

  @override
  Widget build(BuildContext context) {
    print(widget.data);
    print("here student data");
     List screens=[
    StudentHomeNav(data:widget.data),
    //  StudentContactNav(data:widget.data),
    //  StudentChatNav(data:widget.data),
    //  StudentProfileNav(data:widget.data)
  ];
    return Scaffold(
      
      body: screens[index],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
        child: GNav(
          selectedIndex: index,
          onTabChange:  (value) {
            setState(() {
              index=value;
            });
          },
            curve: Curves.easeInCubic,
            duration: const Duration(milliseconds: 900),
            backgroundColor: Colors.white,
            activeColor: Colors.white,
            color: appGrey,
            tabBackgroundColor: appBrown,
            padding: const EdgeInsets.all(10),
            tabs: const [
              GButton(icon: Icons.home_outlined,text: "Home",),
              GButton(icon: Icons.email_outlined,text: "Contact Us",),
              GButton(icon: Icons.chat_outlined,text: "Chat",),
              GButton(icon: Icons.account_circle_outlined,text: "Profile",),
            ]
        ),
      ),

    );
  }
}

