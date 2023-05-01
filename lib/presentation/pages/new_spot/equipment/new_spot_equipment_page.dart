import 'package:app/domain/core/common/bloc_page_state.dart';
import 'package:app/domain/core/common/root_navigator.dart';
import 'package:app/domain/core/extensions/extensions.dart';
import 'package:app/domain/core/utils/alert_dialog_utils.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/infrastructure/networking/models/equipment.dart';
import 'package:app/presentation/common/presentation_events.dart';
import 'package:app/presentation/pages/new_spot/equipment/new_spot_equipment_cubit.dart';
import 'package:app/presentation/pages/new_spot/equipment/new_spot_equipment_presentation_event.dart';
import 'package:app/presentation/pages/new_spot/equipment/widgets/equipment_cell.dart';
import 'package:app/presentation/pages/new_spot/images/new_spot_images_arguments.dart';
import 'package:app/presentation/routing/dashboard_tabs/form_routing.dart';
import 'package:app/presentation/styles/app_padding.dart';
import 'package:app/presentation/styles/app_text_styles.dart';
import 'package:app/presentation/widgets/app_app_bar.dart';
import 'package:app/presentation/widgets/primary_button.dart';
import 'package:app/presentation/widgets/space.dart';
import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewSpotEquipmentPage extends StatefulWidget {
  const NewSpotEquipmentPage({
    super.key,
  });

  @override
  State<NewSpotEquipmentPage> createState() => _NewSpotEquipmentPageState();
}

class _NewSpotEquipmentPageState extends BlocPageState<NewSpotEquipmentPage, NewSpotEquipmentCubit> {
  @override
  Widget build(BuildContext context) {
    return BlocPresentationListener<NewSpotEquipmentCubit>(
      listener: _onPresentationEvent,
      child: Scaffold(
        appBar: _buildAppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: AppPadding.defaultAll,
            child: Column(
              children: [
                _buildHeadline(),
                const Space.vertical(20.0),
                _buildSelectableEquipment(),
                const Space.vertical(20.0),
                _buildNextButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onPresentationEvent(BuildContext context, BlocPresentationEvent event) {
    if (event is ValidationFailed) {
      AlertDialogUtils.showError(context, event.error);
    } else if (event is NewSpotEquipmentValidationSuccessful) {
      RootNavigator.of(context).pushNamed(
        FormRouting.images,
        arguments: NewSpotImagesArguments(
          formData: event.formData,
          equipment: event.selectedEquipment,
        ),
      );
    }
  }

  PreferredSizeWidget _buildAppBar() {
    return AppAppBar(
      title: S.of(context).newSpotEquipmentAppBarTitle,
    );
  }

  Widget _buildHeadline() {
    return Text(
      S.of(context).newSpotEquipmentHeadline,
      style: AppTextStyles.contentBiggerMultiline(),
    );
  }

  Widget _buildSelectableEquipment() {
    return BlocBuilder<NewSpotEquipmentCubit, NewSpotEquipmentState>(
      builder: (_, state) {
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, index) {
            final Equipment equipment = state.equipment[index];
            final ValueNotifier<bool>? notifier = bloc.equipmentNotifiers[equipment];
            if (notifier == null) return const SizedBox.shrink();
            return EquipmentCell(
              equipment,
              onToggled: () => bloc.equipmentNotifiers[equipment]?.toggle(),
              isSelectedNotifier: notifier,
            );
          },
          itemCount: state.equipment.length,
          separatorBuilder: (_, __) => const Space.vertical(10.0),
        );
      },
    );
  }

  Widget _buildNextButton() {
    return PrimaryButton(
      S.of(context).next,
      onPressed: bloc.proceedToNextStep,
    );
  }
}
