import 'package:app/extensions/extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppNetworkImage extends StatelessWidget {
  final double borderRadius;
  final Widget? errorWidget;
  final BoxFit? fit;
  final double? height;
  final String? imageUrl;
  final int memCacheWidth;
  final Widget? placeholder;
  final double? width;

  const AppNetworkImage(
    this.imageUrl, {
    this.borderRadius = 12.0,
    this.errorWidget,
    this.fit,
    this.height,
    super.key,
    this.memCacheWidth = 1000,
    this.placeholder,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isNullOrBlank) return const SizedBox.shrink();
    final Widget? placeholderLocal = placeholder;
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: CachedNetworkImage(
        height: height,
        width: width,
        errorWidget: (_, __, ___) => const SizedBox.shrink(),
        fit: fit,
        imageUrl: imageUrl!,
        memCacheWidth: memCacheWidth,
        placeholder: placeholderLocal != null ? (_, __) => placeholderLocal : null,
      ),
    );
  }
}
