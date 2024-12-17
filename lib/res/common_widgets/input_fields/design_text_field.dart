import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:u_matter/res/common_widgets/custom_image/custom_image.dart';
import 'package:u_matter/utils/constants/app_constants.dart';
import 'package:u_matter/utils/extensions/styles_extension.dart';
import 'package:u_matter/utils/validations/validation_utils.dart';

import '../../../utils/constants/color_constants.dart';
import '../../../utils/utils.dart';

class DesignTextField extends FormField<String> {
  static const uiType = "text_field_c00001";
  final String? customKey;
  final double? height;
  final double? width;
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final String? inputType;
  final Color? borderColor;
  final Color? errorBorderColor;
  final Color? labelColor;
  final Color? hintColor;
  final Color? textColor;
  final Color? cursorColor;
  final String? suffix;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final int maxLines;
  final bool readOnly;
  final List<String>? inputFormatters;
  final TextCapitalization textCapitalization;
  final InputBorder? border;
  final EdgeInsetsGeometry? contentPadding;
  final String? prefixIcon;
  final TextStyle? titleTextStyle;
  final Color? backgroundColor;
  final bool isMandatory;
  final bool hasError;
  final String? errorText;
  final List<TextInputFormatter>? formatters;
  final int? maxLength;
  final AutovalidateMode? autoValidateMode;
  final FocusNode? focusNode;
  final List<String>? autofillHints;
  final bool keepPrefixColor;

  DesignTextField({
    super.key,
    String? title,
    String? subTitle,
    String? link,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    void Function(String value)? onChange,
    String initialValue = "",
    bool autoValidate = false,
    VoidCallback? onTap,
    this.customKey,
    this.controller,
    this.label,
    this.hint,
    this.borderColor = blackColor,
    this.errorBorderColor,
    this.height,
    this.width,
    this.labelColor,
    this.hintColor,
    this.textColor,
    this.cursorColor,
    this.suffix,
    this.inputType,
    this.onChanged,
    this.onSubmitted,
    this.maxLines = 1,
    this.readOnly = false,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.formatters,
    this.border,
    this.contentPadding,
    this.prefixIcon,
    this.titleTextStyle,
    this.backgroundColor,
    this.isMandatory = false,
    this.hasError = false,
    this.errorText,
    this.maxLength,
    this.autoValidateMode,
    this.focusNode,
    this.autofillHints,
    this.keepPrefixColor = false,
  }) : super(
          autovalidateMode:
              autoValidateMode ?? AutovalidateMode.onUserInteraction,
          onSaved: onSaved,
          validator: validator ??
              (value) {
                if (isMandatory) {
                  if (value == null || value.isEmpty) {
                    return 'Field is required';
                  }
                  if (inputType == AppConstants.inputTypeUserName) {
                    // Specific validation for crewUserName
                    if (value.length < 3) {
                      return 'Minimum 3 characters required';
                    }
                  } else if (inputType == AppConstants.userZipCode) {
                    // Specific validation for crewUserName
                    if (value.length < 5) {
                      return 'Minimum 5 characters required';
                    } else if (value.length > 5) {
                      return 'Maximum 5 characters allowed';
                    }
                  } else if (value.isNotEmpty &&
                      (inputType == AppConstants.inputTypeEmail &&
                          !ValidationUtils.isEmailValid(value))) {
                    if (customKey == "email") {
                      return null;
                    }

                    return 'Invalid email address';
                  }
                }
                return null;
              },
          initialValue: initialValue,
          builder: (FormFieldState<String> state) {
            return CustomTextFormField(
              initialValue: state.value,
              maxLength: maxLength,
              onChanged: (val) {
                state.didChange(val);
                onChanged?.call(val);
              },
              onSubmitted: onSubmitted,
              hasError: state.hasError,
              errorText: state.errorText,
              controller: controller,
              label: label,
              height: height,
              width: width,
              labelColor: labelColor,
              errorBorderColor: errorBorderColor,
              hint: hint,
              inputType: inputType,
              hintColor: hintColor,
              prefixIcon: prefixIcon,
              suffix: suffix,
              readOnly: readOnly,
              maxLines: maxLines,
              inputFormatters: inputFormatters,
              textCapitalization: textCapitalization,
              border: border,
              borderColor: borderColor,
              contentPadding: contentPadding,
              titleTextStyle: titleTextStyle,
              backgroundColor: backgroundColor,
              isMandatory: isMandatory,
              keepPrefixColor: keepPrefixColor,
              textColor: textColor,
              cursorColor: cursorColor,
              customKey: customKey,
              focusNode: focusNode,
              autofillHints: autofillHints,
            );
          },
        );
}

// DesignTextField
class CustomTextFormField extends StatefulWidget {
  static const uiType = "text_field_c00001";

  CustomTextFormField({
    Key? key,
    this.customKey,
    this.controller,
    this.height,
    this.width,
    this.initialValue,
    this.validator,
    this.onSaved,
    this.label,
    this.hint,
    this.borderColor = defaultBorderColor,
    this.errorBorderColor,
    this.labelColor,
    this.hintColor,
    this.textColor,
    this.cursorColor,
    this.suffix,
    this.inputType,
    this.onChanged,
    this.onSubmitted,
    this.maxLines = 1,
    this.readOnly = false,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.border,
    this.contentPadding,
    this.prefixIcon,
    this.titleTextStyle,
    this.backgroundColor,
    this.isMandatory = false,
    this.hasError = false,
    this.errorText,
    this.maxLength,
    this.focusNode,
    this.autofillHints,
    this.keepPrefixColor = false,
  }) : super(key: key);

