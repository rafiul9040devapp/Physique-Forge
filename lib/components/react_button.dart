import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ReactButton extends StatelessWidget {
  final IconData iconData;
  final String buttonName;
  final VoidCallback onPressed;

  const ReactButton(
      {super.key,
      required this.iconData,
      required this.buttonName,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 50.h,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              SizedBox(width: 10.w),
              Text(
                buttonName,
                style: TextStyle(
                    fontSize: 18.sp,
                    color: Theme.of(context).colorScheme.primaryContainer,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
