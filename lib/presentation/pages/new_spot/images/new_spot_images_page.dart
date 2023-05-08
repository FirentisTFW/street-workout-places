import 'package:app/domain/core/common/bloc_page_state.dart';
import 'package:app/domain/core/common/constants.dart';
import 'package:app/domain/core/common/root_navigator.dart';
import 'package:app/domain/core/extensions/extensions.dart';
import 'package:app/domain/core/utils/alert_dialog_utils.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/presentation/pages/new_spot/images/new_spot_images_cubit.dart';
import 'package:app/presentation/pages/new_spot/images/widgets/new_spot_image_cell.dart';
import 'package:app/presentation/styles/app_colors.dart';
import 'package:app/presentation/styles/app_dimensions.dart';
import 'package:app/presentation/styles/app_padding.dart';
import 'package:app/presentation/styles/app_text_styles.dart';
import 'package:app/presentation/widgets/adaptive_button.dart';
import 'package:app/presentation/widgets/app_app_bar.dart';
import 'package:app/presentation/widgets/primary_button.dart';
import 'package:app/presentation/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewSpotImagesPage extends StatefulWidget {
  const NewSpotImagesPage({super.key});

  @override
  State<NewSpotImagesPage> createState() => _NewSpotImagesPageState();
}

class _NewSpotImagesPageState extends BlocPageState<NewSpotImagesPage, NewSpotImagesCubit> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewSpotImagesCubit, NewSpotImagesState>(
      listener: _onStateChanged,
      builder: (_, state) {
        return IgnorePointer(
          ignoring: state is NewSpotImagesSubmitInProgress,
          child: Scaffold(
            appBar: _buildAppBar(),
            body: SafeArea(
              child: SingleChildScrollView(
                padding: AppPadding.defaultAll,
                child: Column(
                  children: [
                    _buildHeadline(),
                    if (state.hasImages) _buildImageList(state),
                    if (state.canAddImage) _buildAddImageButton() else _buildMaxImageCountInformation(),
                    _buildSendButton(state),
                  ].separatedBy(
                    const Space.vertical(20.0),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _onStateChanged(BuildContext context, NewSpotImagesState state) {
    if (state is NewSpotImagesSubmitFailure) {
      AlertDialogUtils.showError(context, state.error);
    } else if (state is NewSpotImagesSubmitSuccess) {
      _showSuccessDialog(context);
    }
  }

  void _showSuccessDialog(BuildContext context) {
    AlertDialogUtils.show(
      context,
      message: S.of(context).newSpotSubmittedDialogMessage,
      title: S.of(context).newSpotSubmittedDialogTitle,
      actions: [
        AlertDialogUtils.buildAction(
          onPressed: () => RootNavigator.of(context).popUntil(
            (route) => route.isFirst,
          ),
          text: S.of(context).ok,
        ),
      ],
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppAppBar(
      title: S.of(context).newSpotImagesAppBarTitle,
    );
  }

  Widget _buildHeadline() {
    return Text(
      S.of(context).newSpotImagesHeadline,
      style: AppTextStyles.contentBiggerMultiline(),
    );
  }

  Widget _buildImageList(NewSpotImagesState state) {
    return ListView.separated(
      itemBuilder: (_, index) {
        final String path = state.imagePaths[index];
        return NewSpotImageCell(
          key: ValueKey(path),
          imagePath: path,
          isDefault: path == state.defaultImagePath,
          onRemovePressed: () => bloc.removeImage(path),
          onSetAsDefaultPressed: () => bloc.changeDefaultImage(path),
        );
      },
      itemCount: state.imagePaths.length,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (_, __) => const Space.vertical(20.0),
      shrinkWrap: true,
    );
  }

  Widget _buildAddImageButton() {
    return Padding(
      padding: AppPadding.defaultHorizontal,
      child: AdaptiveButton(
        onPressed: bloc.selectAndAddImages,
        height: AppDimensions.height.newSpotImageCell,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.grey2,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(AppDimensions.borderRadius.basic),
        ),
        child: const Icon(
          Icons.add,
          size: 60.0,
          color: AppColors.grey2,
        ),
      ),
    );
  }

  Widget _buildMaxImageCountInformation() {
    return Padding(
      padding: AppPadding.defaultHorizontal,
      child: Text(
        S.of(context).newSpotImagesMaxImageCountInformation(Constants.spots.newSpotMaxImageCount),
        style: AppTextStyles.contentBiggerMultiline(),
      ),
    );
  }

  Widget _buildSendButton(NewSpotImagesState state) {
    return PrimaryButton(
      S.of(context).send,
      isLoading: state is NewSpotImagesSubmitInProgress,
      onPressed: bloc.submitSpot,
    );
  }
}
