import 'package:flutter/material.dart';

class CustomeFormField extends StatelessWidget {
  final String? labelText;
  final String? error;
  final int? lines;
  final Function? validate;
  final bool? readonly;
  final bool? secure;
  final TextAlign? textAlign;
  final TextInputType? keyboardType;
  final Color? color;
  final TextEditingController? controller;
  final Color? borderColor;

  const CustomeFormField({
    Key? key,
    this.labelText,
    this.error,
    this.readonly,
    this.lines,
    this.secure = false,
    this.validate,
    this.color,
    this.borderColor,
    this.textAlign = TextAlign.start,
    this.keyboardType = TextInputType.text,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => validate!(value),
      obscureText: secure!,
      readOnly: readonly!,
      maxLines: lines!,
      textAlign: textAlign!,
      keyboardType: keyboardType,
      style: TextStyle(color: color!),
      textDirection: TextDirection.ltr,
      controller: controller,
      onFieldSubmitted: (value) => debugPrint(value),
      decoration: InputDecoration(
        hintText: labelText!,
        hintStyle: TextStyle(
          color: color!,
        ),
        errorStyle: const TextStyle(color: Colors.white),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 1, vertical: 10.0),
        labelStyle: TextStyle(
          color: color!,
        ),
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
