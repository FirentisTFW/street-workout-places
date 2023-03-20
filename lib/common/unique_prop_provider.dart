import 'package:flutter/material.dart';

abstract class UniquePropProvider {
  const UniquePropProvider._();

  static UniqueProp get() => UniqueProp();
}

@immutable
class UniqueProp {
  /// Do not add a const constructor.
  // ignore: prefer_const_constructors_in_immutables
  UniqueProp();
}
