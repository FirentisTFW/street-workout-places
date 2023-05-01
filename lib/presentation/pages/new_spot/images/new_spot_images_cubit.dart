import 'package:app/domain/services/device_image_picker_service.dart';
import 'package:app/presentation/pages/new_spot/images/new_spot_images_arguments.dart';
import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'new_spot_images_state.dart';

class NewSpotImagesCubit extends Cubit<NewSpotImagesState> with BlocPresentationMixin {
  final NewSpotImagesArguments arguments;
  final DeviceImagePickerService deviceImagePicker;

  NewSpotImagesCubit({
    required this.arguments,
    required this.deviceImagePicker,
  }) : super(const SpotImagesSelected.empty());

  Future<void> selectAndAddImages() async {
    final NewSpotImagesState entryState = state;
    if (entryState is! SpotImagesSelected) return;

    final List<String> imagePaths = await deviceImagePicker.pickMultipleImages();
    emit(
      entryState.addImages(imagePaths),
    );
  }

  void submitSpot() {
    // TODO Implement
  }
}
