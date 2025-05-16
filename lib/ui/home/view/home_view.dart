import 'package:flutter/material.dart';
import 'package:kinvo_mobile_test/shared/widgets/app_bar_custom.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(appBar: CustomAppBar(title: 'Kinvo Mobile Test')),
    );
  }
}
