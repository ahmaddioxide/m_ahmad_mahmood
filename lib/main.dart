import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m_ahmad_mahmood/constants/app_constants.dart';
import 'package:m_ahmad_mahmood/views/navigation_bar/navigation_bar_screen.dart';
import 'package:m_ahmad_mahmood/views/theme/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
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
              Padding(
                padding: EdgeInsets.only(top: 8.0.h),
                child: const NavigationBarScreen(),
              ),
            ],
          ),
        );
      },
    );
  }
}
