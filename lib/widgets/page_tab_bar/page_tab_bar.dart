import 'package:app/extensions/extensions.dart';
import 'package:app/models/page_tab_bar_button_data.dart';
import 'package:app/styles/app_animations.dart';
import 'package:app/styles/app_colors.dart';
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
    return SizedBox(
      height: 50.0,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          _buildButtonsRow(),
          _buildButtonsSectionBottomBorder(),
          _buildSelectedButtonIndicator(context),
        ],
      ),
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
            _buildButtonsVerticalSeparator(),
          ),
    );
  }

  Widget _buildButtonsSectionBottomBorder() {
    return Container(
      height: 1.0,
      width: double.infinity,
      color: AppColors.grey,
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

  Widget _buildButtonsVerticalSeparator() {
    return const Separator(
      height: 20.0,
      width: 1.0,
    );
  }

  Widget _buildSelectedButtonIndicator(BuildContext context) {
    final int numberOfTabs = buttonsData.length;
    const double possibleRangeAmplitude = 2.0; // -1.0 to 1.0
    final double offsetFromStart = selectedButtonIndex / (numberOfTabs - 1) * possibleRangeAmplitude;
    return AnimatedAlign(
      alignment: Alignment(-1.0 + offsetFromStart, 1.0),
      duration: AppAnimations.regularDuration,
      child: FractionallySizedBox(
        widthFactor: 1.0 / numberOfTabs,
        child: Container(
          height: 5.0,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(8.0),
            ),
            color: AppColors.blue,
          ),
        ),
      ),
    );
  }
}
