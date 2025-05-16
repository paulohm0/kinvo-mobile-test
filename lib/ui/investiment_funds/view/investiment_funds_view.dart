import 'package:flutter/material.dart';
import 'package:kinvo_mobile_test/shared/widgets/app_bar_custom.dart';

class InvestimentFundsView extends StatelessWidget {
  const InvestimentFundsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: 'Fundos', showBackButton: true),
      ),
    );
  }
}
