import 'package:app/domain/core/common/bloc_page_state.dart';
import 'package:app/presentation/pages/home/widgets/recently_added_reviews/cubit/recently_added_reviews_cubit.dart';
import 'package:flutter/material.dart';

class RecentlyAddedReviewsHomeSectionWidget extends StatefulWidget {
  const RecentlyAddedReviewsHomeSectionWidget({
    super.key,
  });

  @override
  State<RecentlyAddedReviewsHomeSectionWidget> createState() => _RecentlyAddedReviewsHomeSectionWidgetState();
}

class _RecentlyAddedReviewsHomeSectionWidgetState
    extends BlocPageState<RecentlyAddedReviewsHomeSectionWidget, RecentlyAddedReviewsCubit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
