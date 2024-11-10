import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theming/colors_manager.dart';

class TextFormFieldCustom extends StatefulWidget {
  final String? hintText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final Function()? onTap;
  final Function(String?)? onChanged;
  final List<TextInputFormatter>? inputFormatter;

  const TextFormFieldCustom({
    super.key,
    this.hintText,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.controller,
    this.onChanged,
    this.inputFormatter,
    this.onTap,
  });

  @override
  State<TextFormFieldCustom> createState() => _TextFormFieldCustomState();
}

class _TextFormFieldCustomState extends State<TextFormFieldCustom> {
  double radius = 30;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      textAlignVertical: TextAlignVertical.center,
      textAlign: TextAlign.center,
      autocorrect: false,
      onTap: widget.onTap,
      inputFormatters: widget.inputFormatter,
      autofocus: false,
      controller: widget.controller,
      textInputAction: widget.textInputAction ?? TextInputAction.done,
      onChanged: (value) {
        widget.onChanged != null ? widget.onChanged!(value) : null;
      },
      style:  GoogleFonts.balooBhai2(
        color: ColorsManager.greenColor,
        fontSize: 24,
        fontWeight: FontWeight.w800,
      ),
      cursorColor: ColorsManager.blackColor,
      cursorHeight: 17,
      cursorWidth: 1.5,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorsManager.whiteColor,
        hintText: widget.hintText,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        hintStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: ColorsManager.blackColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: const BorderSide(
            color: ColorsManager.transparentColor,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 20,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: const BorderSide(
            color: ColorsManager.mainColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorsManager.redColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(radius),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorsManager.redColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      obscuringCharacter: '*',
      validator: widget.validator,
      keyboardType: widget.keyboardType,
    );
  }
}
