import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:physique_forge/components/react_button.dart';
import 'package:physique_forge/controller/bmi_controller.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    BMIController bmiController = Get.put(BMIController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Obx(
                    () => Text(
                      'Your BMI is',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: bmiController.bmiStatusColor.value),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 350.h,
                child: Expanded(
                  child: Obx(
                    () => CircularPercentIndicator(
                      animationDuration: 1000,
                      footer: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          bmiController.bmiStatus.value,
                          style: TextStyle(
                            color: bmiController.bmiStatusColor.value,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      radius: 130,
                      lineWidth: 30,
                      animation: true,
                      circularStrokeCap: CircularStrokeCap.round,
                      percent: bmiController.tempBMI.value / 100,
                      center: Text(
                        '${bmiController.bmi.value}%',
                        style: TextStyle(
                          color: bmiController.bmiStatusColor.value,
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      progressColor: bmiController.bmiStatusColor.value,
                      backgroundColor:
                          bmiController.bmiStatusColor.value.withOpacity(0.2),
                    ),
                  ),
                ),
              ),
              Obx(
                () => Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      bmiController.bmiStatusAdvice.value,
                      style: TextStyle(fontSize: 18.sp),
                      maxLines: 5,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 50.h,
                child: ReactButton(
                  iconData: Icons.arrow_back_ios_new,
                  buttonName: 'Find Out More',
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
