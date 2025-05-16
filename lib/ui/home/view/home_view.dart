import 'package:flutter/material.dart';
import 'package:kinvo_mobile_test/shared/widgets/app_bar_custom.dart';
import 'package:kinvo_mobile_test/ui/home/widgets/home_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: 'Flutter Mobile Test'),
        body: Column(
          children: [
            HomeCard(
              icon: Icons.add_chart,
              title: 'Ações',
              subtitle: 'Nacionais',
              routeName: '/national_stocks',
            ),
            HomeCard(
              icon: Icons.account_balance_wallet_outlined,
              title: 'Fundos',
              subtitle: 'De Investimentos',
              routeName: '/investiments_funds',
            ),
            HomeCard(
              icon: Icons.monetization_on_outlined,
              title: 'Previdências',
              subtitle: 'Privadas',
              routeName: '/private_pension',
            ),
          ],
        ),
      ),
    );
  }
}
