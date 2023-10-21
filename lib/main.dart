import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m_ahmad_mahmood/constants/app_constants.dart';
import 'package:m_ahmad_mahmood/views/grower_user_input_screen/grower_user_input_screen.dart';
import 'package:m_ahmad_mahmood/views/theme/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme,
        ),
        useMaterial3: false,
      ),
      home: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage(backgroundImage),
                fit: BoxFit.cover,
              ),
              color: AppColors().tranquil,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top:8.0),
            child: GrowerInputScreen(),
          ),
        ],
      ),
    );
  }
}
