import 'package:app/presentation/styles/app_colors.dart';
import 'package:app/presentation/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);

  const AppAppBar({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      centerTitle: true,
      elevation: 5.0,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: const Icon(
          Icons.arrow_back,
          color: AppColors.black,
          size: 30.0,
        ),
      ),
      title: Text(
        title,
        style: AppTextStyles.appBar(),
      ),
    );
  }
}
