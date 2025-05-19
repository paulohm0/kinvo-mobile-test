import 'package:flutter/material.dart';
import 'package:kinvo_mobile_test/core/theme/app_colors.dart';
import 'package:kinvo_mobile_test/core/theme/app_text_styles.dart';

class HomeCardWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String routeName;
  const HomeCardWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      elevation: 1,
      margin: const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.pushNamed(context, routeName);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 36),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: AppColors.mainBackground,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(icon, size: 36, color: AppColors.primary),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title, style: AppTextStyles.titleHomeCard),
                          Text(subtitle, style: AppTextStyles.subTitleHomeCard),
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
