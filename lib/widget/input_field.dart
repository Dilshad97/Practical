import 'package:flutter/material.dart';

class AppInputField extends StatelessWidget {
  const AppInputField(
      {key,
      this.controller,
      this.icon,
      this.textStyle,
      this.isObscureText,
      this.inputType,
      this.isEnable,
      this.hintName,
      this.onChanged,
      this.labelText,
      this.textAlign,
      this.maxLines,
      this.borderRadius,
      this.contentPadding,
      this.color,
      this.hintStyle,
      this.initialValue})
      : super(key: key);
  final TextEditingController? controller;
  final String? hintName;
  final String? labelText;
  final IconData? icon;
  final bool? isObscureText;
  final TextInputType? inputType;
  final bool? isEnable;
  final Function(String)? onChanged;
  final TextAlign? textAlign;
  final String? initialValue;
  final Color? color;
  final TextStyle? textStyle;
  final int? maxLines;
  final TextStyle? hintStyle;
  final double? borderRadius;
  final double? contentPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        initialValue: initialValue,
        textAlign: textAlign ?? TextAlign.center,
        controller: controller,
        onChanged: onChanged,
        validator: (value) {
          if (value?.isEmpty ?? false) {
            return "Enter Valid ${hintName ?? labelText}";
          }
           else {
            return null;
          }
        },
        obscureText: isObscureText ?? false,
        enabled: isEnable,
        maxLines: maxLines,
        keyboardType: inputType,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
                left: contentPadding ?? 5,
                right: contentPadding ?? 5,
                bottom: contentPadding ?? 0,
                top: contentPadding ?? 0),
            enabledBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(borderRadius ?? 10.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(borderRadius ?? 10.0)),
            ),
            hintText: hintName,
            labelText: labelText,
            suffixIcon: Icon(
              icon,
            ),
            filled: true),
      ),
    );
  }
}