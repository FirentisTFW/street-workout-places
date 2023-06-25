sealed class Zoom {
  final double value;

  const Zoom(this.value);
}

final class ZoomDirect extends Zoom {
  const ZoomDirect(super.value);
}

final class ZoomIncremental extends Zoom {
  const ZoomIncremental(super.value);
}
