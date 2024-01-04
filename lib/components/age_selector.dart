import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:physique_forge/controller/bmi_controller.dart';

import 'counter_button.dart';

class AgeSelector extends StatelessWidget {
  const AgeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    BMIController bmiController = Get.put(BMIController());

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.primaryContainer),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'AGE',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                    fontSize: 18.sp),
              ),
            ],
          ),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${bmiController.age.value}',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                      fontSize: 70.sp,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CounterButton(
                  onPressed: () {
                    bmiController.age.value++;
                  },
                  iconData: Icons.add),
              SizedBox(width: 25.w),
              CounterButton(
                  onPressed: () {
                    if (bmiController.age.value > 1) {
                      bmiController.age.value--;
                    }
                  },
                  iconData: Icons.remove),
            ],
          ),
        ],
      ),
    );
  }
}
