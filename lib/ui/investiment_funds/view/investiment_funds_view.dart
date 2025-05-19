import 'package:flutter/material.dart';
import 'package:kinvo_mobile_test/shared/widgets/app_bar_custom.dart';
import 'package:kinvo_mobile_test/ui/investiment_funds/view_model/funds_view_model.dart';
import 'package:provider/provider.dart';

class InvestimentFundsView extends StatelessWidget {
  const InvestimentFundsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: 'Fundos', showBackButton: true),
        body: Consumer<FundsViewModel>(
          builder: (context, viewModel, _) {
            if (viewModel.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (viewModel.error != null) {
              return Center(child: Text('Erro: ${viewModel.error}'));
            }
            return ListView.builder(
              itemCount: viewModel.funds.length,
              itemBuilder: (context, index) {
                final fund = viewModel.funds[index];
                return ListTile(
                  title: Text(fund.name),
                  subtitle: Text(fund.type),
                  trailing: Text(fund.profitability.toString()),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
