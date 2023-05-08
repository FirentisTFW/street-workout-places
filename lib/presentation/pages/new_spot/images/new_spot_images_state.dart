part of 'new_spot_images_cubit.dart';

@CopyWith()
class NewSpotImagesState extends Equatable {
  final String? defaultImagePath;
  final List<String> imagePaths;

  bool get canAddImage => imagePaths.length < Constants.spots.newSpotMaxImageCount;

  bool get hasImages => imagePaths.isNotEmpty;

  const NewSpotImagesState({
    this.defaultImagePath,
    required this.imagePaths,
  });

  const NewSpotImagesState.empty()
      : defaultImagePath = null,
        imagePaths = const [];

  NewSpotImagesState.fromState(NewSpotImagesState state)
      : defaultImagePath = state.defaultImagePath,
        imagePaths = state.imagePaths;

  NewSpotImagesState addImages(List<String> newImages) => copyWith(
        imagePaths: imagePaths + newImages,
      );

  NewSpotImagesState changeDefaultImage(String newDefaultImagePath) => copyWith(
        defaultImagePath: newDefaultImagePath,
      );

  NewSpotImagesState removeImage(String removedImagePath) {
    final bool isRemovedImageDefault = removedImagePath == defaultImagePath;
    final List<String> newImagePaths = imagePaths.copy()..remove(removedImagePath);

    return copyWith(
      defaultImagePath: isRemovedImageDefault ? newImagePaths.firstOrNull : defaultImagePath,
      imagePaths: newImagePaths,
    );
  }

  @override
  List<Object?> get props => [
        defaultImagePath,
        imagePaths,
      ];
}

class NewSpotImagesSubmitInProgress extends NewSpotImagesState {
  NewSpotImagesSubmitInProgress(super.state) : super.fromState();
}

class NewSpotImagesSubmitSuccess extends NewSpotImagesState {
  NewSpotImagesSubmitSuccess(super.state) : super.fromState();
}

class NewSpotImagesSubmitFailure extends NewSpotImagesState {
  final DialogError error;

  NewSpotImagesSubmitFailure(
    super.state, {
    required this.error,
  }) : super.fromState();

  @override
  List<Object?> get props => [
        ...super.props,
        error,
      ];
}
