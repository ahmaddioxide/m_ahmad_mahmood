import 'package:flutter/material.dart';
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
        borderRadius: 20,
        width: 100,
        height: 50,
        backgroundColor: Colors.grey[200]!,
        borderColor: Colors.white60,
        borderWidth: 1,
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
                  blurRadius: 1,
                ),
              ],
            ),
          ),
        ));
  }
}
