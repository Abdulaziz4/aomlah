import 'package:aomlah/core/app/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget {
  final void Function(String? value)? onSaved;
  final String? Function(String? value)? validator;
  final void Function(String value)? onFieldSubmited;
  // final String label;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final String hintText;
  final bool obscure;
  final Widget? suffix;
  final TextInputType? keyboardType;
  const CustomInputField({
    Key? key,
    this.onSaved,
    this.validator,
    this.onFieldSubmited,
    // required this.label,
    this.controller,
    this.focusNode,
    this.hintText = "",
    this.obscure = false,
    this.suffix,
    this.keyboardType,
  }) : super(key: key);

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
      padding: EdgeInsets.symmetric(vertical: 0),
      child: TextFormField(
        textDirection: TextDirection.rtl,
        keyboardType: widget.keyboardType,
        onSaved: widget.onSaved,
        validator: widget.validator,
        obscureText: widget.obscure,
        controller: widget.controller,
        focusNode: widget.focusNode,
        textAlignVertical: TextAlignVertical.center,
        textInputAction: TextInputAction.next,
        style: Constants.mediumText,
        decoration: InputDecoration(
          prefixIcon: widget.suffix,
          hintText: widget.hintText,
          hintTextDirection: TextDirection.rtl,
          hintStyle: Constants.smallText,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          filled: true,
          fillColor: Constants.black3dp,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.white),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 0),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFE2E2E2),
              width: 0,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Constants.redColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onFieldSubmitted: widget.onFieldSubmited,
      ),
    );
  }
}
