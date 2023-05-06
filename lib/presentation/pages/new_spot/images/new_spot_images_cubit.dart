import 'package:app/domain/core/errors/ui_error.dart';
import 'package:app/domain/core/extensions/extensions.dart';
import 'package:app/domain/services/device_image_picker_service.dart';
import 'package:app/infrastructure/networking/requests/submit_spot_request.dart';
import 'package:app/infrastructure/repositories/spots/i_spots_repository.dart';
import 'package:app/presentation/pages/new_spot/images/new_spot_images_arguments.dart';
import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'new_spot_images_cubit.g.dart';
part 'new_spot_images_state.dart';

class NewSpotImagesCubit extends Cubit<NewSpotImagesState> with BlocPresentationMixin {
  final NewSpotImagesArguments arguments;
  final DeviceImagePickerService deviceImagePicker;
  final ISpotsRepository spotsRepository;

  NewSpotImagesCubit({
    required this.arguments,
    required this.deviceImagePicker,
    required this.spotsRepository,
  }) : super(const NewSpotImagesState.empty());

  Future<void> selectAndAddImages() async {
    final NewSpotImagesState entryState = state;

    final List<String> imagePaths = await deviceImagePicker.pickMultipleImages();

    if (imagePaths.isEmpty) return;

    if (entryState.hasImages) {
      emit(
        entryState.addImages(imagePaths),
      );
    } else {
      emit(
        entryState.addImages(imagePaths).changeDefaultImage(imagePaths.first),
      );
    }
  }

  void changeDefaultImage(String imagePath) {
    emit(
      state.changeDefaultImage(imagePath),
    );
  }

  void removeImage(String imagePath) {
    emit(
      state.removeImage(imagePath),
    );
  }

  Future<void> submitSpot() async {
    emit(
      NewSpotImagesSubmitInProgress(state),
    );

    try {
      final SubmitSpotRequest request = _createRequest(state.imagePaths);
      await spotsRepository.submitSpot(request);
      emit(
        NewSpotImagesSubmitSuccess(state),
      );
    } catch (exception) {
      emit(
        NewSpotImagesSubmitFailure(
          state,
          error: DialogError.fromException(exception),
        ),
      );
    }
  }

  SubmitSpotRequest _createRequest(List<String> imagePaths) {
    return SubmitSpotRequest(
      equipment: arguments.equipment,
      formData: arguments.formData,
      imagePaths: imagePaths,
    );
  }
}
