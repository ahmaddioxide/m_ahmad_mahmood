import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RotateAbleWheelSelector extends StatefulWidget {
  final Function onValueUpdated;

  const RotateAbleWheelSelector({Key? key, required this.onValueUpdated})
      : super(key: key);

  @override
  State<RotateAbleWheelSelector> createState() =>
      _RotateAbleWheelSelectorState();
}

class _RotateAbleWheelSelectorState extends State<RotateAbleWheelSelector> {
  double _angle = 0;
  Offset? _startRotationPoint;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onScaleStart: (details) {
        _startRotationPoint = _startRotationPoint ?? details.focalPoint;
      },
      onScaleUpdate: (details) {
        if (_startRotationPoint != null) {
          Offset currentRotationPoint = details.focalPoint;
          double angleInRadians = atan2(
              currentRotationPoint.dy - _startRotationPoint!.dy,
              currentRotationPoint.dx - _startRotationPoint!.dx);

          double newAngle = angleInRadians;

          //add value on rotation
          int value = (newAngle * 200).round();
          if (value < 0) value = 360 + value;
          widget.onValueUpdated(value);
          debugPrint('newValue: $value');
          // debugPrint('newAngle: ${value.}');
          setState(() {
            _angle = newAngle;
          });
        }
      },
      onScaleEnd: (details) {
        _startRotationPoint = null;
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          shape: BoxShape.circle,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5,
              offset: Offset(0, 2),
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: Padding(
          padding:  EdgeInsets.all(18.r),
          child: Center(
            child: Transform.rotate(
              angle: _angle,
              child: Container(
                height: 180.h,
                width: 180.w,
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  shape: BoxShape.circle,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2,
                      blurStyle: BlurStyle.outer,
                    ),
                  ],
                ),
                child: Padding(
                  padding:  EdgeInsets.all(12.r),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 10.h,
                        width: 30.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 1,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 10.h,
                        width: 30.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 1,
                              offset: Offset(2, 0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
