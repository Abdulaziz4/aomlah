import 'package:aomlah/core/app/utils/constants.dart';
import 'package:flutter/material.dart';

class CusTile extends StatelessWidget {
   Widget leading;
   CusTile(this.leading);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.black3dp,
      margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Row(
        children: [
          Expanded(child: leading)
        ],
      ),
    );
  }
}




// Container cusTile() => Container(
//   color: Constants.black3dp,
//   
//   child: Row(
//     children: const[
//       Expanded(child:
//       Text('BTC',textAlign: TextAlign.center,),
//         flex: 1,
//       ),
//       Expanded(
//         flex: 4,
//         child: TextField(
//           decoration: InputDecoration(
//               hintText: 'ادخل الحد الادنى', border: InputBorder.none),
//           keyboardType: TextInputType.number,
//         ),),
//     ],
//   ),
// );
