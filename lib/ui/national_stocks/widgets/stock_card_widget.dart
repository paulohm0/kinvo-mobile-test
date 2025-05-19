import 'package:flutter/material.dart';
import 'package:kinvo_mobile_test/core/theme/app_colors.dart';
import 'package:kinvo_mobile_test/core/theme/app_text_styles.dart';
import 'package:kinvo_mobile_test/ui/national_stocks/view_model/stocks_view_model.dart';
import 'package:provider/provider.dart';

class StockCardWidget extends StatelessWidget {
  final String nameStock;
  final String tickerStock;
  final double minimumValueStock;
  final double profitabilityStock;
  const StockCardWidget({
    super.key,
    required this.nameStock,
    required this.tickerStock,
    required this.minimumValueStock,
    required this.profitabilityStock,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<StocksViewModel>(
      builder:
          (context, viewModel, _) => Card(
            color: AppColors.white,
            elevation: 1,
            margin: const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    nameStock,
                                    style: AppTextStyles.titleStockCard,
                                  ),
                                  Text(
                                    tickerStock,
                                    style: AppTextStyles.subTitleStockCard,
                                  ),
                                ],
                              ),
                              IconButton(
                                onPressed: () {
                                  viewModel.toggleFavorite(tickerStock);
                                },
                                icon: Icon(
                                  viewModel.isFavorite(tickerStock)
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: AppColors.primary,
                                ),
                                highlightColor: Colors.transparent,
                              ),
                            ],
                          ),
                        ),
                        Divider(height: 1),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Valor mínimo:'),
                                  Text(
                                    'R\$ ${minimumValueStock.toStringAsFixed(2)}',
                                    style: AppTextStyles.minValueStockCard,
                                  ),
                                ],
                              ),
                              SizedBox(height: 16.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Rentabilidade:'),
                                  Row(
                                    children: [
                                      Icon(
                                        profitabilityStock < 0
                                            ? Icons.arrow_downward_sharp
                                            : profitabilityStock == 0
                                            ? Icons.remove
                                            : Icons.arrow_upward_sharp,
                                        size: 16.0,
                                        color:
                                            profitabilityStock < 0
                                                ? AppColors.red
                                                : profitabilityStock == 0
                                                ? AppColors.grey
                                                : AppColors.green,
                                      ),
                                      Text(
                                        '$profitabilityStock%',
                                        style: TextStyle(
                                          color:
                                              profitabilityStock < 0
                                                  ? AppColors.red
                                                  : profitabilityStock == 0
                                                  ? AppColors.grey
                                                  : AppColors.green,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
