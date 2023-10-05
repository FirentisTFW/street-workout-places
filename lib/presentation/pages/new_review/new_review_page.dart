import 'package:app/domain/core/common/bloc_page_state.dart';
import 'package:app/presentation/pages/new_review/new_review_cubit.dart';
import 'package:flutter/material.dart';

class NewReviewPage extends StatefulWidget {
  const NewReviewPage({
    super.key,
  });

  @override
  State<NewReviewPage> createState() => _NewReviewPageState();
}

class _NewReviewPageState extends BlocPageState<NewReviewPage, NewReviewCubit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
