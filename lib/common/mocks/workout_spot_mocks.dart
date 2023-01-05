import 'package:app/models/workout_spot_model.dart';
import 'package:app/networking/models/address.dart';
import 'package:app/networking/models/equipment.dart';
import 'package:app/networking/models/map_position.dart';
import 'package:app/networking/models/surface.dart';
import 'package:app/networking/models/workout_spot_size.dart';

abstract class WorkoutSpotMocks {
  const WorkoutSpotMocks._();

  static List<WorkoutSpotModel> spots = [
    const WorkoutSpotModel(
      address: Address(
        city: 'Poznań',
        street: 'Park Drwęskich',
      ),
      coordinates: MapPosition(
        lat: 52.39963,
        lng: 16.92525,
      ),
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
      equipment: [
        Equipment.highBar,
        Equipment.horizontalLadder,
        Equipment.lowBar,
        Equipment.parallelBars,
        Equipment.pole,
        Equipment.verticalLadder,
      ],
      images: [],
      name: 'Park Drwęskich',
      size: WorkoutSpotSize.medium,
      surface: Surface.tartan,
    ),
    const WorkoutSpotModel(
      address: Address(
        city: 'Poznań',
        street: 'Park Jana Pawła II',
      ),
      coordinates: MapPosition(
        lat: 52.38908,
        lng: 16.92539,
      ),
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
      equipment: [
        Equipment.highBar,
        Equipment.horizontalLadder,
        Equipment.lowBar,
        Equipment.parallelBars,
        Equipment.pole,
        Equipment.rope,
        Equipment.parkourWalls,
        Equipment.verticalLadder,
      ],
      images: [],
      name: 'Park Jana Pawła II',
      size: WorkoutSpotSize.medium,
      surface: Surface.tartan,
    ),
    const WorkoutSpotModel(
      address: Address(
        city: 'Poznań',
        street: 'Osiedle Zwycięstwa',
      ),
      coordinates: MapPosition(
        lat: 52.44089,
        lng: 16.92665,
      ),
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
      equipment: [
        Equipment.highBar,
        Equipment.horizontalLadder,
        Equipment.lowBar,
        Equipment.parallelBars,
        Equipment.pole,
        Equipment.rope,
        Equipment.verticalLadder,
      ],
      images: [],
      name: 'Osiedle Zwycięstwa',
      size: WorkoutSpotSize.big,
      surface: Surface.tartan,
    ),
  ];
}
