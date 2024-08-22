import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List popularBookImageAddress = [
    'assets/book_1.png',
    'assets/book_2.png',
    'assets/book_2.png'
  ];
  List popularBookTitle = ['Fashionopolis', 'The Physics Book', 'Calligraphy'];
  List popularBookWriter = [
    'Dana Thomas',
    'Clifford A. Pickover',
    'June & Lucy'
  ];

  List newestBookImageAddress = [
    'assets/newest.png',
    'assets/newest.png',
    'assets/newest.png'
  ];
  List newestBookTitle = [
    'Yves Saint Laurent',
    'Yves Saint Laurent',
    'Yves Saint Laurent'
  ];
  List newestBookWriter = [
    'Suzy Menkes',
    'Suzy Menkes',
    'Suzy Menkes',
  ];

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
        child: SingleChildScrollView(
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                        3,
                        (index) => Container(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image(
                                      height: 200,
                                      // width: 160,
                                      fit: BoxFit.fitWidth,
                                      image: AssetImage(
                                        popularBookImageAddress[index]
                                            .toString(),
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.025,
                                    ),
                                    Text(
                                      popularBookTitle[index].toString(),
                                      style: const TextStyle(
                                          fontSize: 17,
                                          color: Color(0xff3C3C43),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      popularBookWriter[index].toString(),
                                      style: const TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff06070D),
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                  ),
                ),
                SizedBox(
                  height: height * 0.025,
                ),
                const Text(
                  'Newest',
                  style: TextStyle(
                      fontSize: 19,
                      color: Color(0xff3C3C43),
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: height * 0.025,
                ),
                Column(
                    children: List.generate(
                  3,
                  (index) => Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                            height: 150,
                            fit: BoxFit.cover,
                            image: AssetImage(newestBookImageAddress[index]),
                          ),
                          SizedBox(
                            width: width * 0.025,
                          ),
                          SizedBox(
                            width: width * 0.025,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: height * 0.025,
                              ),
                              Text(
                                newestBookTitle[index],
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff3C3C43),
                                ),
                              ),
                              Text(
                                newestBookWriter[index],
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff06070D),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: height * 0.025,
                                ),
                                const Align(
                                    alignment: Alignment.topRight,
                                    child: Icon(Icons.save)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.025,
                      )
                    ],
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
