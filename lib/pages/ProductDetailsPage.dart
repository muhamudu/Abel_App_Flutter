// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:live_clean/utils/CustomTextStyle.dart';
import 'package:live_clean/utils/CustomUtils.dart';
import 'CartPage.dart';

// ignore: must_be_immutable
class ProductDetailsPage extends StatefulWidget {
  String heroTag;

  ProductDetailsPage(this.heroTag);
  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState(heroTag);
}

class _ProductDetailsPageState extends State<ProductDetailsPage>
    with TickerProviderStateMixin<ProductDetailsPage> {
  List<Color> listColor = new List();
  List<String> listSize = new List();
  int selectedColor = -1;

  var selectedSize = -1;

  var heroTag;

  String _chosenValue;

  _ProductDetailsPageState(this.heroTag);
  @override
  Widget build(BuildContext context) {
    var halfOfScreen = MediaQuery.of(context).size.height / 1.5;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Builder(builder: (context) {
        return Container(
          height: double.infinity,
          child: Stack(
            alignment: Alignment.topRight,
            children: <Widget>[
              Hero(
                  tag: heroTag,
                  child: Image(
                    image: AssetImage("images/CLOTHS.jpg"),
                    height: halfOfScreen,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )),
              Container(
                margin: EdgeInsets.symmetric(vertical: 36),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      height: 25,
                      width: 32,
                      child: IconButton(
                        icon: Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                        ),
                        alignment: Alignment.center,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        iconSize: 14,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 8),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            height: 4,
                            width: 4,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.red),
                          ),
                          Container(
                            height: 25,
                            width: 32,
                            child: IconButton(
                              icon: Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                              ),
                              alignment: Alignment.center,
                              onPressed: () {
                                Navigator.of(context).push(
                                    new MaterialPageRoute(
                                        builder: (context) => CartPage()));
                              },
                              iconSize: 14,
                            ),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade400),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: productDetailsSection(),
              )
            ],
          ),
        );
      }),
    );
  }

  productDetailsSection() {
    // ignore: unused_local_variable
    var dropdownValue;
    var _selectedValue;
    return Container(
      padding: EdgeInsets.all(8),
      height: 370,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 8),
                child: Text(
                  "Laundry",
                  style: CustomTextStyle.textFormFieldSemiBold
                      .copyWith(color: Colors.black),
                ),
              ),
              // IconButton(icon: Icon(Icons.close), onPressed: () {})
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 8),
            alignment: Alignment.topLeft,
            child: Text(
              "Status",
              textAlign: TextAlign.start,
              style: CustomTextStyle.textFormFieldBold
                  .copyWith(color: Colors.black.withOpacity(0.8), fontSize: 12),
            ),
          ),
          SizedBox(height: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [],
          ),
          DropdownButton<String>(
            dropdownColor: Color.fromARGB(255, 0, 255, 255),
            alignment: Alignment.centerLeft,
            focusColor: Color.fromARGB(255, 0, 255, 255),
            value: _selectedValue,
            //elevation: 5,
            style: TextStyle(color: Colors.white),
            iconEnabledColor: Colors.black,
            items: <String>[
              'Not Express',
              'Express',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto"),
                ),
              );
            }).toList(),
            hint: Text(
              "Not Express",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
          ),
          DropdownButton<String>(
            dropdownColor: Color.fromARGB(255, 0, 255, 255),
            alignment: Alignment.centerLeft,
            focusColor: Colors.white,
            value: _chosenValue,
            //elevation: 5,
            style: TextStyle(color: Colors.white),
            iconEnabledColor: Colors.black,
            items: <String>['Pick-Up', 'Delivery', 'Drop-Off']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto"),
                ),
              );
            }).toList(),
            hint: Text(
              "Pick-Up",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Roboto"),
            ),
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
          ),
          Utils.getSizedBox(height: 16),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 8),
            child: Text(
              "Description",
              style: CustomTextStyle.textFormFieldMedium.copyWith(
                  color: Colors.black.withOpacity(0.8),
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter Description',
              hintMaxLines: 5,
              fillColor: Colors.black,
            ),
          ),
          Utils.getSizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 8),
                child: Text(
                  "Amount",
                  style: CustomTextStyle.textFormFieldMedium.copyWith(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 8),
                child: Text(
                  "\Rwf 299.00",
                  style: CustomTextStyle.textFormFieldBlack.copyWith(
                      color: Color.fromARGB(255, 0, 255, 255), fontSize: 14),
                ),
              ),
            ],
          ),
          Utils.getSizedBox(height: 16),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage()));
            },
            color: Color.fromARGB(255, 0, 255, 255),
            padding: EdgeInsets.only(top: 12, left: 60, right: 60, bottom: 12),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(24))),
            child: Text(
              "Add To Cart",
              style: CustomTextStyle.textFormFieldSemiBold
                  .copyWith(color: Colors.white),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
    );
  }

  Container createSizeItem(int index) {
    return Container(
      width: 28,
      margin: EdgeInsets.all(4),
      height: 28,
      padding: EdgeInsets.only(top: 8),
      child: Text(
        listSize[index],
        style: CustomTextStyle.textFormFieldSemiBold
            .copyWith(fontSize: 12, color: Colors.black.withOpacity(0.8)),
        textAlign: TextAlign.center,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              color: selectedSize == index ? Colors.blue : Colors.grey,
              width: 1),
          shape: BoxShape.circle),
    );
  }

  GestureDetector createColorItem(int index) {
    return GestureDetector(
      child: Container(
        width: 24,
        margin: EdgeInsets.all(4),
        height: 24,
        decoration: BoxDecoration(
            color: listColor[index],
            border: Border.all(
                color: Colors.grey, width: selectedColor == index ? 2 : 0),
            shape: BoxShape.circle),
      ),
      onTap: () {
        setState(() {
          selectedColor = index;
        });
      },
    );
  }
}
