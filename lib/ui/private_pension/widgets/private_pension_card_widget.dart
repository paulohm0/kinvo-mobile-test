import 'package:flutter/material.dart';
import 'package:kinvo_mobile_test/core/theme/app_colors.dart';
import 'package:kinvo_mobile_test/core/theme/app_text_styles.dart';

class PrivatePensionCardWidget extends StatelessWidget {
  final String namePension;
  final String typePension;
  final int minimumValuePension;
  final num taxPension;
  final int redemptionTermPension;
  final num profitabilityPension;

  const PrivatePensionCardWidget({
    super.key,
    required this.namePension,
    required this.typePension,
    required this.minimumValuePension,
    required this.taxPension,
    required this.redemptionTermPension,
    required this.profitabilityPension,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      elevation: 1,
      margin: const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 250,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      namePension,
                                      style: AppTextStyles.titleCard,
                                      overflow: TextOverflow.clip,
                                      maxLines: 1,
                                    ),
                                    Text(
                                      typePension.toUpperCase(),
                                      style: AppTextStyles.subtitleCard,
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
                  Divider(height: 1),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Valor mínimo:'),
                            Text(
                              'R\$ ${minimumValuePension.toStringAsFixed(2)}',
                              style: AppTextStyles.minValueStockCard,
                            ),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Taxa:'),
                            Text(
                              '${taxPension.toStringAsFixed(2)}%',
                              style: AppTextStyles.minValueStockCard,
                            ),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Resgate:'),
                            Text(
                              'D+$redemptionTermPension',
                              style: AppTextStyles.minValueStockCard,
                            ),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Rentabilidade:'),
                            Row(
                              children: [
                                Icon(
                                  profitabilityPension < 0
                                      ? Icons.arrow_downward_sharp
                                      : profitabilityPension == 0
                                      ? Icons.remove
                                      : Icons.arrow_upward_sharp,
                                  size: 16.0,
                                  color:
                                      profitabilityPension < 0
                                          ? AppColors.red
                                          : profitabilityPension == 0
                                          ? AppColors.grey
                                          : AppColors.green,
                                ),
                                Text(
                                  '${profitabilityPension.toStringAsFixed(2)}%',
                                  style: TextStyle(
                                    color:
                                        profitabilityPension < 0
                                            ? AppColors.red
                                            : profitabilityPension == 0
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
    );
  }
}
