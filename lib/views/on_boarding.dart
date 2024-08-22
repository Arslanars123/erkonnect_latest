import 'package:dots_indicator/dots_indicator.dart';
import 'package:er_konnect/controllers/on_boarding_controller.dart';
import 'package:er_konnect/helper/colors.dart';
import 'package:er_konnect/views/selection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding/onboarding.dart';
import 'package:video_player/video_player.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {

  OnBoardingController controller=Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackground,

      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [

            PageView(
              children: const [
                Screen1(),
                Screen2(),
                Screen3(),
              ],
              onPageChanged: (value) {
                controller.setIndex(value);
              },
            ),

            // Onboarding(
            //   swipeableBody: const [
            //     Screen1(),
            //     Screen2(),
            //     Screen3(),
            //   ],
            //   buildFooter: (context, netDragDistance, pagesLength, currentIndex, setIndex, slideDirection) {
            //     return  setState(() {
            //       index=currentIndex;
            //     });
            //   },
            //
            // ),
            
            Positioned(
              bottom: 40,
                left: 20,
                child: GestureDetector(
                  onTap: () {
                    Get.to(()=>const Selection(),transition: Transition.downToUp,duration: const Duration(seconds: 1));
                  },
                    child: Text("Skip",style: GoogleFonts.barlow(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),)
                )
            ),
            Positioned(
              bottom: Get.height*0.16,
                child: Obx(() {
                  return DotsIndicator(
                    position: controller.index.value,
                    dotsCount: 3,
                    decorator: DotsDecorator(
                        activeColor: Colors.white,
                        color: appGrey
                    ),
                  );
                },)
            )
            
          ],
          
          
        ),
      )

    );
  }
}

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {

  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('img/videos/video1.mp4')
      ..initialize().then((_) {
        setState(() {}); // Ensure the first frame is shown after the video is initialized
      })
      ..setLooping(true)
      ..play();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SafeArea(
         child:  _controller!.value.isInitialized?
         VideoPlayer(_controller!) :
         Center(child: CircularProgressIndicator(color: appBrown,)),
       ),
    );
  }
}


class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('img/videos/video2.mp4')
      ..initialize().then((_) {
        setState(() {}); // Ensure the first frame is shown after the video is initialized
      })
      ..setLooping(true)
      ..play();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller?.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:  _controller!.value.isInitialized?
        VideoPlayer(_controller!) :
        Center(child: CircularProgressIndicator(color: appBrown,)),
      ),
    );
  }
}


class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('img/videos/video2.mp4')
      ..initialize().then((_) {
        setState(() {}); // Ensure the first frame is shown after the video is initialized
      })
      ..setLooping(true)
      ..play();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller?.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:  _controller!.value.isInitialized?
        VideoPlayer(_controller!) :
        Center(child: CircularProgressIndicator(color: appBrown,)),
      ),
    );
  }
}



