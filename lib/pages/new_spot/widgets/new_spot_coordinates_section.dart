import 'package:app/common/constants.dart';
import 'package:app/common/maps/i_map_coordinator.dart';
import 'package:app/extensions/list_extensions.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/modals/bottom_sheets/select_location_on_map_bottom_sheet.dart';
import 'package:app/models/map_essentials.dart';
import 'package:app/networking/models/map_position.dart';
import 'package:app/pages/new_spot/new_spot_cubit.dart';
import 'package:app/widgets/primary_button.dart';
import 'package:app/widgets/space.dart';
import 'package:flutter/material.dart';

class NewSpotCoordinatesSection extends StatefulWidget {
  final NewSpotCubit bloc;
  final MapPosition? mapPosition;

  const NewSpotCoordinatesSection({
    required this.bloc,
    required this.mapPosition,
  });

  @override
  State<NewSpotCoordinatesSection> createState() => _NewSpotCoordinatesSectionState();
}

class _NewSpotCoordinatesSectionState extends State<NewSpotCoordinatesSection> {
  bool get _shouldDisplayMap => _mapPosition != null;

  IMapCoordinator get _mapCoordinator => widget.bloc.mapCoordinator;

  MapPosition? get _mapPosition => widget.mapPosition;

  @override
  void didUpdateWidget(covariant NewSpotCoordinatesSection oldWidget) {
    super.didUpdateWidget(oldWidget);

    final MapPosition? newMapPosition = _mapPosition;
    if (newMapPosition == null) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _mapCoordinator.moveToPosition(newMapPosition);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_shouldDisplayMap) ...[
          _buildMiniMap(context),
          const Space.vertical(20.0),
        ],
        _buildSelectOnTheMapButton(context),
      ],
    );
  }

  Widget _buildMiniMap(BuildContext context) {
    final double? latitude = _mapPosition?.latitude;
    final double? longitude = _mapPosition?.longitude;
    if (latitude == null || longitude == null) return const SizedBox.shrink();
    return SizedBox(
      height: 200.0,
      child: _mapCoordinator.buildSimpleMap(
        context,
        mapEssentials: MapEssentials(
          maxZoom: Constants.maps.maxLocationZoom,
          minZoom: Constants.maps.minLocationZoom,
          initialCoordinates: MapPosition(
            latitude: latitude,
            longitude: longitude,
          ),
          zoom: 10.0,
        ),
        positions: [
          _mapPosition,
        ].filterNotNull(),
      ),
    );
  }

  Widget _buildSelectOnTheMapButton(BuildContext context) {
    return PrimaryButton(
      S.of(context).newSpotCoordinatesSectionButtonTitle,
      onPressed: () {
        SelectLocationOnMapBottomSheet(
          context,
          initialPosition: _mapPosition,
          mapCoordinator: widget.bloc.mapCoordinator,
          onPositionSelected: (position) => widget.bloc.mapPositionNotifier.value = position,
        ).show();
      },
    );
  }
}
