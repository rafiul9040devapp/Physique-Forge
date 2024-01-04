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
  RxString bmiStatusAdvice = ''.obs;
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
      bmiStatusAdvice.value =
          'Your BMI is ${tempBMI.value}, indicating you are underweight. It\'s important to ensure you\'re getting enough nutrition. Consider consulting with a healthcare professional for guidance.';
      bmiStatusColor.value = const Color(0xffFFB800);
    } else if (tempBMI.value <= 24.9) {
      bmiStatus.value = 'Normal';
      bmiStatusAdvice.value =
          'Your BMI is ${tempBMI.value}, indicating your weight is in the Normal category for adults of your height. For your height, a normal weight range would be from 53.5 to 72 kilograms. Maintaining a healthy weight may reduce the risk of chronic diseases associated with overweight and obesity.';
      bmiStatusColor.value = const Color(0xff00CA39);
    } else if (tempBMI.value <= 29.9) {
      bmiStatus.value = 'OverWeight';
      bmiStatusAdvice.value =
          'Your BMI is ${tempBMI.value}, indicating you are overweight. It\'s essential to maintain a healthy weight for overall well-being. Consider adopting a balanced diet and engaging in regular physical activity. Consult with a healthcare professional for personalized advice.';
      bmiStatusColor.value = const Color(0xFFFFA500);
    } else if (tempBMI.value <= 34.9) {
      bmiStatus.value = 'Obese - Class I';
      bmiStatusAdvice.value =
          'Your BMI is ${tempBMI.value}, indicating you are in the Obese - Class I category. Obesity can pose health risks. It\'s advisable to seek guidance from a healthcare professional to develop a plan for weight management.';
      bmiStatusColor.value = const Color(0xfff57e07);
    } else if (tempBMI.value <= 39.9) {
      bmiStatus.value = 'Obese - Class II';
      bmiStatusAdvice.value =
          'Your BMI is ${tempBMI.value}, indicating you are in the Obese - Class II category. Obesity at this level can have significant health implications. Consult with a healthcare professional to discuss strategies for weight management and overall health improvement.';
      bmiStatusColor.value = const Color(0xFFFF5252);
    } else {
      bmiStatus.value = 'Obese - Class III';
      bmiStatusAdvice.value =
          'Your BMI is ${tempBMI.value}, indicating you are in the Obese - Class III category. This level of obesity can have severe health consequences. It\'s crucial to seek immediate guidance from a healthcare professional to address weight-related health risks.';
      bmiStatusColor.value = const Color(0xFFFF0000);
    }
  }
}
