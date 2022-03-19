// ignore_for_file: deprecated_member_use

import 'package:counter_button/counter_button.dart';
import 'package:flutter/material.dart';
import 'package:live_clean/utils/CustomTextStyle.dart';
import 'package:live_clean/utils/CustomUtils.dart';
import 'CheckOutPage.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int _counterValue = 0;
  // ignore: unused_element
  // get _counterValue => 0;

  // set _counterValue(int _counterValue) {}
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade100,
      body: Builder(
        builder: (context) {
          return ListView(
            children: <Widget>[
              createHeader(),
              createCartList(),
              footer(context)
            ],
          );
        },
      ),
    );
  }

  footer(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 30),
                child: Text(
                  "Total",
                  style: CustomTextStyle.textFormFieldMedium.copyWith(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 30),
                child: Text(
                  "\Rwf 299.00",
                  style: CustomTextStyle.textFormFieldBlack.copyWith(
                      color: Color.fromARGB(255, 0, 0, 0), fontSize: 15),
                ),
              ),
            ],
          ),
          Utils.getSizedBox(height: 8),
          RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => CheckOutPage()));
            },
            color: Color.fromARGB(255, 0, 255, 255),
            padding: EdgeInsets.only(top: 12, left: 60, right: 60, bottom: 12),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(24))),
            child: Text(
              "Checkout",
              style: CustomTextStyle.textFormFieldSemiBold
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          Utils.getSizedBox(height: 8),
        ],
      ),
      margin: EdgeInsets.only(top: 16),
    );
  }

  createHeader() {
    return Container(
      padding: const EdgeInsets.only(top: 20.0, bottom: 20),
      child: Row(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Icon(Icons.arrow_back),
          ),
          Container(
              margin: const EdgeInsets.only(left: 10.0),
              child: Text(
                "Booking Cart",
                style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ))
        ],
      ),
    );
  }

  createCartList() {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, position) {
        return createCartListItem();
      },
      itemCount: 8,
    );
  }

  createCartListItem() {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 16, right: 16, top: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Row(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                      color: Colors.blue.shade200,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("images/jacket.jpeg")))),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(right: 8, top: 4),
                        child: Text(
                          "Jacket",
                          maxLines: 2,
                          softWrap: true,
                          style: CustomTextStyle.textFormFieldSemiBold
                              .copyWith(fontSize: 14),
                        ),
                      ),
                      Utils.getSizedBox(height: 6),
                      Text(
                        "Orange",
                        style: CustomTextStyle.textFormFieldRegular
                            .copyWith(color: Colors.black, fontSize: 14),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "\Rwf 299.00",
                              style: CustomTextStyle.textFormFieldBlack
                                  .copyWith(
                                      color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CounterButton(
                                  loading: false,
                                  onChange: (int val) {
                                    setState(() {
                                      _counterValue = val;
                                    });
                                  },
                                  count: _counterValue,
                                  countColor: Color.fromARGB(255, 0, 0, 0),
                                  buttonColor: Color.fromARGB(255, 0, 0, 0),
                                  progressColor:
                                      Color.fromARGB(255, 0, 255, 255),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                flex: 100,
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            width: 24,
            height: 24,
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: 10, top: 8),
            child: Icon(
              Icons.close,
              color: Colors.white,
              size: 20,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color.fromARGB(255, 0, 225, 255)),
          ),
        )
      ],
    );
  }
}
