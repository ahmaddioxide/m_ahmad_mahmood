import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomToggleButton extends StatefulWidget {
  final double width;
  final double height;

  final String leftDescription;
  final String rightDescription;

  final Color inactiveTextColor;
  final Color activeTextColor;

  final double _leftToggleAlign = -1;
  final double _rightToggleAlign = 1;

  final VoidCallback onLeftToggleActive;
  final VoidCallback onRightToggleActive;

  const CustomToggleButton(
      {Key? key,
      required this.width,
      required this.height,
      required this.activeTextColor,
      required this.inactiveTextColor,
      required this.leftDescription,
      required this.rightDescription,
      required this.onLeftToggleActive,
      required this.onRightToggleActive})
      : super(key: key);

  @override
  State<CustomToggleButton> createState() => _CustomToggleButtonState();

}

class _CustomToggleButtonState extends State<CustomToggleButton> {
  double _toggleXAlign = 1;

  late Color _leftDescriptionColor;
  late Color _rightDescriptionColor;

  @override
  void initState() {
    super.initState();

    _leftDescriptionColor = widget.activeTextColor;
    _rightDescriptionColor = widget.inactiveTextColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            offset: const Offset(0.5, 0.7),
            blurRadius: 2,
          ),
        ],
        color: Colors.grey.shade200,
        borderRadius:  BorderRadius.all(
          Radius.circular(12.0.r),
        ),
        border: Border.all(color: Colors.white, width: 1.7.w),
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            alignment: Alignment(_toggleXAlign, 0),
            duration: const Duration(milliseconds: 300),
            child: Container(
              width: widget.width * 0.5,
              height: widget.height * 0.9,
              decoration:  BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(12.r),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.5, 0.7),
                    blurRadius: 1,
                  ),
                ],
              ),
              child: Center(
                  child: Container(
                height: widget.height * 0.35,
                width: widget.width * 0.01,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius:  BorderRadius.all(
                    Radius.circular(12.r),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      offset: const Offset(0.5, 0.7),
                      blurRadius: 1,
                    ),
                  ],
                ),
              )),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(
                () {
                  _toggleXAlign = widget._leftToggleAlign;

                  _leftDescriptionColor = widget.inactiveTextColor;
                  _rightDescriptionColor = widget.activeTextColor;
                },
              );

              widget.onRightToggleActive();
            },
            child: Align(
              alignment: const Alignment(-1, 0),
              child: Container(
                width: widget.width * 0.4,
                // height: widget.height*0.6,
                alignment: Alignment.center,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.r),
                  ),
                  color: Colors.transparent,
                ),
                child: Text(
                  widget.leftDescription,
                  style: TextStyle(
                      color: _leftDescriptionColor,
                      fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(
                () {
                  _toggleXAlign = widget._rightToggleAlign;

                  _leftDescriptionColor = widget.activeTextColor;
                  _rightDescriptionColor = widget.inactiveTextColor;
                },
              );

              widget.onLeftToggleActive();
            },
            child: Align(
              alignment: const Alignment(1, 0),
              child: Container(
                width: widget.width * 0.4,
                alignment: Alignment.center,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.r),
                  ),
                  color: Colors.transparent,
                ),
                child: Text(
                  widget.rightDescription,
                  style: TextStyle(
                      color: _rightDescriptionColor,
                      fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



