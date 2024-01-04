import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:physique_forge/controller/bmi_controller.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class HeightSelector extends StatelessWidget {
  const HeightSelector({super.key});

  @override
  Widget build(BuildContext context) {
    BMIController bmiController = Get.put(BMIController());

    return Flexible(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Height (CM)',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Obx(
                () => SfSlider.vertical(
                  value: bmiController.height.value,
                  min: 50,
                  max: 250,
                  interval: 25,
                  showTicks: true,
                  showLabels: true,
                  enableTooltip: true,
                  minorTicksPerInterval: 5,
                  activeColor: Theme.of(context).colorScheme.primary,
                  inactiveColor:
                      Theme.of(context).colorScheme.primary.withOpacity(0.2),
                  onChanged: (dynamic value) {
                    bmiController.height.value = value;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
