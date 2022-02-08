import 'package:aomlah/core/app/utils/constants.dart';
import 'package:flutter/material.dart';

class RoundedInputField extends StatefulWidget {
  final void Function(String? value)? onSave;
  final String? Function(String? value)? validator;
  final void Function(String value)? onFieldSubmited;
  final String label;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final String hintText;
  final bool obscure;
  final Color? fillColor;
  final Widget? suffix;
  const RoundedInputField({
    Key? key,
    this.onSave,
    this.validator,
    this.onFieldSubmited,
    required this.label,
    this.controller,
    this.focusNode,
    this.hintText = "",
    this.obscure = false,
    this.fillColor,
    this.suffix,
  }) : super(key: key);

  @override
  State<RoundedInputField> createState() => _RoundedInputFieldState();
}

class _RoundedInputFieldState extends State<RoundedInputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildLabel(),
          TextFormField(
            textDirection: TextDirection.rtl,
            onSaved: widget.onSave,
            validator: widget.validator,
            obscureText: widget.obscure,
            controller: widget.controller,
            focusNode: widget.focusNode,
            textAlignVertical: TextAlignVertical.center,
            textInputAction: TextInputAction.next,
            style: Constants.mediumText,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintTextDirection: TextDirection.rtl,
              hintStyle: Constants.smallText,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              filled: true,
              fillColor: widget.fillColor ?? Constants.black3dp,
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
              suffixIcon: widget.suffix,
            ),
            onFieldSubmitted: widget.onFieldSubmited,
          ),
        ],
      ),
    );
  }

  Widget buildLabel() {
    return Container(
      padding: EdgeInsets.only(right: 10.0),
      child: Text(
        widget.label,
        style: Constants.smallText.copyWith(
          color: Color(0xFFE2E2E2),
        ),
      ),
    );
  }
}
