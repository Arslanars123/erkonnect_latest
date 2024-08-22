
// import 'package:er_konnect/module/components/choose_parent_component.dart';
// import 'package:er_konnect/module/components/complete_screen_component.dart';
// import 'package:flutter/material.dart';

// class TeacherAddStudentScreen2 extends StatelessWidget {
//   TeacherAddStudentScreen2({super.key});

//   List<String> parents = [
//     'Floyd Miles',
//     'Devon Lane',
//     'Jerome Bell',
//     'Dianne Russell',
//     'Arlene McCoy',
//     'Ralph Edwards',
//     'Bessie Cooper',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     return CompleteScreenComponent(
//       bodyWidget: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(
//               height: height * 0.025,
//             ),
//             Container(),
//             Text(
//               'Add Student',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Color(0xff3C3C43),
//                 fontWeight: FontWeight.w700,
//                 fontSize: 22,
//               ),
//             ),
//             SizedBox(
//               height: height * 0.015,
//             ),
//             Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 'Fill the form below.',
//                 style: TextStyle(
//                   color: Color(0xff767676),
//                   fontWeight: FontWeight.w400,
//                   fontSize: 14,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: height * 0.025,
//             ),
//             SizedBox(
//               height: height * 0.7,
//               child: ListView.builder(
//                   itemCount: parents.length,
//                   itemBuilder: (context, index) {
//                     return ChooseParentComponent(title: parents[index]);
//                   }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:convert';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:er_konnect/global.dart';
import 'package:er_konnect/helper/colors.dart';
import 'package:er_konnect/module/components/complete_screen_component.dart';
import 'package:er_konnect/module/components/custom_image.dart';
import 'package:er_konnect/widgets/head.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AddStudent extends StatefulWidget {


  @override
  State<AddStudent> createState() => _UpdateStudentState();
}

