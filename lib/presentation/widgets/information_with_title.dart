import 'package:app/presentation/styles/app_text_styles.dart';
import 'package:app/presentation/widgets/space_text_span.dart';
import 'package:flutter/material.dart';

class InformationWithTitle extends StatelessWidget {
  final String value;
  final String title;

  const InformationWithTitle({
    required this.value,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: '$title:',
        style: AppTextStyles.contentBold(),
        children: [
          const SpaceTextSpan(),
          TextSpan(
            text: value,
            style: AppTextStyles.content(),
          ),
        ],
      ),
    );
  }
}
