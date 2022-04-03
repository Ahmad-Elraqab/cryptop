import 'package:flutter/material.dart';

class CustomerTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? error;
  final dynamic onChanged;
  final int? lines;
  final bool? validate;
  final bool? readonly;
  final bool? secure;
  final Color? color;
  final Color? borderColor;

  const CustomerTextField(
      {Key? key,
      this.controller,
      this.labelText,
      this.error,
      this.onChanged,
      this.readonly,
      this.lines,
      this.secure = false,
      this.validate,
      this.color,
      this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: secure!,
      readOnly: readonly!,
      onChanged: (value) => onChanged!(value),
      maxLines: lines!,
      controller: controller,
      style: TextStyle(color: color!),
      decoration: InputDecoration(
        errorText: validate! ? error! : null,
        errorStyle: const TextStyle(color: Colors.white),
        contentPadding: const EdgeInsets.only(left: 1, right: 1, bottom: 20.0),
        labelText: labelText!,
        labelStyle: TextStyle(color: color!),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: borderColor!),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: borderColor!),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: borderColor!),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: borderColor!),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
    );
  }
}
