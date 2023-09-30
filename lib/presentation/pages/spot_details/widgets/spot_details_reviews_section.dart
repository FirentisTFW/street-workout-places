import 'package:app/domain/models/review.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/presentation/pages/spot_details/spot_details_cubit.dart';
import 'package:app/presentation/styles/app_text_styles.dart';
import 'package:app/presentation/widgets/error_view_big.dart';
import 'package:app/presentation/widgets/review_cell.dart';
import 'package:app/presentation/widgets/separator.dart';
import 'package:app/presentation/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// FIXME Add good and bad aspects
class SpotDetailsReviewsSection extends StatelessWidget {
  final SpotDetailsReviewsState reviewsState;

  const SpotDetailsReviewsSection({
    super.key,
    required this.reviewsState,
  });

  @override
  Widget build(BuildContext context) {
    final Widget child = switch (reviewsState) {
      SpotDetailsReviewsInProgress() => const SizedBox.shrink(),
      SpotDetailsReviewsFailure(:final error) => ErrorViewBig(
          error: error,
          onRetryPressed: BlocProvider.of<SpotDetailsCubit>(context).fetchReviews,
        ),
      SpotDetailsReviewsFetched(:final reviews) => _buildLoadedBody(reviews),
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).spotDetailsReviewsSectionTitle,
          style: AppTextStyles.titleSmall(),
        ),
        const Space.vertical(6.0),
        child,
      ],
    );
  }

  Widget _buildLoadedBody(List<Review> reviews) {
    // TODO Use slivers instead of shrinkWrap and NeverScrollableScrollPhysics
    return ListView.separated(
      itemBuilder: (_, index) {
        final review = reviews[index];

        return ReviewCell(
          content: review.content,
          date: review.date,
          title: review.title,
        );
      },
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: reviews.length,
      separatorBuilder: (_, __) => const Separator.ofHeight(1.0),
      shrinkWrap: true,
    );
  }
}
