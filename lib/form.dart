import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter TextField Validation',
      home: MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  GlobalKey<FormState> formstate = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 191, 194, 196),
        body: Card(
            color: Colors.orangeAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                55.0,
              ),
            ),
            elevation: 10.0,
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                    key: formstate,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Card(
                        color: Colors.white38,
                        child: Column(children: [
                          TextFormField(
                            decoration:
                                InputDecoration(labelText: 'Email address'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter an email address';
                              } else if (!RegExp(
                                      r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                                  .hasMatch(value)) {
                                return 'Please enter a valid email address';
                              }
                              return null; // Return null if the input is valid
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: 'user name'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter an user name';
                              } else {
                                return 'Please enter a valid user name';
                              }
                            },
                          ),
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50.0)),
                                labelText: 'Password',
                                hintText: 'Enter secure password'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "* Required";
                              } else if (value.length < 6) {
                                return "Password should be atleast 6 characters";
                              } else if (value.length > 15) {
                                return "Password should not be greater than 15 characters";
                              } else {
                                return null;
                              }
                            },
                          ),
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50.0)),
                                labelText: 'Confirm Password',
                                hintText: 'Enter secure password'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "* Required";
                              } else if (value.length < 6) {
                                return "Password should be atleast 6 characters";
                              } else if (value.length > 15) {
                                return "Password should not be greater than 15 characters";
                              } else {
                                return null;
                              }
                            },
                          ),
                          MaterialButton(
                            textColor: Colors.black45,
                            color: Colors.blue,
                            onPressed: () {
                              if (formstate.currentState!.validate()) {
                                print("valid");
                              } else {
                                print("notvalied");
                              }
                            },
                            child: Text("sign up"),
                          )
                        ]),
                      ),
                    )))));
  }
}
