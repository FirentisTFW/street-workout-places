import 'package:app/domain/core/common/maps/map_coordinator.dart';
import 'package:app/domain/services/device_image_picker_service.dart';
import 'package:app/domain/services/equipment_selection_validation_service.dart';
import 'package:app/domain/services/images_selection_validation_service.dart';
import 'package:app/domain/services/user_input_validation_service.dart';
import 'package:app/infrastructure/networking/models/equipment.dart';
import 'package:app/infrastructure/repositories/reviews/reviews_repository.dart';
import 'package:app/infrastructure/repositories/spots/network_spots_repository.dart';
import 'package:app/injector.dart';
import 'package:app/presentation/pages/dashboard/dashboard_cubit.dart';
import 'package:app/presentation/pages/dashboard/dashboard_page.dart';
import 'package:app/presentation/pages/filters/filters_page.dart';
import 'package:app/presentation/pages/home/home_cubit.dart';
import 'package:app/presentation/pages/home/home_page.dart';
import 'package:app/presentation/pages/image_gallery/image_gallery_page.dart';
import 'package:app/presentation/pages/image_gallery/image_gallery_page_arguments.dart';
import 'package:app/presentation/pages/more/more_cubit.dart';
import 'package:app/presentation/pages/more/more_page.dart';
import 'package:app/presentation/pages/new_review/new_review_cubit.dart';
import 'package:app/presentation/pages/new_review/new_review_page.dart';
import 'package:app/presentation/pages/new_spot/equipment/new_spot_equipment_arguments.dart';
import 'package:app/presentation/pages/new_spot/equipment/new_spot_equipment_cubit.dart';
import 'package:app/presentation/pages/new_spot/equipment/new_spot_equipment_page.dart';
import 'package:app/presentation/pages/new_spot/form/new_spot_form_cubit.dart';
import 'package:app/presentation/pages/new_spot/form/new_spot_form_page.dart';
import 'package:app/presentation/pages/new_spot/images/new_spot_images_arguments.dart';
import 'package:app/presentation/pages/new_spot/images/new_spot_images_cubit.dart';
import 'package:app/presentation/pages/new_spot/images/new_spot_images_page.dart';
import 'package:app/presentation/pages/new_spot/initial/new_spot_initial_page.dart';
import 'package:app/presentation/pages/spot_details/spot_details_arguments.dart';
import 'package:app/presentation/pages/spot_details/spot_details_cubit.dart';
import 'package:app/presentation/pages/spot_details/spot_details_page.dart';
import 'package:app/presentation/pages/spots/spots_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract final class Pages {
  const Pages._();

  static Widget newReview() {
    return BlocProvider<NewReviewCubit>(
      create: (_) => NewReviewCubit(
        reviewsRepository: Injector().resolve<ReviewsRepository>(),
        userInputValidator: UserInputValidationService(),
      ),
      child: const NewReviewPage(),
    );
  }

  static Widget dashboard() {
    return BlocProvider<DashboardCubit>(
      create: (_) => DashboardCubit(),
      child: const DashboardPage(),
    );
  }

  static Widget filters() {
    return const FiltersPage();
  }

  static Widget home() {
    return BlocProvider<HomeCubit>(
      create: (_) => HomeCubit(),
      child: const HomePage(),
    );
  }

  static Widget imageGallery(dynamic arguments) {
    return ImageGalleryPage(
      arguments: arguments as ImageGalleryPageArguments,
    );
  }

  static Widget more() {
    return BlocProvider<MoreCubit>(
      create: (_) => MoreCubit(),
      child: const MorePage(),
    );
  }

  static Widget newSpotEquipment(dynamic arguments) {
    return BlocProvider<NewSpotEquipmentCubit>(
      create: (_) => NewSpotEquipmentCubit(
        arguments: arguments as NewSpotEquipmentArguments,
        equipment: Equipment.values,
        selectedEquipmentValidator: EquipmentSelectionValidationService(),
      ),
      child: const NewSpotEquipmentPage(),
    );
  }

  static Widget newSpotForm() {
    return BlocProvider<NewSpotFormCubit>(
      create: (_) => NewSpotFormCubit(
        mapCoordinator: MapCoordinator.create(),
        userInputValidator: UserInputValidationService(),
      ),
      child: const NewSpotFormPage(),
    );
  }

  static Widget newSpotImages(dynamic arguments) {
    return BlocProvider<NewSpotImagesCubit>(
      create: (_) => NewSpotImagesCubit(
        arguments: arguments as NewSpotImagesArguments,
        deviceImagePicker: DeviceImagePickerService(),
        selectedImagesValidator: ImagesSelectionValidationService(),
        spotsRepository: Injector().resolve<NetworkSpotsRepository>(),
      ),
      child: const NewSpotImagesPage(),
    );
  }

  static Widget newSpotInitial() {
    return const NewSpotInitialPage();
  }

  static Widget spotDetails(dynamic arguments) {
    return BlocProvider<SpotDetailsCubit>(
      create: (_) => SpotDetailsCubit(
        arguments: arguments as SpotDetailsArguments,
        reviewsRepository: Injector().resolve<ReviewsRepository>(),
      ),
      child: const SpotDetailsPage(),
    );
  }

  static Widget spots() {
    return const SpotsPage();
  }
}
