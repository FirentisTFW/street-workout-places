part of 'new_spot_images_cubit.dart';

abstract class NewSpotImagesState extends Equatable {
  final String? defaultImagePath;
  final List<String> imagePaths;

  const NewSpotImagesState({
    this.defaultImagePath,
    required this.imagePaths,
  });

  @override
  List<Object?> get props => [
        defaultImagePath,
        imagePaths,
      ];
}

@CopyWith()
class SpotImagesSelected extends NewSpotImagesState {
  const SpotImagesSelected({
    required super.defaultImagePath,
    required super.imagePaths,
  });

  bool get hasImages => imagePaths.isNotEmpty;

  const SpotImagesSelected.empty()
      : super(
          imagePaths: const [],
        );

  SpotImagesSelected addImages(List<String> newImages) => copyWith(
        imagePaths: imagePaths + newImages,
      );

  SpotImagesSelected changeDefaultImage(String newDefaultImagePath) => copyWith(
        defaultImagePath: newDefaultImagePath,
      );

  SpotImagesSelected removeImage(String removedImagePath) {
    final bool isRemovedImageDefault = removedImagePath == defaultImagePath;
    final List<String> newImagePaths = imagePaths.copy()..remove(removedImagePath);

    return copyWith(
      defaultImagePath: isRemovedImageDefault ? newImagePaths.firstOrNull : defaultImagePath,
      imagePaths: newImagePaths,
    );
  }
}
