import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:physique_forge/components/age_selector.dart';
import 'package:physique_forge/components/height_selector.dart';
import 'package:physique_forge/components/primary_button.dart';
import 'package:physique_forge/components/react_button.dart';
import 'package:physique_forge/components/theme_changer_button.dart';
import 'package:physique_forge/components/weight_selector.dart';
import 'package:physique_forge/controller/bmi_controller.dart';
import 'package:physique_forge/controller/theme_controller.dart';
import 'package:physique_forge/pages/result_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    BMIController bmiController = Get.put(BMIController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const ThemeChangerButton(),
              Row(
                children: [
                  Text(
                    'Welcome 😊',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'BMI Calculator',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  PrimaryButton(
                      onPressed: () {
                        bmiController.genderHandler('MALE');
                      },
                      iconData: Icons.male,
                      buttonName: 'MALE'),
                  SizedBox(width: 15.w),
                  PrimaryButton(
                      onPressed: () {
                        bmiController.genderHandler('FEMALE');
                      },
                      iconData: Icons.female,
                      buttonName: 'FEMALE')
                ],
              ),
              SizedBox(height: 20.h),
              const Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    HeightSelector(),
                    SizedBox(width: 20),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          WeightSelector(),
                          AgeSelector(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                height: 50.h,
                child: ReactButton(
                    onPressed: () {
                      bmiController.calculateBMI();
                      Get.to(ResultPage());
                    },
                    iconData: Icons.done_all_rounded,
                    buttonName: 'Lets Go'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
