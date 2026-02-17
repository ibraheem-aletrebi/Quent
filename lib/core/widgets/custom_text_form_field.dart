import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quent/core/constants/hive_keys.dart';
import 'package:quent/core/resources/app_border.dart';
import 'package:quent/core/resources/app_color.dart';
import 'package:quent/core/resources/app_size.dart';
import 'package:quent/core/services/local/local_storage_helper.dart';

enum ValidationState { none, typing, valid, error }

enum BorderState { normal, focused, error, success, disabled }

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isPassword;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final void Function()? onEditingComplete;
  final FocusNode? focusNode;
  final int? maxLength;
  final bool autoFocus;
  final bool readOnly;
  final bool enabled;
  final int maxLines;
  final int? minLines;
  final TextDirection? textDirection;
  final bool enableSuggestions;
  final bool autocorrect;
  final AutovalidateMode? autovalidateMode;
  final String? initialValue;
  final Color? cursorColor;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? errorStyle;
  final bool filled;
  final Color? fillColor;
  final EdgeInsetsGeometry? contentPadding;
  final bool showCounter;
  final bool showClearButton;
  final Duration validationDelay;
  final bool showValidationIcons;
  final BorderRadius? borderRadius;
  final double borderWidth;
  final Color? focusColor;
  final Color? hoverColor;
  final bool showLoadingOnValidation;
  final Widget? customSuccessIcon;
  final Widget? customErrorIcon;
  final String? successMessage;
  final String? errorMessage;
  final void Function()? onTap;
  const CustomTextFormField({
    super.key,
    this.onTap,
    this.controller,
    this.labelText,
    this.hintText,
    this.helperText,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.onEditingComplete,
    this.focusNode,
    this.maxLength,
    this.autoFocus = false,
    this.readOnly = false,
    this.enabled = true,
    this.maxLines = 1,
    this.minLines,
    this.textDirection,
    this.enableSuggestions = true,
    this.autocorrect = true,
    this.autovalidateMode,
    this.initialValue,
    this.cursorColor,
    this.style,
    this.hintStyle,
    this.labelStyle,
    this.errorStyle,
    this.filled = true,
    this.fillColor,
    this.contentPadding,
    this.showCounter = false,
    this.showClearButton = false,
    this.validationDelay = const Duration(milliseconds: 300),
    this.showValidationIcons = true,
    this.borderRadius,
    this.borderWidth = 1.5,
    this.focusColor,
    this.hoverColor,
    this.showLoadingOnValidation = false,
    this.customSuccessIcon,
    this.customErrorIcon,
    this.successMessage,
    this.errorMessage,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  late bool _obscureText;
  bool _isControllerOwned = false;
  bool _isFocusNodeOwned = false;
  late TextDirection _textDirection;

  ValidationState _validationState = ValidationState.none;
  BorderState _borderState = BorderState.normal;
  bool _isValidating = false;
  Timer? _validationTimer;
  String? _validationError;

  @override
  void initState() {
    super.initState();
    _textDirection =
        widget.textDirection ??
        (LocalStorageHelper().getValue<String>(HiveKeys.languageCode) == 'ar'
            ? TextDirection.rtl
            : TextDirection.ltr);

    if (widget.controller == null) {
      _controller = TextEditingController(text: widget.initialValue);
      _isControllerOwned = true;
    } else {
      _controller = widget.controller!;
      if (widget.initialValue != null && _controller.text.isEmpty) {
        _controller.text = widget.initialValue!;
      }
    }

    if (widget.focusNode == null) {
      _focusNode = FocusNode();
      _isFocusNodeOwned = true;
    } else {
      _focusNode = widget.focusNode!;
    }

    _obscureText = widget.isPassword;

    _setupListeners();

    if (_controller.text.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _runValidation(initial: true);
        }
      });
    }
  }

  void _setupListeners() {
    _focusNode.addListener(_handleFocusChange);
    _controller.addListener(_handleTextChanged);
  }

  void _removeListeners() {
    _focusNode.removeListener(_handleFocusChange);
    _controller.removeListener(_handleTextChanged);
  }

  @override
  void didUpdateWidget(CustomTextFormField oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.controller != oldWidget.controller) {
      _removeListeners();

      if (_isControllerOwned && oldWidget.controller == null) {
        _controller.dispose();
      }

      if (widget.controller == null) {
        _controller = TextEditingController(text: widget.initialValue);
        _isControllerOwned = true;
      } else {
        _controller = widget.controller!;
        _isControllerOwned = false;
      }

      _setupListeners();

      if (_controller.text.isNotEmpty) {
        _runValidation();
      }
    }

    if (widget.focusNode != oldWidget.focusNode) {
      _focusNode.removeListener(_handleFocusChange);

      if (_isFocusNodeOwned && oldWidget.focusNode == null) {
        _focusNode.dispose();
      }

      if (widget.focusNode == null) {
        _focusNode = FocusNode();
        _isFocusNodeOwned = true;
      } else {
        _focusNode = widget.focusNode!;
        _isFocusNodeOwned = false;
      }

      _focusNode.addListener(_handleFocusChange);
    }

    if (widget.isPassword != oldWidget.isPassword) {
      _obscureText = widget.isPassword;
    }
  }

  void _handleFocusChange() {
    if (!mounted) return;

    final hasFocus = _focusNode.hasFocus;

    setState(() {
      if (!widget.enabled) {
        _borderState = BorderState.disabled;
      } else if (!hasFocus && _controller.text.isNotEmpty) {
        _runValidation(immediate: true);
      } else if (hasFocus) {
        if (_validationState == ValidationState.error) {
          _borderState = BorderState.error;
        } else {
          _borderState = BorderState.focused;
        }
        if (_controller.text.isNotEmpty &&
            _validationState == ValidationState.none) {
          _validationState = ValidationState.typing;
        }
      } else {
        if (_controller.text.isEmpty) {
          _borderState = BorderState.normal;
          _validationState = ValidationState.none;
        }
      }
    });
  }

  void _handleTextChanged() {
    if (!mounted) return;
    final text = _controller.text;
    _validationTimer?.cancel();
    widget.onChanged?.call(text);
    if (text.isEmpty) {
      if (mounted) {
        setState(() {
          _validationState = ValidationState.none;
          _borderState = _focusNode.hasFocus
              ? BorderState.focused
              : BorderState.normal;
          _validationError = null;
        });
      }
      return;
    }
    if (_validationState != ValidationState.typing) {
      if (mounted) {
        setState(() {
          _validationState = ValidationState.typing;
          if (_focusNode.hasFocus) {
            _borderState = BorderState.focused;
          }
        });
      }
    }

    if (widget.validationDelay.inMilliseconds > 0) {
      _validationTimer = Timer(widget.validationDelay, () {
        if (mounted && _focusNode.hasFocus) {
          _runValidation();
        }
      });
    }
  }

  Future<void> _runValidation({
    bool immediate = false,
    bool initial = false,
  }) async {
    if (!mounted) return;

    final text = _controller.text;
    if (text.isEmpty && !initial) {
      if (mounted) {
        setState(() {
          _validationState = ValidationState.none;
          _borderState = _focusNode.hasFocus
              ? BorderState.focused
              : BorderState.normal;
          _validationError = null;
          _isValidating = false;
        });
      }
      return;
    }
    if (widget.showLoadingOnValidation && !immediate && mounted) {
      setState(() => _isValidating = true);
    }

    final error = widget.validator?.call(text);

    if (widget.showLoadingOnValidation && !immediate) {
      await Future.delayed(const Duration(milliseconds: 150));
    }

    if (!mounted) return;

    setState(() {
      _isValidating = false;
      _validationError = error ?? (error != null ? widget.errorMessage : null);

      if (text.isEmpty) {
        _validationState = ValidationState.none;
        _borderState = _focusNode.hasFocus
            ? BorderState.focused
            : BorderState.normal;
      } else if (error != null) {
        _validationState = ValidationState.error;
        _borderState = BorderState.error;
      } else {
        _validationState = ValidationState.valid;
        _borderState = BorderState.success;
      }
    });
  }

  void _togglePasswordVisibility() {
    if (mounted) {
      setState(() {
        _obscureText = !_obscureText;
      });
    }
  }

  void _clearText() {
    _controller.clear();
    widget.onChanged?.call('');

    if (mounted) {
      setState(() {
        _validationState = ValidationState.none;
        _borderState = BorderState.focused;
        _validationError = null;
      });
    }
    _focusNode.requestFocus();
  }

  Color _getBorderColor(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode =
        LocalStorageHelper().getValue<bool>(HiveKeys.isDarkMode) ?? false;

    Color color;

    switch (_borderState) {
      case BorderState.normal:
        color = isDarkMode
            ? AppColors.surfaceDarkColor
            : AppColors.surfaceLightColor;
        break;
      case BorderState.disabled:
        color = theme.disabledColor.withValues(alpha: .4);
        break;
      case BorderState.focused:
        color = widget.focusColor ?? theme.primaryColor;
        break;
      case BorderState.error:
        color = AppColors.errorColor;
        break;
      case BorderState.success:
        color = AppColors.successColor;
        break;
    }

    return color;
  }

  Widget _buildSuffixIcons(BuildContext context) {
    final List<Widget> icons = [];
    if (_isValidating && widget.showLoadingOnValidation) {
      icons.add(
        SizedBox(
          width: AppSize.s20,
          height: AppSize.s20,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: AppColors.white,
          ),
        ),
      );
    } else if (widget.showValidationIcons &&
        !_focusNode.hasFocus &&
        !_isValidating) {
      if (_validationState == ValidationState.valid) {
        icons.add(
          widget.customSuccessIcon ??
              Icon(
                Icons.check_circle_outline_rounded,
                size: AppSize.s20,
                color: AppColors.successColor,
              ),
        );
      } else if (_validationState == ValidationState.error) {
        icons.add(
          widget.customErrorIcon ??
              Icon(
                Icons.error_outline_rounded,
                size: AppSize.s20,
                color: AppColors.errorColor,
              ),
        );
      }
    }
    if (widget.showClearButton &&
        _controller.text.isNotEmpty &&
        _focusNode.hasFocus &&
        !_isValidating &&
        widget.enabled) {
      icons.add(
        IconButton(
          icon: const Icon(Icons.clear_rounded),
          onPressed: _clearText,
          iconSize: AppSize.s20,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          splashRadius: 20,
        ),
      );
    }
    if (widget.isPassword && !_isValidating) {
      icons.add(
        IconButton(
          icon: Icon(
            _obscureText
                ? Icons.visibility_off_rounded
                : Icons.visibility_rounded,
          ),
          onPressed: _togglePasswordVisibility,
          iconSize: AppSize.s20,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          splashRadius: 20,
        ),
      );
    }
    if (icons.isEmpty && widget.suffixIcon != null) {
      return widget.suffixIcon!;
    }

    if (icons.isEmpty) {
      return const SizedBox.shrink();
    }
    if (icons.length == 1) {
      return Padding(
        padding: const EdgeInsets.only(right: 12),
        child: icons.first,
      );
    }

    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: icons
            .map(
              (icon) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: icon,
              ),
            )
            .toList(),
      ),
    );
  }

  String? _getErrorText() {
    if (_validationState == ValidationState.typing || _isValidating) {
      return null;
    }
    return _validationError;
  }

  @override
  void dispose() {
    _validationTimer?.cancel();
    _removeListeners();
    if (_isControllerOwned) {
      _controller.dispose();
    }
    if (_isFocusNodeOwned) {
      _focusNode.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.labelText != null ||
            (widget.maxLength != null && widget.showCounter))
          Padding(
            padding: const EdgeInsets.only(bottom: 8, left: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (widget.labelText != null)
                  Flexible(
                    child: Text(
                      widget.labelText!,
                      style: widget.labelStyle ?? theme.textTheme.titleMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                if (widget.maxLength != null && widget.showCounter)
                  Padding(
                    padding: EdgeInsets.only(
                      left: widget.labelText != null ? 8 : 0,
                    ),
                    child: Text(
                      '${_controller.text.length}/${widget.maxLength}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: _controller.text.length > widget.maxLength!
                            ? AppColors.errorColor
                            : theme.hintColor.withValues(alpha: 0.7),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
              ],
            ),
          ),

        TextFormField(
          onTap: widget.onTap,
          controller: _controller,
          focusNode: _focusNode,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          obscureText: _obscureText,
          maxLength: widget.maxLength,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          autofocus: widget.autoFocus,
          readOnly: widget.readOnly,
          enabled: widget.enabled,
          enableSuggestions: widget.enableSuggestions,
          autocorrect: widget.autocorrect,
          autovalidateMode:
              widget.autovalidateMode ?? AutovalidateMode.onUserInteraction,
          textDirection: _textDirection,
          validator: widget.validator,
          onFieldSubmitted: widget.onSubmitted,
          onEditingComplete: widget.onEditingComplete,
          cursorColor: widget.cursorColor ?? theme.primaryColor,
          cursorHeight: 20,
          cursorWidth: 2,
          cursorRadius: const Radius.circular(1),
          style: widget.style ?? theme.textTheme.titleMedium,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: widget.hintStyle,
            helperText: widget.helperText,
            errorStyle: widget.errorStyle,
            filled: widget.filled,
            fillColor: widget.fillColor,
            prefixIcon: widget.prefixIcon != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 16, right: 12),
                    child: widget.prefixIcon,
                  )
                : null,
            prefixIconConstraints: widget.prefixIcon != null
                ? const BoxConstraints(minWidth: 48, minHeight: 48)
                : null,
            suffixIcon: _buildSuffixIcons(context),
            suffixIconConstraints: const BoxConstraints(
              minWidth: 48,
              minHeight: 48,
            ),
            counterText: widget.showCounter ? null : '',
            contentPadding:
                widget.contentPadding ??
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            enabledBorder: null,
            focusedBorder: _buildBorder(context),
            errorBorder: _buildErrorBorder(context),
            focusedErrorBorder: _buildErrorBorder(context),
            disabledBorder: _buildDisabledBorder(context),
            errorText: _getErrorText(),
            errorMaxLines: 3,
          ),
        ),

        if (_validationState == ValidationState.valid &&
            widget.successMessage != null &&
            !_focusNode.hasFocus)
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 4),
            child: Text(
              widget.successMessage!,
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColors.successColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
      ],
    );
  }

  InputBorder _buildBorder(BuildContext context) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: _getBorderColor(context),
        width: widget.borderWidth,
      ),
      borderRadius: widget.borderRadius ?? BorderRadius.circular(AppBorder.b12),
      gapPadding: 0,
    );
  }

  InputBorder _buildErrorBorder(BuildContext context) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.errorColor,
        width: widget.borderWidth,
      ),
      borderRadius: widget.borderRadius ?? BorderRadius.circular(AppBorder.b12),
      gapPadding: 0,
    );
  }

  InputBorder _buildDisabledBorder(BuildContext context) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Theme.of(context).disabledColor, width: 2),
      borderRadius: widget.borderRadius ?? BorderRadius.circular(AppBorder.b12),
      gapPadding: 0,
    );
  }
}
