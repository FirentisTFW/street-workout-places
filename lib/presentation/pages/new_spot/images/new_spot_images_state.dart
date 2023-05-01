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

class SpotImagesSelected extends NewSpotImagesState {
  const SpotImagesSelected({
    required super.defaultImagePath,
    required super.imagePaths,
  });

  const SpotImagesSelected.empty()
      : super(
          imagePaths: const [],
        );

  SpotImagesSelected addImages(List<String> newImages) => SpotImagesSelected(
        defaultImagePath: defaultImagePath,
        imagePaths: newImages,
      );
}
