import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:physique_forge/components/height_selector.dart';
import 'package:physique_forge/components/primary_button.dart';
import 'package:physique_forge/components/theme_changer_button.dart';
import 'package:physique_forge/components/weight_selector.dart';
import 'package:physique_forge/controller/theme_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.put(ThemeController());
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
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
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
                  const PrimaryButton(iconData: Icons.male, buttonName: 'MALE'),
                  SizedBox(width: 15.w),
                  const PrimaryButton(
                      iconData: Icons.female, buttonName: 'Female')
                ],
              ),
              SizedBox(height: 20.h),
              const Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HeightSelector(),
                    Expanded(
                      child: Column(
                        children: [
                          WeightSelector(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
