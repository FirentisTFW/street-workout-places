import 'package:app/domain/core/common/bloc_page_state.dart';
import 'package:app/domain/core/extensions/extensions.dart';
import 'package:app/domain/core/utils/alert_dialog_utils.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/presentation/pages/new_review/new_review_cubit.dart';
import 'package:app/presentation/styles/app_padding.dart';
import 'package:app/presentation/widgets/app_app_bar.dart';
import 'package:app/presentation/widgets/app_text_field.dart';
import 'package:app/presentation/widgets/button.dart';
import 'package:app/presentation/widgets/form_gesture_detector.dart';
import 'package:app/presentation/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewReviewPage extends StatefulWidget {
  const NewReviewPage({
    super.key,
  });

  @override
  State<NewReviewPage> createState() => _NewReviewPageState();
}

// FIXME Remove hardcoded texts
class _NewReviewPageState extends BlocPageState<NewReviewPage, NewReviewCubit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: FormGestureDetector(
        child: SingleChildScrollView(
          padding: AppPadding.defaultAll,
          child: BlocConsumer<NewReviewCubit, NewReviewState>(
            listener: _onStateChanged,
            builder: (_, state) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildTitleTextField(),
                _buildContentTextField(),
                _buildSendButton(state),
              ].separatedBy(
                const Space.vertical(20.0),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onStateChanged(BuildContext context, NewReviewState state) {
    if (state is NewReviewSuccess) {
      AlertDialogUtils.show(
        context,
        title: 'Opinia',
        message: 'Twoja opinia została przesłana.',
        actions: [
          AlertDialogUtils.buildAction(
            text: 'Ok',
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
        ],
      );
    }
  }

  PreferredSizeWidget _buildAppBar() {
    return const AppAppBar(
      title: 'Dodaj opinię',
    );
  }

  Widget _buildTitleTextField() {
    return AppTextField(
      bloc.titleTFE,
      keyboardType: TextInputType.name,
      labelText: 'Tytuł',
      textInputAction: TextInputAction.next,
    );
  }

  Widget _buildContentTextField() {
    return AppTextField(
      bloc.contentTFE,
      keyboardType: TextInputType.multiline,
      labelText: 'Opis',
      minLines: 7,
      textInputAction: TextInputAction.done,
    );
  }

  Widget _buildSendButton(NewReviewState state) {
    return Button(
      S.of(context).send,
      isLoading: state is NewReviewInProgress,
      onPressed: bloc.submitReview,
    );
  }
}
