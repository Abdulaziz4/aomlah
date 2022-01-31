import 'package:flutter/material.dart';
import 'text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;


   const RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator: (value){
          if(value!.isNotEmpty){
            return null;
          }else{
            return 'This Field Is Required Correctly!';
          }
        },



        onChanged: onChanged,
        cursorColor: Colors.white,
        textAlign: TextAlign.end,


        //cursorHeight: 71,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          hintStyle: TextStyle(color: Color(0xFF3D4955)),
        ),
      ),
    );
  }
}
