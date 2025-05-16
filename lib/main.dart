import 'package:flutter/material.dart';
import 'package:kinvo_mobile_test/core/theme/app_colors.dart';
import 'package:kinvo_mobile_test/ui/home/view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kinvo Mobile Test',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.mainBackground,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        fontFamily: 'Montserrat',
      ),
      home: HomeView(),
    );
  }
}