class _UpdateStudentState extends State<AddStudent> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController instituteIdController = TextEditingController();
  TextEditingController parentController = TextEditingController();
  TextEditingController classController = TextEditingController();
  File? selectedImage;
  bool loading = false;
  bool _isObscure = true;
  hidePassword (){
    _isObscure == false ?  setState(() {
      _isObscure = true;
      print(_isObscure);
    }):setState((){
      _isObscure = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
  
      body: Container(
        color: appBackground,
        child: CompleteScreenComponent(bodyWidget:  Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  children: [
                                      Icon(Icons.arrow_back_ios),
                                      SizedBox(width: 10,),
                                    Column(
                
                                      children: [
                                      
                                        Text(
                                          'Add Student',
                                          style: TextStyle(
                                            fontFamily: 'Barlow', // Font family
                                            fontWeight: FontWeight.w700, // Weight 700 (bold)
                                            fontSize: 22, // Font size 22px
                                          ),
                                        ),
                                         Text(
                                          'Fill the form Below',
                                          style: TextStyle(
                                            color: appBlack,
                                            fontFamily: 'Barlow', // Font family
                                            fontWeight: FontWeight.w400, // Weight 700 (bold)
                                            fontSize: 15, // Font size 22px
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 0.5, color: Color(0xFF8A8A8E)),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: TextField(
                                      controller:nameController,
                                      style: GoogleFonts.barlow(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF8A8A8E), // Set the hint text color to black
                                      ), // Change the input text color to black
                                      decoration: InputDecoration(
                                        hintText: 'Full Name',
                                        hintStyle: GoogleFonts.barlow(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF8A8A8E), // Set the hint text color to black
                                        ),
                                        prefixIcon: Icon(Icons.person),
                                        contentPadding:
                                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                                        border: InputBorder.none, // Remove the underline
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height/50),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 0.5, color: Color(0xFF8A8A8E)),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: TextField(
                                      controller:emailController,
                                      style: GoogleFonts.barlow(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF8A8A8E), // Set the hint text color to black
                                      ), // Change the input text color to black
                                      decoration: InputDecoration(
                                        hintText: 'Email',
                                        hintStyle: GoogleFonts.barlow(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF8A8A8E), // Set the hint text color to black
                                        ),
                                        prefixIcon: Icon(Icons.email_outlined),
                                        contentPadding:
                                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                                        border: InputBorder.none, // Remove the underline
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height/50),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 0.5, color: Color(0xFF8A8A8E)),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: TextField(
                                      controller:passwordController,
                                      obscureText: _isObscure,
                                      style: GoogleFonts.barlow(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF8A8A8E), // Set the hint text color to black
                                      ),
                                      decoration: InputDecoration(
                                        hintText: 'Password',
                                        hintStyle: GoogleFonts.barlow(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF8A8A8E),
                                        ),
                                        prefixIcon: Icon(Icons.lock_outline_rounded),
                                        suffixIcon: InkWell(
                                          onTap: () {
                                            hidePassword();
                                          },
                                          child: Image.asset(
                                        
                                             "assets/visibility.png" ,
                                             scale: 1.5,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        contentPadding:
                                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                                        border: InputBorder.none, // Remove the underline
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height/50),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 0.5, color: Color(0xFF8A8A8E)),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width/20),
                                          child: Container(
                    
                                            child: CustomImageView(
                                              imagePath: "assets/instititute.png",
                                              height: 18,
                                              width: 20,
                                            ),
                                          ),
                                        ),
                    
                                        Expanded(
                                          child: TextField(
                                            controller: instituteIdController,
                    
                                            style: GoogleFonts.barlow(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFF8A8A8E), // Set the hint text color to black
                                            ),
                                            decoration: InputDecoration(
                    
                                              hintText: 'Institute Code',
                                              hintStyle: GoogleFonts.barlow(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFF8A8A8E),
                                              ),
                    
                    
                                              contentPadding:
                                              EdgeInsets.symmetric(vertical: 12.0,horizontal: MediaQuery.of(context).size.width/25),
                                              border: InputBorder.none, // Remove the underline
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height/50),
                    
                                  InkWell(
                                    onTap: () {
                                      _showParentNameBottomSheet(context);
                                    },
                                    child:
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(width: 0.5, color: Color(0xFF8A8A8E)),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: TextField(
                                        enabled: false,
                    
                    
                                        style: GoogleFonts.barlow(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF8A8A8E), // Set the hint text color to black
                                        ),
                                        decoration: InputDecoration(
                                          hintText: parentController.text == "" ? "Parents" : parentController.text,
                                          hintStyle: GoogleFonts.barlow(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF8A8A8E),
                                          ),
                                          prefixIcon: Image.asset("assets/parents_2.png",scale: 1.6)
                                          ,
                                          /*suffixIcon: InkWell(
                                  onTap: () {
                                 //   hidePassword();//
                                  },
                                  child: Icon(
                                    _isObscure ? Icons.visibility : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                ),*/
                                          contentPadding:
                                          EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                                          border: InputBorder.none, // Remove the underline
                                        ),
                                      ),
                                    ),
                    
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height/50),
                    
                                  InkWell(
                                    onTap: () {
                                      _showClassNameBottomSheet(context);
                                    },
                                    child:
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(width: 0.5, color: Color(0xFF8A8A8E)),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: TextField(
                                        enabled: false,
                    
                    
                                        style: GoogleFonts.barlow(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF8A8A8E), // Set the hint text color to black
                                        ),
                                        decoration: InputDecoration(
                                          hintText: classController.text == "" ? "Class" : classController.text,
                                          hintStyle: GoogleFonts.barlow(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF8A8A8E),
                                          ),
                                          prefixIcon: Icon(Icons.person),
                                          /*suffixIcon: InkWell(
                                  onTap: () {
                                 //   hidePassword();//
                                  },
                                  child: Icon(
                                    _isObscure ? Icons.visibility : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                ),*/
                                          contentPadding:
                                          EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                                          border: InputBorder.none, // Remove the underline
                                        ),
                                      ),
                                    ),
                    
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height/50),
                                  InkWell(
                                    onTap: () {
                                      _showFilePickerBottomSheet();
                                    },
                                    child:
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(width: 0.5, color: Color(0xFF8A8A8E)),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: TextField(
                                        enabled: false,
                    
                    
                                        style: GoogleFonts.barlow(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF8A8A8E), // Set the hint text color to black
                                        ),
                                        decoration: InputDecoration(
                                          hintText: selectedImage  == null ? "Upload Picture" : selectedImage.toString(),
                                          hintStyle: GoogleFonts.barlow(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF8A8A8E),
                                          ),
                                          prefixIcon: Icon(Icons.camera_alt_outlined),
                                          /*suffixIcon: InkWell(
                                  onTap: () {
                                 //   hidePassword();//
                                  },
                                  child: Icon(
                                    _isObscure ? Icons.visibility : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                ),*/
                                          contentPadding:
                                          EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                                          border: InputBorder.none, // Remove the underline
                                        ),
                                      ),
                                    ),
                    
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height/50),
                                  loading == true
                                      ? Center(child: CircularProgressIndicator())
                                      : Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        _updateStudent();
                    
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.all(15.0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20.0),
                                        ),
                                        backgroundColor: Color(0xFFCBAC78), // Background color of the button
                                        // Text color
                                        minimumSize: Size(double.infinity, 50), // Set width to double.infinity and height to 50
                                      ),
                                      child: Text(
                                        'Add Student',
                                        style: TextStyle(
                                          color: Colors.white, // Text color
                                          fontSize: 16.0, // Font size
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height/50),
                                ],
                              ),
                            ),
                    
                          ],
                        ),
                      ),
                   ),
      ),
    );
  }

  Future<void> _showFilePickerBottomSheet() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        selectedImage = File(result.files.single.path!);
      });
    }
  }

  Future<void> _updateStudent() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      loading = true;
    });

    try {
      // Check for internet connection
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        // Handle no internet connection
        setState(() {
          loading = false;
        });
        print('No internet connection');
        return;
      }

      print('Name: ${nameController.text}');
      print('Email: ${emailController.text}');
      print('Password: ${passwordController.text}');
      print('Parents: ${parentController.text}');
      print('Name: ${classController.text}');
      print('Name: ${selectedImage}');

      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://170.249.216.178/~filterba/schooling/public/api/students-store'),
      );
      request.fields.addAll({
        'name': nameController.text,
        'email': emailController.text,
        'password': passwordController.text,
        'schoolId': prefs.getString("schoolId").toString(),
        'parent': parentController.text,
        'class': classController.text,
        'role': "student",
      });

      if (selectedImage != null) {
        request.files.add(
          await http.MultipartFile.fromPath(
            'picture',
            selectedImage!.path,
          ),
        );
      }

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        // Handle success
      } else {
        print('Error Status Code: ${response.statusCode}');
        print('Error Reason: ${response.reasonPhrase}');
        print('Error Response Body: ${await response.stream.bytesToString()}');
      }
    } catch (e) {
      print('Exception: $e');
      // Handle exceptions here
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  Future<void> _showParentNameBottomSheet(BuildContext context) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
      'POST',
      Uri.parse('http://170.249.216.178/~filterba/schooling/public/api/parents'),
    );
    request.body = json.encode({"schoolId": 1});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var responseBody = await response.stream.bytesToString();
      var jsonResponse = json.decode(responseBody);

      if (jsonResponse.containsKey("data")) {
        var parentList = jsonResponse["data"];

        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 16),
                  Text(
                    "Choose Parents",
                    style: GoogleFonts.barlow(fontSize: 17, fontWeight: FontWeight.w600,color: Color(0xFF333333)),
                  ),
                  SizedBox(width: 50,),
                  // Display parent names from API response
                  for (var parent in parentList)
                    InkWell(
                      onTap: () {
                        setState(() {
                          parentController.text = parent['name'];
                          Navigator.pop(context);
                        });
                      },
                      child: Container(
                        height: 45,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black.withOpacity(0.3), width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                             Icon(Icons.person,color: Color(0xFF333333)),
                                SizedBox(width: 5),
                                Text(parent['name'],style:   GoogleFonts.barlow(fontSize: 15, fontWeight: FontWeight.w400,color: Color(0xFF333333))),
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios,color: Color(0xFF333333),)
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        );
      } else {
        print("Invalid API response structure");
        // Handle error
      }
    } else {
      print(response.reasonPhrase);
      // Handle error
    }
  }

  Future<void> _showClassNameBottomSheet(BuildContext context) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
      'POST',
      Uri.parse('http://170.249.216.178/~filterba/schooling/public/api/grades'),
    );
    request.body = json.encode({"schoolId": 1});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var responseBody = await response.stream.bytesToString();
      var jsonResponse = json.decode(responseBody);

      if (jsonResponse.containsKey("data")) {
        var classList = jsonResponse["data"];

        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 16),
           
              Text(
                    "Choose Class",
                    style: GoogleFonts.barlow(fontSize: 17, fontWeight: FontWeight.w600,color: Color(0xFF333333)),
                  ),
                  // Display class names from API response
                  for (var className in classList)
                    InkWell(
                      onTap: () {
                        setState(() {
                          classController.text = className['name'];
                          Navigator.pop(context);
                        });
                      },
                      child: Container(
                        height: 45,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black.withOpacity(0.3), width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.school),
                                SizedBox(width: 5),
                                Text(className['name'],     style: GoogleFonts.barlow(fontSize: 15, fontWeight: FontWeight.w600,color: Color(0xFF333333)),),
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios,color:Color(0xFF333333))
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        );
      } else {
        print("Invalid API response structure");
        // Handle error
      }
    } else {
      print(response.reasonPhrase);
      // Handle error
    }
  }
}