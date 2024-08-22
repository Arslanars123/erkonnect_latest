import 'package:flutter/material.dart';

class CompleteScreenComponent extends StatelessWidget {
  CompleteScreenComponent({super.key, required this.bodyWidget});

  Widget bodyWidget;
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
        title: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                // boxShadow: [
                //   BoxShadow(
                //     blurRadius: 15,
                //     spreadRadius: 0,
                //     color: Colors.black38,
                //   ),
                // ],
              ),
              child: const CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('img/sel_img1.png',),
              ),
            ),
            SizedBox(
              width: width/16,
            ),
            Column(
              children: [
                SizedBox(
                  height: height * 0.03,
                ),
                const Text(
                  'Unlock Your Potential',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xffCBAC78),
                  ),
                ),
              ],
            ),
          ],
        ),
        centerTitle: false,
        actions: [
          GestureDetector(
            onTap: () {},
            child: const CircleAvatar(
              backgroundImage: AssetImage('assets/profile_picture.png'),
            ),
          ),
          SizedBox(
            width: width * 0.03,
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(width * 0.035),
            topRight: Radius.circular(width * 0.035),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.02),
          child: bodyWidget,
        ),
      ),
    );
  }
}
