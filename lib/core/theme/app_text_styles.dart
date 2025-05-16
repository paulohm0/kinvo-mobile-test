import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_sizes.dart';

class AppTextStyles {
  static const TextStyle titleAppBar = TextStyle(
    fontSize: AppTextSizes.titleAppBar,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );
  static const TextStyle titleCard = TextStyle(
    color: AppColors.primary,
    fontSize: AppTextSizes.titleCard,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle subTitleCard = TextStyle(
    color: AppColors.grey,
    fontSize: AppTextSizes.small,
    fontWeight: FontWeight.w600,
  );
}
