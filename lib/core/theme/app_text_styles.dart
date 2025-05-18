import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_sizes.dart';

class AppTextStyles {
  static const TextStyle titleAppBar = TextStyle(
    fontSize: AppTextSizes.titleAppBar,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );
  static const TextStyle titleHomeCard = TextStyle(
    color: AppColors.primary,
    fontSize: AppTextSizes.titleCard,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle subTitleHomeCard = TextStyle(
    color: AppColors.grey,
    fontSize: AppTextSizes.small,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle titleStockCard = TextStyle(
    color: AppColors.grey2,
    fontSize: AppTextSizes.titleCard,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle subTitleStockCard = TextStyle(
    color: AppColors.grey,
    fontSize: AppTextSizes.medium,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle minValueStockCard = TextStyle(
    color: AppColors.grey2,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle profitValueStockCard = TextStyle(
    color: AppColors.red,
    fontWeight: FontWeight.w700,
  );
}
