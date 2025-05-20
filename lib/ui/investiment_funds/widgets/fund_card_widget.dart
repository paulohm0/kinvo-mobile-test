import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kinvo_mobile_test/core/theme/app_colors.dart';
import 'package:kinvo_mobile_test/core/theme/app_text_styles.dart';
import 'package:kinvo_mobile_test/ui/investiment_funds/view_model/funds_view_model.dart';

class FundCardWidget extends StatelessWidget {
  final String nameFund;
  final String typeFund;
  final double minimumValueFund;
  final int ratingFund;
  final double profitabilityFund;
  final int statusFund;
  final FundsViewModel viewModel;

  const FundCardWidget({
    super.key,
    required this.nameFund,
    required this.typeFund,
    required this.minimumValueFund,
    required this.ratingFund,
    required this.profitabilityFund,
    required this.statusFund,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    final isClosedFund = viewModel.isClosedFund(statusFund);
    return Stack(
      children: [
        Card(
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
                            Flexible(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 250,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          nameFund,
                                          style: AppTextStyles.titleCard,
                                          overflow: TextOverflow.clip,
                                          maxLines: 1,
                                        ),
                                        Text(
                                          typeFund,
                                          style: AppTextStyles.subtitleCard,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(100),
                                      ),
                                      color: viewModel.getStatusColor(
                                        statusFund,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0,
                                        vertical: 4.0,
                                      ),
                                      child: Text(
                                        viewModel.getStatusText(statusFund),
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Classificação:'),
                                Row(
                                  children: List.generate(5, (index) {
                                    return Icon(
                                      index < ratingFund
                                          ? Icons.star
                                          : Icons.star_border,
                                      color:
                                          isClosedFund
                                              ? AppColors.grey
                                              : AppColors.yellow,
                                    );
                                  }),
                                ),
                              ],
                            ),
                            SizedBox(height: 16.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Valor mínimo:'),
                                Text(
                                  'R\$ ${minimumValueFund.toStringAsFixed(2)}',
                                  style: AppTextStyles.minValueStockCard,
                                ),
                              ],
                            ),
                            SizedBox(height: 16.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Rentabilidade:'),
                                Row(
                                  children: [
                                    Icon(
                                      profitabilityFund < 0
                                          ? Icons.arrow_downward_sharp
                                          : profitabilityFund == 0
                                          ? Icons.remove
                                          : Icons.arrow_upward_sharp,
                                      size: 16.0,
                                      color:
                                          isClosedFund
                                              ? AppColors.grey
                                              : profitabilityFund < 0
                                              ? AppColors.red
                                              : profitabilityFund == 0
                                              ? AppColors.grey
                                              : AppColors.green,
                                    ),
                                    Text(
                                      '$profitabilityFund%',
                                      style: TextStyle(
                                        color:
                                            isClosedFund
                                                ? AppColors.grey
                                                : profitabilityFund < 0
                                                ? AppColors.red
                                                : profitabilityFund == 0
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

        if (isClosedFund)
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                child: Container(
                  color: Colors.white.withAlpha((0.4 * 255).toInt()),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
