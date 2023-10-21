import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m_ahmad_mahmood/views/grower_user_input_screen/components/custom_toggle_button.dart';
import 'package:m_ahmad_mahmood/views/grower_user_input_screen/components/rotateable_wheel.dart';
import 'package:m_ahmad_mahmood/views/grower_user_input_screen/components/white_button.dart';
import 'package:m_ahmad_mahmood/views/theme/colors.dart';

class GrowerInputScreen extends StatelessWidget {
  const GrowerInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Tell Us More'.toUpperCase(),
          style: GoogleFonts.inter(
            color: AppColors().black,
            fontSize: 30.sp,
            fontWeight: FontWeight.w300,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors().grey,
          ),
          onPressed: () {},
        ),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 12.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: double.infinity),
               SizedBox(height: 5.h),
              Text(
                'Besides rainfall, how much irrigated water can you use for this crop?',
                style: GoogleFonts.libreFranklin(
                  color: AppColors().black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
               SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  WhiteButton(text: 'Unlimited', onPressed: () {}),
                  WhiteButton(text: 'None', onPressed: () {}),
                ],
              ),
               SizedBox(height: 10.h),
              Text(
                'or select an amount using the dial',
                style: GoogleFonts.libreFranklin(
                  color: AppColors().black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
               SizedBox(height: 20.h),
              CustomToggleButton(
                width: 400.w,
                height: 45.h,
                activeTextColor: AppColors().grey,
                inactiveTextColor: Colors.transparent,
                leftDescription: 'Cubic Meters',
                rightDescription: 'Cubic Feet',
                onLeftToggleActive: () {},
                onRightToggleActive: () {},
              ),
               SizedBox(height: 20.h),
              Stack(
                alignment: Alignment.center,
                children: [
                  RotateAbleWheelSelector(
                    onValueUpdated: (value) {
                      debugPrint('value: $value');
                    },
                  ),
                  Center(
                    child: Container(
                      height: 100.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        color: Colors.grey[350],
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.green,
                          width: 2,
                        ),
                        boxShadow:  [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2.r,
                            blurStyle: BlurStyle.outer,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          '0',
                          style: GoogleFonts.libreFranklin(
                            color: AppColors().black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors().black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  minimumSize:  Size(double.infinity, 45.h),
                ),
                onPressed: () {},
                child:  Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
