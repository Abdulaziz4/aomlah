import 'package:flutter/material.dart';

class NfadMocView extends StatelessWidget {
  const NfadMocView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          backgroundColor: Color.fromARGB(255, 27, 27, 27),
          leading: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Icon(
              Icons.clear,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.of(context).pop(false);
            },
          ),
        ),
      ),
      backgroundColor: Color(0xfff2f2f2),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            height: 100,
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(width: 20),
                Image.asset(
                  'assets/icons/menu.png',
                  height: 40,
                  width: 40,
                ),
                Spacer(flex: 2),
                Image.asset(
                  'assets/icons/nfa4.png',
                  width: 100,
                  height: 100,
                ),
                Container(width: 20),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 20, 10, 80),
            padding: EdgeInsets.all(20),
            color: Colors.white,
            height: 300,
            width: double.infinity,
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "اسم المستخدم",
                    fillColor: Colors.grey[200],
                  ),
                  style: TextStyle(color: Colors.black),
                ),
                Container(height: 20),
                TextField(
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "كلمة المرور",
                    fillColor: Colors.grey[200],
                  ),
                  style: TextStyle(color: Colors.black),
                ),
                Container(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff11998E),
                    minimumSize: Size(20, 40),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text(
                        "تسجيل دخول",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Icon(
                        Icons.login,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
