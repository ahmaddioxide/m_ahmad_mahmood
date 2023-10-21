import 'dart:math';

import 'package:flutter/material.dart';

class SteeringWheel extends StatefulWidget {
  const SteeringWheel({Key? key}) : super(key: key);

  @override
  _SteeringWheelState createState() => _SteeringWheelState();
}

class _SteeringWheelState extends State<SteeringWheel> {
  double _angle = 0;
  Offset? _startRotationPoint;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onScaleStart: (details) {
          _startRotationPoint = _startRotationPoint ?? details.focalPoint;
        },
        onScaleUpdate: (details) {
          if (_startRotationPoint != null) {
            Offset currentRotationPoint = details.focalPoint;
            double angleInRadians =
            atan2(currentRotationPoint.dy - _startRotationPoint!.dy,
                currentRotationPoint.dx - _startRotationPoint!.dx);

            double newAngle = angleInRadians * 180 /pi/60;

            setState(() {
              _angle = newAngle;
            });
          }
        },
        onScaleEnd: (details) {
          _startRotationPoint = null;
        },
        child: Center(
          child: Transform.rotate(
            angle: _angle,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey,
                  style: BorderStyle.solid,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 10,
                    width: 40,
                    color: Colors.red,
                  ),
                  Container(
                    height: 10,
                    width: 40,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}