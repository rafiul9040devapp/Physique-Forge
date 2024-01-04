import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:physique_forge/controller/bmi_controller.dart';

class PrimaryButton extends StatelessWidget {
  final IconData iconData;
  final String buttonName;
  final VoidCallback onPressed;

  const PrimaryButton(
      {super.key,
      required this.iconData,
      required this.buttonName,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    BMIController bmiController = Get.put(BMIController());
    return Expanded(
      child: InkWell(
        onTap: onPressed,
        child: Obx(
          () => Container(
            height: 50.h,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: bmiController.genderStatus.value == buttonName
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  iconData,
                  color: bmiController.genderStatus.value == buttonName
                      ? Theme.of(context).colorScheme.primaryContainer
                      : Theme.of(context).colorScheme.primary,
                ),
                SizedBox(width: 10.w),
                Text(
                  buttonName,
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: bmiController.genderStatus.value == buttonName
                          ? Theme.of(context).colorScheme.primaryContainer
                          : Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5.sp),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
