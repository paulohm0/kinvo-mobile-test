import 'package:flutter/material.dart';
import 'package:implicitly_animated_reorderable_list_2/implicitly_animated_reorderable_list_2.dart';
import 'package:implicitly_animated_reorderable_list_2/transitions.dart';
import 'package:kinvo_mobile_test/data/models/stocks/stock_model.dart';
import 'package:kinvo_mobile_test/shared/enums/view_state.dart';
import 'package:kinvo_mobile_test/shared/widgets/app_bar_custom.dart';
import 'package:kinvo_mobile_test/shared/widgets/loading_error_wrapper.dart';
import 'package:kinvo_mobile_test/ui/national_stocks/view_model/stocks_view_model.dart';
import 'package:kinvo_mobile_test/ui/national_stocks/widgets/stock_card_widget.dart';
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
            return LoadingErrorWrapper(
              isLoading: viewModel.state == ViewState.loading,
              error:
                  viewModel.state == ViewState.error
                      ? viewModel.errorMessage
                      : null,
              onRetry: viewModel.fetchStocks,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: ImplicitlyAnimatedReorderableList<StockModel>(
                  items: viewModel.stocks,
                  areItemsTheSame:
                      (stock1, stock2) => stock1.ticker == stock2.ticker,
                  onReorderFinished: (item, from, to, newItems) {},
                  itemBuilder: (context, itemAnimation, stock, index) {
                    return Reorderable(
                      key: ValueKey(stock.ticker),
                      builder: (context, dragAnimation, inDrag) {
                        return SizeFadeTransition(
                          animation: itemAnimation,
                          child: StockCardWidget(
                            nameStock: stock.name,
                            tickerStock: stock.ticker,
                            minimumValueStock: stock.minimumValue,
                            profitabilityStock: stock.profitability,
                            viewModel: viewModel,
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
