import 'package:app/presentation/pages/image_gallery/image_gallery_page_arguments.dart';
import 'package:app/presentation/routing/dashboard_tabs/spots_routing.dart';
import 'package:app/presentation/widgets/app_network_image.dart';
import 'package:app/presentation/widgets/page_indicator.dart';
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
        GestureDetector(
          // FIXME Clean up
          onTap: () {
            Navigator.pushNamed(
              context,
              SpotsRouting.imageGallery,
              arguments: ImageGalleryPageArguments(
                images: widget.images,
                intiallySelectedImage: widget.images[_currentPageIndexNotifier.value],
              ),
            );
          },
          child: SizedBox(
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
        ),
        PageIndicator(
          currentPageIndexValueListenable: _currentPageIndexNotifier,
          pageCount: widget.images.length,
        ),
      ],
    );
  }
}
