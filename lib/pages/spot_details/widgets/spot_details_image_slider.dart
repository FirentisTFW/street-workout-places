import 'package:app/widgets/app_network_image.dart';
import 'package:flutter/material.dart';

class SpotDetailsImageSlider extends StatelessWidget {
  final List<String> images;

  const SpotDetailsImageSlider({
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    // FIXME Add page indicator
    return SizedBox(
      height: 250.0,
      width: MediaQuery.of(context).size.width,
      child: PageView.builder(
        itemBuilder: (_, index) => AppNetworkImage(
          images[index],
          borderRadius: 0.0,
          fit: BoxFit.cover,
        ),
        itemCount: images.length,
        // pageController: _pageController,
        // onPageChanged: (newPageIndex) => setState(() => _currentPageIndex = newPageIndex),
      ),
    );
  }
}
