import 'package:app/presentation/pages/dashboard/dashboard_tab.dart';
import 'package:app/presentation/styles/app_colors.dart';
import 'package:app/presentation/widgets/circular_button.dart';
import 'package:app/presentation/widgets/space.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarButtonItem extends StatelessWidget {
  final bool isSelected;
  final DashboardTab tab;
  final VoidCallback onPressed;

  const BottomNavigationBarButtonItem({
    required this.isSelected,
    required this.tab,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CircularButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildIcon(),
          const Space.vertical(6.0),
          _buildText(context),
        ],
      ),
    );
  }

  Widget _buildIcon() {
    return Icon(
      tab.icon,
      color: isSelected ? AppColors.blue : AppColors.black,
      size: 24.0,
    );
  }

  Widget _buildText(BuildContext context) {
    // TODO Update text style
    return Text(
      tab.getLabel(context),
      style: TextStyle(
        fontSize: 13.0,
        color: isSelected ? AppColors.blue : AppColors.black,
      ),
    );
  }
}
