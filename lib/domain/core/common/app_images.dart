import 'package:flutter/widgets.dart';

enum AppImages {
  mapPlaceholder('map_placeholder.png');

  final String path;

  AssetImage get imageProvider => AssetImage('$_basePath/$path');

  const AppImages(this.path);

  static const String _basePath = 'assets/images';
}
