import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CounterButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData iconData;

  const CounterButton(
      {super.key, required this.onPressed, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          iconData,
          color: Theme.of(context).colorScheme.primaryContainer,
          size: 25,
        ),
      ),
    );
  }
}
