import 'package:flutter/material.dart';
import 'package:crop_doctor/constants/app_constants.dart';

class CustomTextInput extends StatefulWidget {
  final AutovalidateMode? autovalidateMode;
  final TextEditingController? controller;
  final String? labelText;
  final String? helperText;
  final bool? autofoucs;
  final bool? enabled;
  final bool? obscureText;
  final Widget? prefix;
  final Widget? prefixIcon;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;

  const CustomTextInput({
    super.key,
    this.controller,
    this.labelText,
    this.enabled,
    this.autofoucs,
    this.validator,
    this.autovalidateMode,
    this.helperText,
    this.obscureText,
    this.prefix,
    this.prefixIcon,
    this.onFieldSubmitted,
    this.onSaved,
  });

  @override
  State<CustomTextInput> createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: widget.autofoucs ?? false,
      autovalidateMode: widget.autovalidateMode,
      enabled: widget.enabled,
      controller: widget.controller,
      obscureText: widget.obscureText ?? false,
      decoration: InputDecoration(
        prefix: widget.prefix,
        prefixIcon: widget.prefixIcon,
        labelText: widget.labelText,
        helperText: widget.helperText,
        border: OutlineInputBorder(borderRadius: AppConstants.appBorderRadius),
      ),
      validator: widget.validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return widget.labelText != null ? 'Please enter your ${widget.labelText?.toLowerCase()}' : 'Required';
            }
            return null;
          },
      onFieldSubmitted: widget.onFieldSubmitted,
      onSaved: widget.onSaved,
    );
  }
}
