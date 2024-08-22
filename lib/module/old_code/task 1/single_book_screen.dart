import 'package:flutter/material.dart';

class SingleBookScreen extends StatelessWidget {
  const SingleBookScreen({super.key});

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
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.03),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * 0.025,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.arrow_back,
                        color: Color(0xff1C1B1F),
                      ),
                      SizedBox(
                        width: height * 0.02,
                      ),
                      const Text(
                        'The Physics Book',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff171721),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.035,
                  ),
                  Center(
                    child: Image(
                      height: height * 0.35,
                      image: const AssetImage(
                        'assets/book_2.png',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  const Text(
                    'The Physics Book',
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff3C3C43),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.0075,
                  ),
                  const Text(
                    'Clifford A. Pickover',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff06070D),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.0075,
                  ),
                  const Text(
                    '\$12.32',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff3C3C43)),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  const Text(
                    'A spectacular visual journey through 40 years of haute couture from one of the best-known and most trend-setting brands in fashion.',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color(0xff06070D),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Container(
                    height: 56,
                    decoration: BoxDecoration(
                      color: const Color(0xffCBAC78),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(
                      child: Text('Add to cart'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
