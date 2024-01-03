import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BMIController extends GetxController {
  RxString genderStatus = 'MALE'.obs;
  RxInt weight = 12.obs;
  RxInt age = 12.obs;
  RxDouble height = 100.0.obs;
  RxDouble tempBMI = 0.0.obs;
  RxString bmi = ''.obs;
  RxString bmiStatus = ''.obs;
  Rx<Color> bmiStatusColor = const Color(0xff246AFE).obs;

  void genderHandler(String gender) {
    genderStatus.value = gender;
  }

  void calculateBMI() {
    var heightInMeter = height / 100;
    tempBMI.value = weight / (heightInMeter * heightInMeter);
    bmi.value = tempBMI.toStringAsFixed(1);
    tempBMI.value = double.parse(bmi.value);
    findTheBmiStatus();
  }

  void findTheBmiStatus() {
    if (tempBMI.value <= 18.5) {
      bmiStatus.value = 'UnderWeight';
      bmiStatusColor.value = const Color(0xffFFB800);
    }
    if (tempBMI.value > 18.5 && tempBMI.value <= 24.9) {
      bmiStatus.value = 'Normal';
      bmiStatusColor.value = const Color(0xff00CA39);
    }
    if (tempBMI.value >= 25 && tempBMI.value <= 29.9) {
      bmiStatus.value = 'OverWeight';
      bmiStatusColor.value = const Color(0xffFF5858);
    }
    if (tempBMI.value >= 30 && tempBMI.value <= 34.9) {
      bmiStatus.value = 'OBESE';
      bmiStatusColor.value = const Color(0xffFF0000);
    }
    if (tempBMI.value >= 35) {
      bmiStatus.value = 'Extremely OBESE';
      bmiStatusColor.value = const Color(0xff000000);
    }
  }
}
