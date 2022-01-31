import 'package:flutter/material.dart';
import 'text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const RoundedPasswordField({
    Key? key,
    required this.onChanged,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return TextFieldContainer(
      child: TextFormField(
        validator: (value){
          if(value!.isNotEmpty){
            return null;
          // }else if(!regex.hasMatch(value)) {
          //   return 'Enter valid password';
          // }else{
          //     return 'This Field Is Required!';
            }
          },

        textAlign: TextAlign.end,
        obscureText: true,
        onChanged: onChanged,
        cursorColor: Color(0xFF6F35A5),
        decoration: InputDecoration(
          hintText: "أدخل كلمة السر",
          border: InputBorder.none,
          hintStyle: TextStyle(color: Color(0xFF3D4955)),
        ),
      ),
    );
  }
}
