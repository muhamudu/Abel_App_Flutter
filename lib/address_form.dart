// ignore: duplicate_ignore
// ignore_for_file: deprecated_member_use, unused_import, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:live_clean/login_page.dart';
import 'package:live_clean/theme.dart';
import 'package:live_clean/utils/inputdecoration.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;
// ignore: unused_import
import 'dart:async';
import 'dart:convert';

class AddressPage extends StatefulWidget {
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  String City, District, Address;

  //TextController to read text entered in text field
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  // ignore: unused_field
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(24.0, 40.0, 24.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Address\nForm',
                    style: heading2.copyWith(
                        color: Color.fromARGB(255, 0, 255, 255)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              SizedBox(
                height: 48,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: buildInputDecoration(Icons.location_city, "City"),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please a Enter';
                    }
                    if (!RegExp(
                            "^[Kigali, Northern Province, Southern Province, Western Province,Eastern Province]")
                        .hasMatch(value)) {
                      return 'Please Enter a valid city';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    City = value;
                  },
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration:
                      buildInputDecoration(Icons.location_on, "District"),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please a Enter';
                    }
                    if (!RegExp("^[a-z]").hasMatch(value)) {
                      return 'Please Enter a valid District';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    District = value;
                  },
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration:
                      buildInputDecoration(Icons.location_on, "Address"),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please a Enter';
                    }
                    if (!RegExp("^[a-z]").hasMatch(value)) {
                      return 'Please Enter a valid Address';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    Address = value;
                  },
                ),
              ),
              SizedBox(
                height: 32,
              ),
              SizedBox(
                width: 400,
                height: 50,
                child: RaisedButton(
                  color: Color.fromARGB(255, 0, 255, 255),
                  onPressed: () {
                    // if (_formkey.currentState.validate()) {
                    //   print("successful");

                    //   return;
                    // } else {
                    //   print("UnSuccessfull");
                    // }
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      side: BorderSide(
                          color: Color.fromARGB(255, 0, 255, 255), width: 2)),
                  textColor: Colors.white,
                  child: Text("Register"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
