import 'package:app/common/constants.dart';
import 'package:app/common/maps/open_street_map/open_streeet_map_map_coordinator.dart';
import 'package:app/extensions/extensions.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/modals/bottom_sheets/basic_bottom_sheet.dart';
import 'package:app/networking/models/map_position.dart';
import 'package:app/styles/app_text_styles.dart';
import 'package:app/widgets/primary_button.dart';
import 'package:app/widgets/space.dart';
import 'package:app/widgets/space_text_span.dart';
import 'package:flutter/material.dart';

class SelectLocationOnMapBottomSheet {
  final BuildContext context;
  final void Function(MapPosition postition) onPositionSelected;

  const SelectLocationOnMapBottomSheet(
    this.context, {
    required this.onPositionSelected,
  });

  Future<void> show() {
    return BasicBottomSheet(
      context,
      child: _SelectLocationOnMapBottomSheetBody(
        onPositionSelected: onPositionSelected,
      ),
    ).show();
  }
}

class _SelectLocationOnMapBottomSheetBody extends StatefulWidget {
  final void Function(MapPosition postition) onPositionSelected;

  const _SelectLocationOnMapBottomSheetBody({
    required this.onPositionSelected,
  });

  @override
  State<_SelectLocationOnMapBottomSheetBody> createState() => _SelectLocationOnMapBottomSheetBodyState();
}

class _SelectLocationOnMapBottomSheetBodyState extends State<_SelectLocationOnMapBottomSheetBody> {
  MapPosition? _selectedPosition;

  bool get _isPositionSelected => _selectedPosition != null;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildDescription(),
        _buildMap(),
        if (_isPositionSelected) _buildSelectedPositionSection(),
      ].separatedBy(
        const Space.vertical(20.0),
      ),
    );
  }

  Widget _buildDescription() {
    return Text(
      S.of(context).selectLocationOnMapDescription,
      style: AppTextStyles.contentBiggerMultiline(),
    );
  }

  Widget _buildMap() {
    return SizedBox(
      height: 300.0,
      // FIXME DI for Coordinator
      child: OpenStreetMapMapCoordinator().buildSimpleMap(
        context,
        mapEssentials: Constants.maps.essentials,
        positions: [
          _selectedPosition,
        ].filterNotNull(),
        onPositionSelected: (position) {
          setState(() {
            _selectedPosition = position;
          });
        },
      ),
    );
  }

  Widget _buildSelectedPositionSection() {
    final double? latitude = _selectedPosition?.latitude;
    final double? longitude = _selectedPosition?.longitude;
    if (latitude == null || longitude == null) return const SizedBox.shrink();
    const int fractionDigits = 4;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitleValuePair(S.of(context).latitudeShort, latitude.toStringAsFixed(fractionDigits)),
              const Space.vertical(14.0),
              _buildTitleValuePair(S.of(context).longitudeShort, longitude.toStringAsFixed(fractionDigits)),
            ],
          ),
        ),
        Flexible(
          child: PrimaryButton(
            S.of(context).save,
            onPressed: () {
              final MapPosition? selectedPosition = _selectedPosition;
              if (selectedPosition == null) return;
              widget.onPositionSelected(selectedPosition);
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTitleValuePair(String title, String value) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: title,
            style: AppTextStyles.contentBold(),
          ),
          const SpaceTextSpan(),
          TextSpan(
            text: value,
            style: AppTextStyles.content(),
          ),
        ],
      ),
    );
  }
}
