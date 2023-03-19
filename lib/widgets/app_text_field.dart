import 'package:app/common/text_field_essentials.dart';
import 'package:app/extensions/extensions.dart';
import 'package:app/styles/app_colors.dart';
import 'package:app/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final String? additionalInfoText;
  final bool autofocus;
  final Color? backgroundColor;
  final TextFieldEssentials essentials;
  final bool isEnabled;
  final TextInputType? keyboardType;
  final String? labelText;
  final int minLines;
  final int maxLines;
  final Widget? prefix;
  final String? prefixText;
  final Widget? rightScope;
  final bool shouldShowAdditionalInfoOnFocus;
  final bool shouldShowRequiredSign;
  final Widget? suffix;
  final Widget? suffixIcon;
  final double suffixIconSize;
  final String? suffixText;
  final TextAlign textAlign;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final void Function(bool)? onFocusChanged;
  final VoidCallback? onRightSuffixPressed;
  final VoidCallback? onSubmitted;
  final void Function(String)? onTextChanged;

  const AppTextField(
    this.essentials, {
    this.additionalInfoText,
    this.autofocus = false,
    this.backgroundColor,
    this.isEnabled = true,
    this.keyboardType,
    this.labelText,
    this.minLines = 1,
    this.maxLines = 1,
    this.prefix,
    this.prefixText,
    this.rightScope,
    this.shouldShowAdditionalInfoOnFocus = false,
    this.shouldShowRequiredSign = false,
    this.suffix,
    this.suffixIcon,
    this.suffixIconSize = 20.0,
    this.suffixText,
    this.textAlign = TextAlign.start,
    this.textCapitalization,
    this.textInputAction,
    this.onFocusChanged,
    this.onRightSuffixPressed,
    this.onSubmitted,
    this.onTextChanged,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _hasLostFirstFocus = false;

  TextEditingController get _controller => _essentials.controller;

  TextFieldEssentials get _essentials => widget.essentials;

  FocusNode get _focusNode => _essentials.focusNode;

  bool get _shouldValidate => _hasLostFirstFocus || _essentials.shouldForceDisplayingError;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChanged);
    super.dispose();
  }

  void _onFocusChanged() {
    widget.onFocusChanged?.call(_focusNode.hasFocus);
    if (_focusNode.hasFocus || _hasLostFirstFocus) return;
    setState(() => _hasLostFirstFocus = true);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: widget.autofocus,
      autovalidateMode: _shouldValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
      controller: _controller,
      cursorColor: AppColors.black,
      decoration: _buildInputDecoration(),
      enabled: widget.isEnabled,
      focusNode: _focusNode,
      keyboardType: widget.keyboardType,
      minLines: widget.minLines,
      maxLines: widget.keyboardType == TextInputType.multiline ? null : widget.maxLines,
      onChanged: widget.onTextChanged,
      onFieldSubmitted: (_) => widget.onSubmitted?.call(),
      style: AppTextStyles.textFieldContent(),
      textAlign: widget.textAlign,
      textCapitalization: widget.textCapitalization ??
          (widget.keyboardType == TextInputType.name ? TextCapitalization.sentences : TextCapitalization.none),
      textInputAction: widget.textInputAction,
      validator: (value) => _essentials.validator(value.orEmpty())?.getMessage(context),
    );
  }

  InputDecoration _buildInputDecoration() {
    return InputDecoration(
      alignLabelWithHint: widget.minLines > 1,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 12.0,
      ),
      border: _buildBorder(),
      enabledBorder: _buildBorder(),
      errorBorder: _buildBorder(
        color: AppColors.red,
      ),
      errorStyle: AppTextStyles.error(),
      errorMaxLines: 3,
      fillColor: AppColors.white,
      filled: true,
      floatingLabelStyle: AppTextStyles.textFieldLabel(),
      focusedBorder: _buildBorder(
        color: AppColors.blue,
      ),
      focusedErrorBorder: _buildBorder(
        color: AppColors.blue,
      ),
      labelText: widget.labelText,
      labelStyle: AppTextStyles.textFieldLabel(),
      prefixText: widget.prefixText,
      prefix: widget.prefix,
      suffix: widget.suffix,
      suffixIcon: widget.suffixIcon ?? _maybeBuildRightScope(),
      suffixIconConstraints: BoxConstraints(
        maxHeight: widget.suffixIconSize,
        minHeight: widget.suffixIconSize,
      ),
      suffixStyle: const TextStyle(
        color: AppColors.black,
      ),
      suffixText: widget.suffixText,
    );
  }

  OutlineInputBorder _buildBorder({
    Color color = AppColors.black,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: BorderSide(
        color: color,
      ),
    );
  }

  Widget? _maybeBuildRightScope() {
    if (widget.rightScope == null) return null;
    return Padding(
      padding: const EdgeInsets.only(
        right: 16.0,
      ),
      child: GestureDetector(
        onTap: () => widget.onRightSuffixPressed?.call(),
        behavior: HitTestBehavior.translucent,
        child: SizedBox.fromSize(
          size: Size.square(widget.suffixIconSize),
          child: widget.rightScope,
        ),
      ),
    );
  }
}
