import 'package:flutter/material.dart';
import 'package:kinvo_mobile_test/shared/widgets/app_bar_custom.dart';
import 'package:kinvo_mobile_test/ui/national_stocks/view_model/stocks_view_model.dart';
import 'package:provider/provider.dart';

class NationalStocksView extends StatelessWidget {
  const NationalStocksView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: 'Ações', showBackButton: true),
        body: Consumer<StocksViewModel>(
          builder: (context, viewModel, _) {
            if (viewModel.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (viewModel.error != null) {
              return Center(child: Text('Erro: ${viewModel.error}'));
            }
            return ListView.builder(
              itemCount: viewModel.stocks.length,
              itemBuilder: (context, index) {
                final stock = viewModel.stocks[index];
                return ListTile(
                  title: Text(stock.name),
                  subtitle: Text(stock.ticker),
                  trailing: Text(stock.profitability.toString()),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
