import 'package:get/get.dart';

class OnBoardingController extends GetxController{

  RxInt index=0.obs;


  setIndex(int value){
    index.value=value;

  }

}