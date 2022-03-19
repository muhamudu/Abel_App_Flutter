import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:live_clean/theme.dart';
import 'package:live_clean/utils/inputdecoration.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();

  //TextController to read text entered in text field
  TextEditingController fullnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void signup(
      String fullname, phone, gender, city, district, address, password) async {
    try {
      Response response = await post(
          Uri.parse(
              'http://abel.livecleanrwanda.com/api/customer_register_api'),
          body: {
            'fullname': fullname,
            'Phone': phone,
            'Gender': gender,
            'City': city,
            'District': district,
            'Address': address,
            'Password': password
          });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['token']);
        print(' successfully');
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // ignore: unused_field
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.fromLTRB(24.0, 40.0, 24.0, 0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Register new\naccount',
                              style: heading2.copyWith(
                                  color: Color.fromARGB(255, 0, 255, 255)),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 15, left: 10, right: 10),
                          child: TextFormField(
                            controller: fullnameController,
                            key: formKey,
                            keyboardType: TextInputType.text,
                            decoration:
                                buildInputDecoration(Icons.person, "Full Name"),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please a Enter Name';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 15, left: 10, right: 10),
                          child: TextFormField(
                            controller: phoneController,
                            keyboardType: TextInputType.text,
                            decoration:
                                buildInputDecoration(Icons.phone, "Phone"),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please a Enter Phone';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 15, left: 10, right: 10),
                          child: TextFormField(
                            controller: genderController,
                            keyboardType: TextInputType.text,
                            decoration:
                                buildInputDecoration(Icons.person, "Gender"),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please a Enter Phone';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 15, left: 10, right: 10),
                          child: TextFormField(
                            controller: cityController,
                            keyboardType: TextInputType.text,
                            decoration: buildInputDecoration(
                                Icons.location_city, "City"),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please Enter City';
                              }

                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 15, left: 10, right: 10),
                          child: TextFormField(
                              controller: districtController,
                              keyboardType: TextInputType.text,
                              decoration: buildInputDecoration(
                                  Icons.location_on, "District"),
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Please Enter District';
                                }
                                return null;
                              }),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 15, left: 10, right: 10),
                          child: TextFormField(
                            controller: addressController,
                            keyboardType: TextInputType.text,
                            decoration: buildInputDecoration(
                                Icons.location_on, "Address"),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please Enter Address';
                              }
                              if (!RegExp("^[a-z]").hasMatch(value)) {
                                return 'Please Enter Address';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 15, left: 10, right: 10),
                          child: TextFormField(
                            controller: passwordController,
                            keyboardType: TextInputType.text,
                            decoration:
                                buildInputDecoration(Icons.lock, "Password"),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please Enter Password';
                              }
                              if (!RegExp("^[a-z]").hasMatch(value)) {
                                return 'Please Enter Address';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                            onTap: () {
                              signup(
                                  fullnameController.text.toString(),
                                  phoneController.text.toString(),
                                  genderController.text.toString(),
                                  cityController.text.toString(),
                                  districtController.text.toString(),
                                  addressController.text.toString(),
                                  passwordController.text.toString());
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 0, 255, 255),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text('Sign up'),
                              ),
                              // SizedBox(
                              //   width: 400,
                              //   height: 50,
                              //   child: RaisedButton(
                              //     color: Color.fromARGB(255, 0, 255, 255),
                              //     onPressed: () {
                              //       if (_formkey.currentState.validate()) {
                              //         print("successful");

                              //         return;
                              //       } else {
                              //         print("UnSuccessfull");
                              //       }
                              //       // Navigator.push(
                              //       //   context,
                              //       //   MaterialPageRoute(builder: (context) => AddressPage()),
                              //       // );
                              //     },
                              //     shape: RoundedRectangleBorder(
                              //         borderRadius: BorderRadius.circular(50.0),
                              //         side: BorderSide(
                              //             color: Color.fromARGB(255, 0, 255, 255),
                              //             width: 2)),
                              //     textColor: Colors.white,
                              //     child: Text("Sign up"),
                              //   ),
                              // ),
                            ))
                      ]))),
        ));
  }
}
