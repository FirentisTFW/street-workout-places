import 'package:app/domain/core/extensions/extensions.dart';
import 'package:app/presentation/styles/app_text_styles.dart';
import 'package:app/presentation/widgets/space.dart';
import 'package:flutter/widgets.dart';

class ReviewCell extends StatelessWidget {
  final String content;
  final DateTime date;
  final String title;

  const ReviewCell({
    super.key,
    required this.content,
    required this.date,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  title,
                  style: AppTextStyles.contentBiggerBold(),
                ),
              ),
              // FIXME Format date
              const Space.horizontal(6.0),
              Text(
                date.dayMonthYearFormat,
                maxLines: 3,
                style: AppTextStyles.content(),
              ),
            ],
          ),
          const Space.vertical(8.0),
          Text(
            content,
            style: AppTextStyles.contentMultiline(),
          ),
        ],
      ),
    );
  }
}
