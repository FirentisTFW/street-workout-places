import 'package:app/presentation/styles/app_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final ValueListenable<int> currentPageIndexValueListenable;
  final double dotSize;
  final EdgeInsets padding;
  final int pageCount;
  final bool shouldExpandWidth;

  MainAxisSize get _mainAxisSize => shouldExpandWidth ? MainAxisSize.max : MainAxisSize.min;

  const PageIndicator({
    required this.currentPageIndexValueListenable,
    this.dotSize = 8.0,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 20.0,
      vertical: 10.0,
    ),
    required this.pageCount,
    this.shouldExpandWidth = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: ValueListenableBuilder(
        valueListenable: currentPageIndexValueListenable,
        builder: (_, currentPageIndex, __) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: _mainAxisSize,
          children: [
            for (int i = 0; i < pageCount; i++) ...{
              pageIndicatorItem(
                isActive: currentPageIndex == i,
              ),
            },
          ],
        ),
      ),
    );
  }

  Widget pageIndicatorItem({
    required bool isActive,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5.0,
      ),
      child: AnimatedContainer(
        height: dotSize,
        width: dotSize,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.white,
          ),
          color: isActive ? AppColors.white : AppColors.transparent,
          shape: BoxShape.circle,
        ),
        duration: const Duration(
          milliseconds: 150,
        ),
      ),
    );
  }
}
