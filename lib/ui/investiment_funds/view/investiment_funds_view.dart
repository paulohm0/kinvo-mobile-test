import 'package:flutter/material.dart';
import 'package:kinvo_mobile_test/shared/widgets/app_bar_custom.dart';
import 'package:kinvo_mobile_test/shared/widgets/loading_error_wrapper.dart';
import 'package:kinvo_mobile_test/ui/investiment_funds/view_model/funds_view_model.dart';
import 'package:kinvo_mobile_test/ui/investiment_funds/widgets/fund_card_widget.dart';
import 'package:provider/provider.dart';

class InvestimentFundsView extends StatelessWidget {
  const InvestimentFundsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: 'Fundos', showBackButton: true),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Consumer<FundsViewModel>(
            builder: (context, viewModel, _) {
              return LoadingErrorWrapper(
                isLoading: viewModel.isLoading,
                error: viewModel.error,
                child: ListView.builder(
                  itemCount: viewModel.funds.length,
                  itemBuilder: (context, index) {
                    final fund = viewModel.funds[index];
                    return FundCardWidget(
                      nameFund: fund.name,
                      typeFund: fund.type,
                      statusFund: fund.status,
                      ratingFund: fund.rating,
                      minimumValueFund: fund.minimumValue,
                      profitabilityFund: fund.profitability,
                      viewModel: viewModel,
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
