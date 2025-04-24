import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kubsu_design_system/kubsu_design_system.dart';
import 'package:reactive_forms/reactive_forms.dart';

class KubsuTextInput extends StatelessWidget {
  const KubsuTextInput({
    this.onTapAlwaysCalled = false,
    this.hintMaxLines,
    this.hintText,
    this.hintTextDirection,
    this.hintTextStyle,
    this.controller,
    this.formControl,
    this.inputFormatters,
    this.style,
    this.onTap,
    this.focusNode,
    this.maxLengthEnforcement,
    this.magnifierConfiguration,
    this.maxLength,
    this.onChanged,
    this.maxLines,
    this.obscureText = false,
    this.readOnly = false,
    this.obscuringCharacter = '*',
    this.onAppPrivateCommand,
    this.onEditingComplete,
    this.onSubmitted,
    this.onTapOutside,
    this.showErrors,
    this.decoration,
    this.validationMessages,
    this.semanticCounterText,
    this.suffix,
    this.suffixIcon,
    this.suffixIconColor,
    this.suffixIconConstraints,
    this.suffixStyle,
    this.suffixText,
    this.prefix,
    this.prefixIcon,
    this.prefixIconColor,
    this.prefixIconConstraints,
    this.prefixStyle,
    this.prefixText,
    this.formControlName,
    this.hasError = false,
    super.key,
  });

  final String? hintText;
  final TextStyle? hintTextStyle;
  final TextStyle? style;
  final TextDirection? hintTextDirection;
  final int? hintMaxLines;
  final TextEditingController? controller;
  final FormControl? formControl;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final int? maxLength;
  final TextMagnifierConfiguration? magnifierConfiguration;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final bool obscureText;
  final String obscuringCharacter;
  final FocusNode? focusNode;
  final Function(FormControl)? onTap;
  final Function(FormControl)? onEditingComplete;
  final Function(FormControl)? onChanged;
  final Function(String, Map<String, dynamic>)? onAppPrivateCommand;
  final Function(FormControl)? onSubmitted;
  final Function(PointerDownEvent)? onTapOutside;
  final bool Function(FormControl)? showErrors;
  final bool onTapAlwaysCalled;
  final Map<String, String Function(Object)>? validationMessages;
  final InputDecoration? decoration;
  final String? semanticCounterText;
  final String? suffixText;
  final TextStyle? suffixStyle;
  final BoxConstraints? suffixIconConstraints;
  final Widget? suffix;
  final Widget? suffixIcon;
  final Color? suffixIconColor;
  final bool readOnly;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Color? prefixIconColor;
  final BoxConstraints? prefixIconConstraints;
  final TextStyle? prefixStyle;
  final String? prefixText;
  final String? formControlName;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    final errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(width: 1, color: context.appColors.borderInputPrimaryError),
    );

    final decoration =
        this.decoration ??
        InputDecoration(
          hintText: hintText,
          hintStyle:
              hintTextStyle ??
              context.appTexts.body.copyWith(
                color:
                    hasError
                        ? context.appColors.textInputPrimaryPlaceholderError
                        : context.appColors.textInputPrimaryPlaceholderFocused,
              ),
          hintTextDirection: hintTextDirection,
          hintMaxLines: hintMaxLines,
          fillColor:
              hasError ? context.appColors.surfaceInputPrimaryError : context.appColors.surfaceInputPrimaryFocused,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          suffix: suffix,
          suffixIcon: suffixIcon,
          suffixIconColor: hasError ? context.appColors.iconInputPrimaryError : suffixIconColor,
          suffixIconConstraints: suffixIconConstraints,
          suffixStyle: suffixStyle,
          suffixText: suffixText,
          semanticCounterText: semanticCounterText,
          prefix: prefix,
          prefixIcon: prefixIcon,
          prefixIconColor: hasError ? context.appColors.iconInputPrimaryError : prefixIconColor,
          prefixIconConstraints: prefixIconConstraints,
          prefixStyle: prefixStyle,
          prefixText: prefixText,

          border:
              hasError
                  ? errorBorder
                  : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(width: 1, color: context.appColors.borderInputPrimary),
                  ),
          enabledBorder:
              hasError
                  ? errorBorder
                  : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(width: 1, color: context.appColors.borderInputPrimary),
                  ),
          focusedBorder:
              hasError
                  ? errorBorder
                  : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(width: 1, color: context.appColors.borderInputPrimaryFocused),
                  ),
          errorBorder: errorBorder,
          focusedErrorBorder: errorBorder,
        );

    return ReactiveTextField(
      formControlName: formControlName,
      readOnly: readOnly,
      validationMessages: validationMessages,
      showErrors: showErrors ?? (_) => false,
      focusNode: focusNode,
      onTap: onTap,
      onChanged: onChanged,
      onAppPrivateCommand: onAppPrivateCommand,
      onEditingComplete: onEditingComplete,
      onSubmitted: onSubmitted,
      onTapOutside: onTapOutside,

      maxLines: maxLines,
      magnifierConfiguration: magnifierConfiguration,
      maxLength: maxLength,
      maxLengthEnforcement: maxLengthEnforcement,
      obscureText: obscureText,
      obscuringCharacter: obscuringCharacter,

      controller: controller,
      formControl: formControl ?? FormControl(),
      cursorColor:
          hasError ? context.appColors.textInputPrimaryPlaceholderError : context.appColors.textSecondaryAccent,
      decoration: decoration,
      style: style ?? context.appTexts.body,
      inputFormatters: inputFormatters,
    );
  }
}
