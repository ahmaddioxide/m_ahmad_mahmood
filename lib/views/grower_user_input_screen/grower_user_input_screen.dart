import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          style: GoogleFonts.gravitasOne(
            color: AppColors().black,
            fontSize: 30,
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
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: double.infinity),
            const SizedBox(height: 20),
            Text(
              'Besides rainfall, how much irrigated water can you use for this crop?',
              style: GoogleFonts.libreFranklin(
                color: AppColors().black,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            WhiteButton(text: 'Unlimited', onPressed: (){}),
          ],
        ),
      ),
    );
  }
}
