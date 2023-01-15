import 'package:app/extensions/extensions.dart';
import 'package:app/models/page_tab_bar_button_data.dart';
import 'package:app/styles/app_colors.dart';
import 'package:app/styles/app_dimensions.dart';
import 'package:app/widgets/page_tab_bar/page_tab_bar_button.dart';
import 'package:app/widgets/separator.dart';
import 'package:flutter/material.dart';

class PageTabBar extends StatelessWidget {
  final List<PageTabBarButtonData> buttonsData;
  final int selectedButtonIndex;

  const PageTabBar({
    required this.buttonsData,
    required this.selectedButtonIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.borderRadius.tabBarButton),
        color: AppColors.grey,
      ),
      width: double.infinity,
      child: _buildButtonsRow(),
    );
  }

  Widget _buildButtonsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: buttonsData
          .mapIndexed(
            (index, element) => Flexible(
              child: _buildButton(
                element,
                isSelected: index == selectedButtonIndex,
              ),
            ),
          )
          .toList()
          .separatedBy(
            _buildButtonsSeparator(),
          ),
    );
  }

  Widget _buildButton(
    PageTabBarButtonData data, {
    required bool isSelected,
  }) {
    return PageTabBarButton(
      data.title,
      isSelected: isSelected,
      onPressed: data.onPressed,
    );
  }

  Widget _buildButtonsSeparator() {
    return const Separator(
      width: 4.0,
    );
  }
}
