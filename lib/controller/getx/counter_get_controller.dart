import 'package:get/get.dart';

class CounterGetController extends GetxController{
  RxInt count = 0.obs;

  void increment(){
    count.value++;
  }

  void decrement(){
    count.value--;
  }
}