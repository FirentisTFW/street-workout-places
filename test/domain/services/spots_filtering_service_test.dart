import 'package:app/domain/models/filters.dart';
import 'package:app/domain/models/workout_spot_model.dart';
import 'package:app/domain/services/spots_filtering_service.dart';
import 'package:app/infrastructure/networking/models/equipment.dart';
import 'package:app/infrastructure/networking/models/map_position.dart';
import 'package:app/infrastructure/networking/models/surface.dart';
import 'package:app/infrastructure/networking/models/workout_spot_size.dart';
import 'package:flutter_test/flutter_test.dart';

List<WorkoutSpotModel> _spots = [
  const WorkoutSpotModel(
    coordinates: MapPosition(
      latitude: 52.39963,
      longitude: 16.92525,
    ),
    equipment: [
      Equipment.highBar,
    ],
    id: 1,
    size: WorkoutSpotSize.small,
    surface: Surface.concrete,
  ),
  const WorkoutSpotModel(
    coordinates: MapPosition(
      latitude: 52.38908,
      longitude: 16.92539,
    ),
    equipment: [
      Equipment.highBar,
      Equipment.rope,
      Equipment.parkourWalls,
    ],
    id: 2,
    size: WorkoutSpotSize.medium,
    surface: Surface.tartan,
  ),
  const WorkoutSpotModel(
    coordinates: MapPosition(
      latitude: 52.44089,
      longitude: 16.92665,
    ),
    equipment: [
      Equipment.highBar,
      Equipment.horizontalLadder,
      Equipment.rope,
    ],
    id: 3,
    size: WorkoutSpotSize.big,
    surface: Surface.sand,
  ),
];

void main() {
  group('SpotsFilteringService -', () {
    group('filterSpots -', () {
      group('equipment -', () {
        test('When no equipment filters are provided, returns all spots', () {
          final List<WorkoutSpotModel> result = SpotsFilteringService().filterSpots(
            filters: const Filters.empty(),
            spots: _spots,
          );
          expect(result, _spots);
        });
        group('When equipment filters are provided -', () {
          test('And some spots match filters, returns spots containing every piece of selected equipment', () {
            final List<WorkoutSpotModel> result = SpotsFilteringService().filterSpots(
              filters: const Filters.empty().copyWith(
                equipment: [
                  Equipment.highBar,
                  Equipment.rope,
                ],
              ),
              spots: _spots,
            );
            expect(
              result,
              [
                _spots[1],
                _spots.last,
              ],
            );
          });
          test('And none of the spots matches filters, returns empty list', () {
            final List<WorkoutSpotModel> result = SpotsFilteringService().filterSpots(
              filters: const Filters.empty().copyWith(
                equipment: [
                  Equipment.parkourWalls,
                  Equipment.horizontalLadder,
                ],
              ),
              spots: _spots,
            );
            expect(result, []);
          });
        });
      });

      group('size -', () {
        test('When no size filters are provided, returns all spots', () {
          final List<WorkoutSpotModel> result = SpotsFilteringService().filterSpots(
            filters: const Filters.empty(),
            spots: _spots,
          );
          expect(result, _spots);
        });
        group('When size filters are provided -', () {
          test('And some spot matches filters, returns spots having any of selected sizes', () {
            final List<WorkoutSpotModel> result = SpotsFilteringService().filterSpots(
              filters: const Filters.empty().copyWith(
                sizes: [
                  WorkoutSpotSize.big,
                  WorkoutSpotSize.medium,
                ],
              ),
              spots: _spots,
            );
            expect(
              result,
              [
                _spots[1],
                _spots.last,
              ],
            );
          });
          test('And none of the spots matches filters, returns empty list', () {
            final List<WorkoutSpotModel> result = SpotsFilteringService().filterSpots(
              filters: const Filters.empty().copyWith(
                sizes: [
                  WorkoutSpotSize.small,
                ],
              ),
              spots: [
                _spots[1],
                _spots.last,
              ],
            );
            expect(result, []);
          });
        });
      });
      group('surface -', () {
        test('When no surface filters are provided, returns all spots', () {
          final List<WorkoutSpotModel> result = SpotsFilteringService().filterSpots(
            filters: const Filters.empty(),
            spots: _spots,
          );
          expect(result, _spots);
        });
      });
      group('When surface filters are provided -', () {
        test('And some spot matches filters, returns spots having any of selecd surfaces', () {
          final List<WorkoutSpotModel> result = SpotsFilteringService().filterSpots(
            filters: const Filters.empty().copyWith(
              surfaces: [
                Surface.tartan,
                Surface.sand,
              ],
            ),
            spots: _spots,
          );
          expect(
            result,
            [
              _spots[1],
              _spots.last,
            ],
          );
        });
        test('And none of the spots matches filters, returns empty list', () {
          final List<WorkoutSpotModel> result = SpotsFilteringService().filterSpots(
            filters: const Filters.empty().copyWith(
              surfaces: [
                Surface.different,
              ],
            ),
            spots: _spots,
          );
          expect(result, []);
        });
      });
    });
  });
}
