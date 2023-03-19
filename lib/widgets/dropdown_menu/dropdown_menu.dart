import 'package:app/extensions/string_extensions.dart';
import 'package:app/styles/app_animations.dart';
import 'package:app/styles/app_colors.dart';
import 'package:app/styles/app_text_styles.dart';
import 'package:app/widgets/adaptive_button.dart';
import 'package:app/widgets/dropdown_menu/app_dropdown_menu_item.dart';
import 'package:app/widgets/dropdown_menu/dropdown_item_style.dart';
import 'package:app/widgets/dropdown_menu/dropdown_menu_cell.dart';
import 'package:app/widgets/dropdown_menu/dropdown_menu_separator.dart';
import 'package:app/widgets/space_text_span.dart';
import 'package:flutter/material.dart';

class DropdownMenu<T> extends StatefulWidget {
  final double arrowHeight;
  final double bottomOffset;
  final DropdownItemStyle dropdownItemStyle;
  final double height;
  final List<AppDropdownMenuItem<T>> items;
  final void Function(T value) onItemSelected;
  final String? placeholderText;
  final TextStyle? placeholderTextStyle;
  final bool shouldAlwaysDisplayPlaceholder;
  final T? value;

  const DropdownMenu({
    this.arrowHeight = 10.0,
    this.bottomOffset = 100.0,
    this.dropdownItemStyle = const DropdownItemStyle(),
    this.height = 50.0,
    required this.items,
    required this.onItemSelected,
    this.placeholderText,
    this.placeholderTextStyle,
    this.shouldAlwaysDisplayPlaceholder = false,
    this.value,
  });

  @override
  _DropdownMenuState<T> createState() => _DropdownMenuState<T>();
}

class _DropdownMenuState<T> extends State<DropdownMenu<T>> with TickerProviderStateMixin {
  final LayerLink _layerLink = LayerLink();
  late final AnimationController _animationController;
  late final Animation<double> _expandAnimation;

  bool _isOpen = false;
  late int _currentIndex;
  late OverlayEntry _overlayEntry;

  bool get _shouldDisplayPlaceholder => _currentIndex == -1;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.items.indexWhere((item) => item.value == widget.value);
    _animationController = AnimationController(
      duration: AppAnimations.regularDuration,
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      curve: Curves.easeInOut,
      parent: _animationController,
    );
  }

  @override
  void didUpdateWidget(covariant DropdownMenu<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    _currentIndex = widget.items.indexWhere((item) => item.value == widget.value);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // link the overlay to the button
    return CompositedTransformTarget(
      link: _layerLink,
      child: SizedBox(
        height: widget.height,
        child: AdaptiveButton(
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(20.0),
            color: AppColors.white,
          ),
          onPressed: _toggleDropdown,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
            ),
            child: _buildTextAndArrow(),
          ),
        ),
      ),
    );
  }

  Widget _buildTextAndArrow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (_shouldDisplayPlaceholder)
          Text(
            widget.placeholderText.orEmpty(),
            style: widget.placeholderTextStyle ?? AppTextStyles.textFieldLabel(),
          )
        else if (widget.shouldAlwaysDisplayPlaceholder)
          Text.rich(
            TextSpan(
              text: '${widget.placeholderText}:',
              style: widget.placeholderTextStyle ?? AppTextStyles.textFieldLabel(),
              children: [
                const SpaceTextSpan(),
                TextSpan(
                  text: widget.items[_currentIndex].text,
                  style: AppTextStyles.textFieldLabel(),
                ),
              ],
            ),
          )
        else
          Text(
            widget.items[_currentIndex].text,
            style: AppTextStyles.contentBigger(),
          ),
      ],
    );
  }

  OverlayEntry? _createOverlayEntry() {
    // find the size and position of the current widget
    final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox == null) return null;
    final Size size = renderBox.size;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final double topOffset = offset.dy + size.height + 5.0;

    return OverlayEntry(
      builder: (_) => GestureDetector(
        onTap: () => _toggleDropdown(
          close: true,
        ),
        behavior: HitTestBehavior.translucent,
        child: SizedBox(
          // full screen GestureDetector to register when user has clicked away from the dropdown
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Positioned(
                left: offset.dx,
                top: topOffset,
                width: size.width,
                child: CompositedTransformFollower(
                  link: _layerLink,
                  offset: widget.dropdownItemStyle.offset ?? Offset(0.0, size.height + 5.0),
                  showWhenUnlinked: false,
                  child: _buildExpandableListContainer(
                    topOffset: topOffset,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpandableListContainer({
    required double topOffset,
  }) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: widget.dropdownItemStyle.borderRadius ?? BorderRadius.zero,
        border: Border.all(
          color: AppColors.greyDark,
        ),
        color: widget.dropdownItemStyle.color ?? AppColors.white,
      ),
      child: _buildExpandableList(
        topOffset: topOffset,
      ),
    );
  }

  Widget _buildExpandableList({
    required double topOffset,
  }) {
    return SizeTransition(
      axisAlignment: 1.0,
      sizeFactor: _expandAnimation,
      child: ConstrainedBox(
        constraints: widget.dropdownItemStyle.constraints ??
            BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height - topOffset - widget.bottomOffset,
            ),
        child: ListView.separated(
          itemBuilder: (_, index) {
            final AppDropdownMenuItem<T> item = widget.items[index];
            return DropdownMenuCell(
              item.text,
              borderRadius: widget.dropdownItemStyle.borderRadius,
              onPressed: () {
                setState(() => _currentIndex = index);
                widget.onItemSelected.call(item.value);
                _toggleDropdown();
              },
            );
          },
          itemCount: widget.items.length,
          padding: widget.dropdownItemStyle.padding ?? EdgeInsets.zero,
          physics: const ClampingScrollPhysics(),
          separatorBuilder: (_, __) => const DropdownMenuItemSeparator(),
          shrinkWrap: true,
        ),
      ),
    );
  }

  Future<void> _toggleDropdown({
    bool close = false,
  }) async {
    if (_isOpen || close) {
      if (!mounted) return;
      await _animationController.reverse();
      _overlayEntry.remove();
      setState(() => _isOpen = false);
    } else {
      final OverlayEntry? overlayEntry = _createOverlayEntry();
      if (overlayEntry != null) {
        _overlayEntry = overlayEntry;
        Overlay.of(context).insert(_overlayEntry);
        setState(() => _isOpen = true);
        _animationController.forward();
      }
    }
  }
}
