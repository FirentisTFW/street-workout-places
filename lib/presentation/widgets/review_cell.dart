import 'package:app/domain/core/extensions/extensions.dart';
import 'package:app/domain/models/review.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/presentation/styles/app_animations.dart';
import 'package:app/presentation/styles/app_text_styles.dart';
import 'package:app/presentation/widgets/animated_expand.dart';
import 'package:app/presentation/widgets/space.dart';
import 'package:flutter/widgets.dart';

class ReviewCell extends StatefulWidget {
  final Review review;

  const ReviewCell({
    super.key,
    required this.review,
  });

  @override
  State<ReviewCell> createState() => _ReviewCellState();
}

class _ReviewCellState extends State<ReviewCell> {
  bool _isExpanded = false;

  Review get _review => widget.review;

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
                  _review.title,
                  style: AppTextStyles.contentBiggerBold(),
                ),
              ),
              const Space.horizontal(6.0),
              Text(
                _review.date.dayMonthYearFormat,
                maxLines: 3,
                style: AppTextStyles.content(),
              ),
            ],
          ),
          const Space.vertical(8.0),
          Text(
            _review.content,
            style: AppTextStyles.contentMultiline(),
          ),
          const Space.vertical(6.0),
          _buildGoodAndBadAspectsSection(),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () => setState(() => _isExpanded = !_isExpanded),
              child: Text(
                _isExpanded ? S.of(context).collapse : S.of(context).expand,
                style: AppTextStyles.contentBold(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGoodAndBadAspectsSection() {
    return AnimatedExpand(
      isExpanded: _isExpanded,
      duration: AppAnimations.expandDuration,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 4.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_review.hasGoodAspects) ...[
              Text(
                S.of(context).reviewCellGoodAspects,
                style: AppTextStyles.contentBold(),
              ),
              const Space.vertical(4.0),
              ..._review.goodAspects.map(_buildAspectText).toList().separatedBy(const Space.vertical(2.0)),
              const Space.vertical(8.0),
            ],
            if (_review.hasBadAspects) ...[
              Text(
                S.of(context).reviewCellBadAspects,
                style: AppTextStyles.contentBold(),
              ),
              const Space.vertical(4.0),
              ..._review.badAspects.map(_buildAspectText).toList().separatedBy(const Space.vertical(2.0)),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildAspectText(String content) {
    return Text(
      '- $content',
      style: AppTextStyles.contentMultiline(),
    );
  }
}
