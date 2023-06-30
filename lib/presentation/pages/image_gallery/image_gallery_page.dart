import 'package:app/presentation/pages/image_gallery/image_gallery_page_arguments.dart';
import 'package:app/presentation/pages/image_gallery/widgets/image_gallery_navigation.dart';
import 'package:app/presentation/pages/image_gallery/widgets/image_gallery_slider_item.dart';
import 'package:app/presentation/styles/app_animations.dart';
import 'package:app/presentation/styles/app_colors.dart';
import 'package:app/presentation/styles/app_dimensions.dart';
import 'package:app/presentation/styles/app_padding.dart';
import 'package:app/presentation/widgets/app_app_bar.dart';
import 'package:app/presentation/widgets/app_progress_indicator.dart';
import 'package:app/presentation/widgets/space.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ImageGalleryPage extends StatefulWidget {
  final ImageGalleryPageArguments arguments;

  const ImageGalleryPage({
    required this.arguments,
  });

  @override
  State<ImageGalleryPage> createState() => _ImageGalleryPageState();
}

class _ImageGalleryPageState extends State<ImageGalleryPage> {
  late final PageController _pageController = PageController(
    initialPage: _initialImageIndex,
  );
  late int _currentPageIndex = _initialImageIndex;

  List<String> get _images => widget.arguments.images;

  int get _imageCount => _images.length;

  int get _initialImageIndex => _images.indexWhere(
        (image) => image == widget.arguments.intiallySelectedImage,
      );

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        _buildGalleryPageView(),
        const Space.vertical(16.0),
        _buildGalleryNavigation(),
        const Space.vertical(16.0),
        _buildImageSlider(),
      ],
    );
  }

  Widget _buildGalleryPageView() {
    return SizedBox.square(
      dimension: MediaQuery.of(context).size.width,
      child: PhotoViewGallery.builder(
        backgroundDecoration: const BoxDecoration(
          color: AppColors.white,
        ),
        itemCount: _images.length,
        loadingBuilder: (_, __) => const AppProgressIndicator(
          strokeWidth: 2.0,
        ),
        pageController: _pageController,
        scrollPhysics: const BouncingScrollPhysics(),
        onPageChanged: (newPageIndex) => setState(() => _currentPageIndex = newPageIndex),
        builder: (_, index) => PhotoViewGalleryPageOptions(
          errorBuilder: (_, __, ___) => const SizedBox.shrink(),
          imageProvider: CachedNetworkImageProvider(_images[index]),
          minScale: 0.1,
        ),
      ),
    );
  }

  Widget _buildGalleryNavigation() {
    return ImageGalleryNavigation(
      currentItemPosition: _currentPageIndex + 1,
      itemsCount: _imageCount,
      onLeftArrowPressed: () => _pageController.previousPage(
        duration: AppAnimations.regularDuration,
        curve: Curves.easeIn,
      ),
      onRightArrowPressed: () => _pageController.nextPage(
        duration: AppAnimations.regularDuration,
        curve: Curves.easeIn,
      ),
    );
  }

  Widget _buildImageSlider() {
    return SizedBox(
      height: AppDimensions.height.imageGalleryListItem,
      child: ListView.separated(
        itemBuilder: (_, index) => ImageGallerySliderItem(
          imageUrl: _images[index],
          isSelected: index == _currentPageIndex,
          onPressed: () => _pageController.animateToPage(
            index,
            duration: AppAnimations.regularDuration,
            curve: Curves.easeIn,
          ),
        ),
        itemCount: _imageCount,
        padding: AppPadding.defaultHorizontal,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const Space.horizontal(14.0),
      ),
    );
  }
}
