import 'package:app/application/blocs/filters/filters_cubit.dart';
import 'package:app/application/blocs/filters/filters_presentation_event.dart';
import 'package:app/domain/core/common/bloc_page_state.dart';
import 'package:app/domain/core/extensions/extensions.dart';
import 'package:app/domain/core/utils/alert_dialog_utils.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/presentation/common/presentation_events.dart';
import 'package:app/presentation/pages/filters/widgets/filters_section.dart';
import 'package:app/presentation/styles/app_padding.dart';
import 'package:app/presentation/widgets/app_app_bar.dart';
import 'package:app/presentation/widgets/app_text_field.dart';
import 'package:app/presentation/widgets/button.dart';
import 'package:app/presentation/widgets/space.dart';
import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FiltersPage extends StatefulWidget {
  const FiltersPage({
    super.key,
  });

  @override
  State<FiltersPage> createState() => _FiltersPageState();
}

class _FiltersPageState extends BlocPageState<FiltersPage, FiltersCubit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: BlocPresentationListener<FiltersCubit>(
        listener: _onPresentationEvent,
        child: BlocListener<FiltersCubit, FiltersState>(
          listener: _onStateChanged,
          child: SingleChildScrollView(
            padding: AppPadding.defaultAll,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildMaxDistanceTextField(),
                _buildEquipmentSection(),
                _buildSizeSection(),
                _buildSurfaceSection(),
                _buildFooter(),
              ].separatedBy(const Space.vertical(20.0)),
            ),
          ),
        ),
      ),
    );
  }

  void _onPresentationEvent(BuildContext context, BlocPresentationEvent event) {
    if (event is FiltersMissingLocationPermission) {
      _showMissingLocationPerimissionDialog();
    } else if (event is ValidationFailed) {
      AlertDialogUtils.showError(context, event.error);
    }
  }

  void _onStateChanged(BuildContext context, FiltersState state) {
    Navigator.pop(context);
  }

  void _showMissingLocationPerimissionDialog() {
    AlertDialogUtils.show(
      context,
      message: S.of(context).filtersMissingLocationPermissionDialogMessage,
      title: S.of(context).filtersMissingLocationPermissionDialogTitle,
      actions: [
        AlertDialogUtils.buildAction(
          onPressed: () {
            // FIXME Open location settings
          },
          text: S.of(context).filtersMissingLocationPermissionDialogSettingsButton,
        ),
        AlertDialogUtils.buildAction(
          onPressed: () {
            Navigator.pop(context);
            bloc.maxDistanceInKmTFE.clearText();
            bloc.saveFilters();
          },
          text: S.of(context).filtersMissingLocationPermissionDialogTitleFilterWithoutDistanceButton,
        ),
      ],
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppAppBar(
      title: S.of(context).filtersAppBarTitle,
    );
  }

  Widget _buildMaxDistanceTextField() {
    return AppTextField(
      bloc.maxDistanceInKmTFE,
      labelText: S.of(context).filtersMaxDistanceInKm,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      suffixText: S.of(context).kilometersAbbreviation,
    );
  }

  Widget _buildEquipmentSection() {
    return FiltersSection(
      title: S.of(context).equipment,
      optionsNotifiers: bloc.equipmentNotifiers,
      provideDescription: (equipment) => equipment.getDescription(S.of(context)),
    );
  }

  Widget _buildSizeSection() {
    return FiltersSection(
      title: S.of(context).size,
      optionsNotifiers: bloc.sizeNotifiers,
      provideDescription: (size) => size.getDescription(S.of(context)),
    );
  }

  Widget _buildSurfaceSection() {
    return FiltersSection(
      title: S.of(context).surface,
      optionsNotifiers: bloc.surfaceNotifiers,
      provideDescription: (surface) => surface.getDescription(S.of(context)),
    );
  }

  Widget _buildFooter() {
    return Row(
      children: [
        Flexible(
          child: Button(
            S.of(context).filtersClearButtonTitle,
            type: ButtonType.secondary,
            onPressed: bloc.clearFilters,
          ),
        ),
        const Space.horizontal(10.0),
        Flexible(
          flex: 2,
          child: Button(
            S.of(context).filtersFilterButtonTitle,
            onPressed: bloc.saveFilters,
          ),
        ),
      ],
    );
  }
}
