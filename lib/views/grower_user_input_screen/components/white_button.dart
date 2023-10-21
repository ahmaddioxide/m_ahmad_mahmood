import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m_ahmad_mahmood/views/theme/colors.dart';
import 'package:neumorphic_button/neumorphic_button.dart';

class WhiteButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool? isSelected;

  const WhiteButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
        borderRadius: 20.r,
        width: 100.w,
        height: 45.h,
        backgroundColor: Colors.white38,
        borderColor: Colors.white54,
        borderWidth: 0.7,
        bottomRightShadowColor: Colors.grey.shade500,
        topLeftShadowColor: Colors.white,
        onTap: () {
          onPressed;
        },
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: AppColors().grey,
              shadows: [
                Shadow(
                  color: Colors.grey.shade600,
                  offset: const Offset(0.5, 0.7),
                  blurRadius: 1.r,
                ),
              ],
            ),
          ),
        ));
  }
}
