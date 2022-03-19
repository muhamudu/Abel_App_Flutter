// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:live_clean/Forgot_password.dart';
import 'package:live_clean/home.dart';
import 'package:live_clean/pages/HomePage.dart';
import 'package:live_clean/register_page.dart';
import 'package:live_clean/widgets/custom_checkbox.dart';
import 'package:email_validator/email_validator.dart';
import '../theme.dart';

void main() {
  var email = "liveclean@gmail.com";

  assert(EmailValidator.validate(email) == true);
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

final formKey = GlobalKey<FormState>();
final scaffoldKey = GlobalKey<ScaffoldState>();

//We have two private fields here
String _email;
String _password;

// a private method `_submitCommand()`
// ignore: unused_element
void _submitCommand() {
  //get state of our Form
  final form = formKey.currentState;

  //`validate()` validates every FormField that is a descendant of this Form,
  // and returns true if there are no errors.
  if (form.validate()) {
    //`save()` Saves every FormField that is a descendant of this Form.
    form.save();

    // Email & password matched our validation rules
    // and are saved to _email and _password fields.
    _loginCommand();
  }
}

void _loginCommand() {
  // Show login details in snackbar
  final snackbar = SnackBar(
    content: Text('Email: $_email, password: $_password'),
  );
  scaffoldKey.currentState.showSnackBar(snackbar);
}

class _LoginPageState extends State<LoginPage> {
  bool passwordVisible = false;

  var validatePassword;
  void togglePassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

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
                    'Login to your\naccount',
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
              Form(
                child: Column(children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    child: TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Email",
                        hintText: "Enter Email",
                        icon: Icon(Icons.mail),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 0, 255, 255)),
                        ),
                      ),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please a Enter';
                        }
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          return 'Please a valid Email';
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        _email = value;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    child: TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Password",
                        hintText: "Enter Password",
                        icon: Icon(Icons.lock),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 0, 255, 255)),
                        ),
                      ),
                      validator: (val) =>
                          val.length < 4 ? 'Your password is too short!' : null,
                      onSaved: (val) => _password = val,
                      obscureText: true,
                    ),
                  ),
                ]),
              ),
              SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomCheckbox(),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    'Remember me',
                    style: regular16pt.copyWith(color: textGrey),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPage()));
                    },
                    child: Text(
                      'Forgot Password',
                      style: regular16pt.copyWith(
                          color: Color.fromARGB(255, 0, 255, 255)),
                    ),
                  ),
                ],
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
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      side: BorderSide(
                          color: Color.fromARGB(255, 0, 255, 255), width: 2)),
                  textColor: Colors.white,
                  child: Text("Log in"),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Center(
                child: Text(
                  'OR',
                  style: heading6.copyWith(color: textGrey),
                ),
              ),
              SizedBox(height: 24),
              SizedBox(
                width: 400,
                height: 50,
                child: RaisedButton(
                  color: Color.fromARGB(255, 13, 85, 167),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      side: BorderSide(
                          color: Color.fromARGB(255, 35, 64, 160), width: 2)),
                  textColor: Colors.white,
                  child: Text("Log in with Facebook"),
                ),
              ),
              SizedBox(
                height: 24,
              ),
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
                              builder: (context) => RegisterPage()));
                    },
                    child: Text(
                      'Register',
                      style: regular16pt.copyWith(
                          color: Color.fromARGB(255, 0, 255, 255)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
