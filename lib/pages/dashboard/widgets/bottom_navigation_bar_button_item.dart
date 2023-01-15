import 'package:app/pages/dashboard/dashboard_tab.dart';
import 'package:app/styles/app_colors.dart';
import 'package:app/widgets/ios_ripple_remover.dart';
import 'package:app/widgets/space.dart';
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
    return IosRippleRemover(
      child: MaterialButton(
        height: 70.0,
        shape: const CircleBorder(),
        onPressed: onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildIcon(),
            const Space.vertical(6.0),
            _buildText(context),
          ],
        ),
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
