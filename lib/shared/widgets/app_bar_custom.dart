import 'package:flutter/material.dart';
import 'package:kinvo_mobile_test/core/theme/app_colors.dart';
import 'package:kinvo_mobile_test/core/theme/app_text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(100),
      child: Material(
        elevation: 1,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          color: AppColors.white,
          alignment: Alignment.centerLeft,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (showBackButton)
                Container(
                  width: 25,
                  height: 25,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),

                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 10,
                      color: AppColors.white,
                    ),
                    onPressed: () => {Navigator.pop(context)},
                    padding: EdgeInsets.zero,
                    splashRadius: 20,
                  ),
                ),
              const SizedBox(width: 12),
              Text(title, style: AppTextStyles.titleAppBar),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
