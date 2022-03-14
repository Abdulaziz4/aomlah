import 'package:aomlah/core/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ControlPanel(),
    );
  }
}

class ControlPanel extends StatefulWidget {
  const ControlPanel({Key? key}) : super(key: key);

  @override
  _ControlPanelState createState() => _ControlPanelState();
}

class _ControlPanelState extends State<ControlPanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("لوحة التحكم"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.02),
            child: CarouselSlider(
              options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * .2),

              /// change in item list and map to update values in slider .
              items: [1, 2, 3].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          color: Constants.black4dp,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.04),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("32,32,323",
                                        style: Constants.largeText.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                    Text("اجمالي قيمة التداولات",
                                        style: Constants.smallText.copyWith(
                                          color: Colors.white,
                                        ))
                                  ],
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.width * 0.2,
                                width: MediaQuery.of(context).size.width * 0.2,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.purple[200],
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.ac_unit,
                                    color: Colors.purple,
                                    size: MediaQuery.of(context).size.width *
                                        0.12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ));
                  },
                );
              }).toList(),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "النزاعات",
                    style: Constants.largeText.copyWith(
                      color: Constants.darkBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
            child: Container(
              /// You have to change the column to listView.builder to get the data and put it in card from the database.
              /// Wrong: sorry my language is very bad .
              child: Column(
                children: [
                  itemCard(),
                  itemCard(),
                  itemCard(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

///  هذه هي كرتة النزاعات، قم بتعديلها كيفما تشاء .

class itemCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
            color: Constants.black2dp, borderRadius: BorderRadius.circular(10)),
        child: Align(
          alignment: Alignment.centerRight,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "رقم التداول",
                          style: Constants.smallText.copyWith(
                            color: Constants.primaryColor,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "1212   ",
                          style: Constants.smallText.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      "في الانتظار",
                      style: Constants.smallText
                          .copyWith(color: Constants.darkBlue, fontSize: 14),
                    ),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      "السبب",
                      style: Constants.smallText.copyWith(
                        color: Constants.primaryColor,
                      ),
                    ),
                    SizedBox(
                      width: 52,
                    ),
                    Text(
                      "لا أريد إكمال العملية     ",
                      style: Constants.smallText.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Spacer(),
                    Text(
                      "2022-04-01   4:30pm",
                      style: Constants.smallText
                          .copyWith(color: Color(0xFFC6C6C6), fontSize: 14),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
