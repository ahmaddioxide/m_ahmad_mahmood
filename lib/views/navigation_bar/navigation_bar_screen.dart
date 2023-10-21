import 'package:flutter/material.dart';
import 'package:m_ahmad_mahmood/views/grower_user_input_screen/grower_user_input_screen.dart';
import 'package:m_ahmad_mahmood/views/navigation_bar/components/custom_navigation_bar.dart';

class NavigationBarScreen extends StatefulWidget {
  const NavigationBarScreen({super.key});

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: CustomNavigationBar(),
      body: GrowerInputScreen(),
    );
  }
}
