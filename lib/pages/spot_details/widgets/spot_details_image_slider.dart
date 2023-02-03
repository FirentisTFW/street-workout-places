import 'package:app/widgets/app_network_image.dart';
import 'package:app/widgets/page_indicator.dart';
import 'package:flutter/material.dart';

class SpotDetailsImageSlider extends StatefulWidget {
  final List<String> images;

  const SpotDetailsImageSlider({
    required this.images,
  });

  @override
  State<SpotDetailsImageSlider> createState() => _SpotDetailsImageSliderState();
}

class _SpotDetailsImageSliderState extends State<SpotDetailsImageSlider> {
  final ValueNotifier<int> _currentPageIndexNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: 250.0,
          width: MediaQuery.of(context).size.width,
          child: PageView.builder(
            itemBuilder: (_, index) => AppNetworkImage(
              widget.images[index],
              borderRadius: 0.0,
              fit: BoxFit.cover,
            ),
            itemCount: widget.images.length,
            onPageChanged: (newPageIndex) => setState(() => _currentPageIndexNotifier.value = newPageIndex),
          ),
        ),
        PageIndicator(
          currentPageIndexValueListenable: _currentPageIndexNotifier,
          pageCount: widget.images.length,
        ),
      ],
    );
  }
}
