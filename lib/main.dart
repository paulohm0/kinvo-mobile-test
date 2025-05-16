import 'package:flutter/material.dart';
import 'package:kinvo_mobile_test/core/theme/app_colors.dart';
import 'package:kinvo_mobile_test/ui/home/view/home_view.dart';
import 'package:kinvo_mobile_test/ui/investiment_funds/view/investiment_funds_view.dart';
import 'package:kinvo_mobile_test/ui/national_stocks/view/national_stocks_view.dart';

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
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomeView(),
        '/national_stocks': (context) => NationalStocksView(),
        '/investiments_funds': (context) => InvestimentFundsView(),
        '/private_pension': (context) => NationalStocksView(),
      },
    );
  }
}