  final String? customKey;
  TextEditingController? controller;
  final double? height;
  final double? width;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String)? onSubmitted;
  final String? initialValue;
  final String? label;
  final String? hint;
  final String? inputType;
  final Color? borderColor;
  final Color? errorBorderColor;
  final Color? labelColor;
  final Color? hintColor;
  final Color? textColor;
  final Color? cursorColor;
  final String? suffix;
  final Function(String)? onChanged;
  final int maxLines;
  final bool readOnly;
  final List<String>? inputFormatters;
  final TextCapitalization textCapitalization;
  final InputBorder? border;
  final EdgeInsetsGeometry? contentPadding;
  final String? prefixIcon;
  final TextStyle? titleTextStyle;
  final Color? backgroundColor;
  final bool isMandatory;
  final bool hasError;
  final String? errorText;
  final int? maxLength;
  final FocusNode? focusNode;
  final List<String>? autofillHints;
  final bool keepPrefixColor;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      widget.controller ??= TextEditingController(text: widget.initialValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Align(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              widget.label ?? "",
              style: widget.titleTextStyle ?? context.label16400,
            ),
          ),
          SizedBox(height: 8.h),
        ],
        Container(
          height: widget.height ?? 60.h,
          width: widget.width ?? double.infinity,
          decoration: ShapeDecoration(
            color: widget.backgroundColor ?? whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
              side: BorderSide(
                width: 1,
                color: widget.hasError
                    ? appSecondaryColor
                    : widget.borderColor ?? skyBlueColor,
              ),
            ),
          ),
          child: TextFormField(
            autofillHints: widget.autofillHints,
            key: ValueKey(widget.customKey),
            controller: widget.controller,
            // initialValue: widget.initialValue ?? "", // this value causes null error if uncommented
            autocorrect: false,
            maxLength: widget.maxLength,
            textInputAction: TextInputAction.done,
            keyboardType: Utils.getInputType(widget.inputType),
            onFieldSubmitted: widget.onSubmitted,
            maxLines: widget.maxLines,
            readOnly: widget.readOnly,
            textCapitalization: widget.inputType == "email"
                ? TextCapitalization.none
                : widget.textCapitalization,
            cursorColor: widget.cursorColor ?? blackColor,
            style: context.label12700Italic.copyWith(
              color: widget.textColor ?? blackColor,
            ),
            onChanged: (val) {
              // debugPrint(val);
              widget.onChanged?.call(val);
            },
            decoration: InputDecoration(
              counterText: "",
              isDense: true,
              alignLabelWithHint: true,
              hintText: widget.hint,
              filled: true,
              fillColor: Colors.transparent,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              prefixIcon: widget.prefixIcon != null
                  ? Padding(
                      padding:
                          EdgeInsetsDirectional.only(start: 14.w, end: 8.w),
                      child: CustomImage(
                        height: 24.h,
                        width: 24.h,
                        imagePath: widget.prefixIcon!,
                        fit: BoxFit.contain,
                        color: widget.keepPrefixColor? null: lightGreyColor,
                      ),
                    )
                  : null,
              prefixIconConstraints: BoxConstraints(maxWidth: 40.w),
              contentPadding: widget.contentPadding ??
                  EdgeInsets.symmetric(
                    vertical: 16.h,
                    horizontal: 14.w,
                  ),
              hintStyle: context.label14400.copyWith(
                color: widget.hintColor ?? designPrimary.withOpacity(0.6),
              ),
              errorStyle: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: appSecondaryColor,
              ),
              floatingLabelStyle: TextStyle(
                // fontFamily: context.getPrimaryFont(),
                color: widget.labelColor ?? designPrimary.withOpacity(0.6),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              border: InputBorder.none,
              focusedBorder: widget.border ?? InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              suffixIconConstraints: const BoxConstraints(),
              suffixIcon: _getSuffixView(context),
            ),
          ),
        ),
        if (widget.hasError && (widget.errorText?.isNotEmpty ?? false)) ...[
          Padding(
            padding: EdgeInsetsDirectional.only(
              top: 8.h,
              end: 14.w,
              start: 14.w,
            ),
            child: Text(
              widget.errorText ?? "",
              style: context.label13400.copyWith(
                color: appSecondaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget? _getSuffixView(BuildContext context) {
    if (widget.suffix == null) return null;
    if (widget.suffix != null && widget.suffix!.isURL ||
        widget.suffix!.startsWith('http') ||
        widget.suffix!.startsWith('https') ||
        widget.suffix!.startsWith('www.') ||
        widget.suffix!.endsWith("svg")) {
      return Padding(
        padding: EdgeInsetsDirectional.only(end: 17.5.w),
        child: CustomImage(
          imagePath: widget.suffix!,
          height: 18.h,
          width: 18.h,
          fit: BoxFit.contain,
          color: blackColor,
        ),
      );
    }
    return Text(
      widget.suffix!,
      style: TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        fontSize: 14.0,
        color: designPrimary.withOpacity(0.4),
      ),
    );
  }
}

class UppercaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
