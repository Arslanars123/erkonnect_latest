import 'package:flutter/material.dart';

class ParentStudentBooks extends StatelessWidget {
  ParentStudentBooks({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 1;
    var width = MediaQuery.of(context).size.width * 1;

    return Scaffold(
      backgroundColor: const Color(0xff3E4648),
      appBar: AppBar(
        backgroundColor: const Color(0xff3E4648),
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 15,
                    spreadRadius: 0,
                    color: Colors.black38,
                  ),
                ],
              ),
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/logo.png'),
              ),
            ),
            SizedBox(
              width: width * 0.025,
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
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.03),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.025,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.arrow_back,
                    size: 24,
                    color: Color(0xff1C1B1F),
                  ),
                  SizedBox(
                    width: width * 0.025,
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'New Books',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color(0xff171721),
                          fontSize: 22,
                        ),
                      ),
                      Text(
                        'Select book from below',
                        style: TextStyle(
                          color: Color(0xff3C3C43),
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.025,
              ),
              const Text(
                'Popular Choice',
                style: TextStyle(
                  color: Color(0xff3C3C43),
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: height * 0.025,
              ),
              Container(
                margin: EdgeInsets.only(bottom: height * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Image(
                      height: 100,
                      fit: BoxFit.cover,
                      image: AssetImage('assets/newest.png'),
                    ),
                    SizedBox(
                      width: width * 0.050,
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Yves Saint Laurent',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff3C3C43),
                          ),
                        ),
                        Text(
                          'Suzy Menkes ',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff06070D),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: height * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Image(
                      height: 100,
                      fit: BoxFit.cover,
                      image: AssetImage('assets/book_2.png'),
                    ),
                    SizedBox(
                      width: width * 0.050,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'The Book of Signs',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff3C3C43),
                          ),
                        ),
                        const Text(
                          'Rudolf Koch ',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff06070D),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: Color(0xffFFC41F),
                            ),
                            Icon(
                              Icons.star,
                              color: Color(0xffFFC41F),
                            ),
                            Icon(
                              Icons.star,
                              color: Color(0xffFFC41F),
                            ),
                            Icon(
                              Icons.star,
                              color: Color(0xffFFC41F),
                            ),
                            Icon(
                              Icons.star,
                              color: Color(0xffEDEDEF),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                height: height * 0.075,
                decoration: BoxDecoration(
                  color: const Color(0xffCBAC78),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                  child: Text(
                    'Buy Books',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
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
    );
  }
}
