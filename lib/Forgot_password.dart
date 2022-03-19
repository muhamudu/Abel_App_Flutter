// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:live_clean/login_page.dart';
import 'package:live_clean/register_page.dart';
import 'package:live_clean/theme.dart';

class ForgotPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(children: <Widget>[
                        Text(
                          "Forgot Password",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                              color: Color.fromARGB(255, 0, 225, 255)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Please enter  your email and we shall \nSend you  a link to return to your account",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 48,
                        ),
                        Form(
                          child: Column(children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Enter Email',
                                  labelText: "Email",
                                  icon: Icon(Icons.mail),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  hintStyle: heading6.copyWith(color: textGrey),
                                  enabledBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 0, 255, 255)),
                                  ),
                                ),
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()),
                                  );
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                    side: BorderSide(
                                        color: Color.fromARGB(255, 0, 255, 255),
                                        width: 2)),
                                textColor: Colors.white,
                                child: Text("Continue"),
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account? ",
                                  style: regular16pt.copyWith(color: textGrey),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RegisterPage()));
                                  },
                                  child: Text(
                                    'Register',
                                    style: regular16pt.copyWith(
                                        color:
                                            Color.fromARGB(255, 0, 255, 255)),
                                  ),
                                ),
                              ],
                            ),
                          ]),
                        ),
                      ]),
                    ]))));
  }
}
