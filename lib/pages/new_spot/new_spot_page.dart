import 'package:app/common/bloc_page_state.dart';
import 'package:app/extensions/extensions.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/networking/models/surface.dart';
import 'package:app/networking/models/workout_spot_size.dart';
import 'package:app/pages/new_spot/new_spot_cubit.dart';
import 'package:app/pages/new_spot/widgets/new_spot_coordinates_section.dart';
import 'package:app/styles/app_padding.dart';
import 'package:app/utils/alert_dialog_utils.dart';
import 'package:app/widgets/app_text_field.dart';
import 'package:app/widgets/dropdown_menu/app_dropdown_menu_item.dart';
import 'package:app/widgets/dropdown_menu/dropdown_item_style.dart';
import 'package:app/widgets/dropdown_menu/dropdown_menu.dart';
import 'package:app/widgets/form_gesture_detector.dart';
import 'package:app/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewSpotPage extends StatefulWidget {
  const NewSpotPage({
    super.key,
  });

  @override
  State<NewSpotPage> createState() => _NewSpotPageState();
}

// FIXME Adjust font styles for the file
class _NewSpotPageState extends BlocPageState<NewSpotPage, NewSpotCubit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppPadding.defaultAll,
          child: BlocBuilder<NewSpotCubit, NewSpotState>(
            builder: (_, state) {
              return FormGestureDetector(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildNameTextField(),
                      _buildSizeAndSurfaceSelectors(),
                      _buildCoordinatesSection(),
                      ..._buildAddressSection(),
                      _buildDescriptionTextField(),
                    ].separatedBy(
                      const Space.vertical(20.0),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildNameTextField() {
    return AppTextField(
      bloc.nameTFE,
      labelText: S.of(context).name,
      textInputAction: TextInputAction.next,
    );
  }

  Widget _buildSizeAndSurfaceSelectors() {
    return Row(
      children: [
        Flexible(
          child: _buildSizeSelector(),
        ),
        const Space.horizontal(20.0),
        Flexible(
          child: _buildSurfaceSelector(),
        ),
      ],
    );
  }

  Widget _buildCoordinatesSection() {
    return NewSpotCoordinatesSection(
      bloc: bloc,
    );
  }

  Widget _buildSizeSelector() {
    return DropdownMenu<WorkoutSpotSize>(
      dropdownItemStyle: DropdownItemStyle(
        borderRadius: BorderRadius.circular(20.0),
      ),
      items: WorkoutSpotSize.values
          .map(
            (size) => AppDropdownMenuItem<WorkoutSpotSize>(
              text: size.getDescription(context),
              value: size,
            ),
          )
          .toList(),
      placeholderText: S.of(context).size,
      onItemSelected: (value) {
        // TODO Implement - update selected value
        AlertDialogUtils.showContentUnavailable(context);
      },
    );
  }

  Widget _buildSurfaceSelector() {
    return DropdownMenu<Surface>(
      dropdownItemStyle: DropdownItemStyle(
        borderRadius: BorderRadius.circular(20.0),
      ),
      items: Surface.values
          .map(
            (surface) => AppDropdownMenuItem<Surface>(
              text: surface.getDescription(context),
              value: surface,
            ),
          )
          .toList(),
      placeholderText: S.of(context).surface,
      onItemSelected: (value) {
        // TODO Implement - update selected value
        AlertDialogUtils.showContentUnavailable(context);
      },
    );
  }

  List<Widget> _buildAddressSection() {
    return [
      _buildCityTextField(),
      Row(
        children: [
          Flexible(
            flex: 2,
            child: _buildStreetTextField(),
          ),
          const Space.horizontal(20.0),
          Flexible(
            child: _buildHouseNumberTextField(),
          ),
        ],
      ),
    ];
  }

  Widget _buildCityTextField() {
    return AppTextField(
      bloc.cityTFE,
      keyboardType: TextInputType.name,
      labelText: S.of(context).city,
      textInputAction: TextInputAction.next,
    );
  }

  Widget _buildStreetTextField() {
    return AppTextField(
      bloc.streetTFE,
      keyboardType: TextInputType.streetAddress,
      labelText: S.of(context).street,
      textInputAction: TextInputAction.next,
    );
  }

  Widget _buildHouseNumberTextField() {
    return AppTextField(
      bloc.houseNumberTFE,
      keyboardType: TextInputType.number,
      labelText: S.of(context).hosueNumber,
      textInputAction: TextInputAction.next,
    );
  }

  Widget _buildDescriptionTextField() {
    return AppTextField(
      bloc.descriptionTFE,
      keyboardType: TextInputType.multiline,
      labelText: S.of(context).description,
      minLines: 6,
      textInputAction: TextInputAction.done,
    );
  }
}
