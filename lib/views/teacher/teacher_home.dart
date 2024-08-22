import 'package:er_konnect/helper/colors.dart';
import 'package:er_konnect/module/components/complete_screen_component.dart';
import 'package:er_konnect/widgets/head.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';



class TeacherHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;;
    return Scaffold(
         backgroundColor: appBackground,
     
      body: CompleteScreenComponent(bodyWidget:      Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
              ),
             
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.arrow_back),
                            SizedBox(width: 20,),
                            Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                            Text(
                              'Dianne Russell',
                              style: GoogleFonts.barlow(fontWeight: FontWeight.w700,fontSize: 22),
                            ),
                            Row(
                              children: [
                                Text(
                             'Class incharge:',
                                  style: GoogleFonts.barlow(fontSize: 14),
                                ),
                                         Text(
                            ' Class 1  ',
                                  style: GoogleFonts.barlow(fontSize: 14,fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Text(
                              'Select your method from below',
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(height: 10),
                                      ],
                                    ),
                    
                          ],
                        ),
                      IconButton(
                    icon: Icon(Icons.person),
                    onPressed: () {
                      // Handle profile icon action
                    },
                              ),
                      ],
                    ),
                
                    OptionTile(
                      icon: Icons.class_,
                      color: Colors.orange,
                      title: 'Create Class',
                      onTap: () {
                        // Handle navigation to Create Class screen
                      },
                    ),
                    OptionTile(
                      icon: Icons.people,
                      color: Colors.green,
                      title: 'Classes',
                      onTap: () {
                   
                      },
                    ),
                    OptionTile(
                      icon: Icons.calendar_today,
                      color: Colors.red,
                      title: 'Time Table',
                      onTap: () {
                        // Handle navigation to Time Table screen
                      },
                    ),
                    OptionTile(
                      icon: Icons.person_add,
                      color: Colors.blue,
                      title: 'Add Student',
                      onTap: () {
                        // Handle navigation to Add Student screen
                      },
                    ),
                    OptionTile(
                      icon: Icons.question_answer,
                      color: Colors.purple,
                      title: 'Add Question',
                      onTap: () {
                        // Handle navigation to Add Question screen
                      },
                    ),
                      OptionTile(
                      icon: Icons.question_answer,
                      color: Colors.purple,
                      title: 'Add Content',
                      onTap: () {
                        // Handle navigation to Add Question screen
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
      )
    );
  }
}

class OptionTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final VoidCallback onTap;

  OptionTile({
    required this.icon,
    required this.color,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(width: 1,color: Colors.black.withOpacity(0.1))
        ),
        child: ListTile(
          leading: Icon(icon, color: color, size: 40),
          title: Text(title),
          trailing: Icon(Icons.arrow_forward),
          onTap: onTap,
        ),
      ),
    );
  }
}
