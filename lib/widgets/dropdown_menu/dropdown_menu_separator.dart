import 'package:app/styles/app_colors.dart';
import 'package:flutter/material.dart';

class DropdownMenuItemSeparator extends StatelessWidget {
  const DropdownMenuItemSeparator();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      height: 1.0,
      color: AppColors.grey,
    );
  }
}
