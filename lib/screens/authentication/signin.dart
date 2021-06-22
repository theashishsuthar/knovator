import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../constraint.dart';
import '../HomeScreen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey();
  OutlineInputBorder inlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        10,
      ),
    );
  }

  //Sign in method
  signin() async {
    if (_key.currentState!.validate()) {
      try {
        _key.currentState!.save();
        var headers = {
          'content-type': 'application/json',
          'Accept-Language': 'en',
          'User-Agent': 'android',
          'X-Install-Type': 'telehealer-india',
          'Content-Type': 'application/json; charset=UTF-8',
          'Host': '44.238.77.66:8082',
        };
        var data =
            '{"password":"${passcontroller.text}","version":"2.9.8","email":"${emailcontroller.text}"}';

        var res = await http.post(Uri.parse('http://44.238.77.66:8082/login'),
            headers: headers, body: data);
        if (res.statusCode == 200) {
          print(jsonDecode(res.body)['success']);
          if (jsonDecode(res.body)['success'] == true) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return Homescreen(
                token: jsonDecode(res.body)['token'],
              );
            }));
          } else {
            return showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(
                      'Something went wrong!',
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Okay',
                          ))
                    ],
                  );
                });
          }
        } else {
          return showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(
                    'Something went wrong!',
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Okay',
                        ))
                  ],
                );
              });
        }
      } catch (e) {
        return showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  'Something went wrong!',
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Okay',
                      ))
                ],
              );
            });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Text(
          'Signin',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Form(
        key: _key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: width * 0.05, vertical: height * 0.01),
              child: TextFormField(
                controller: emailcontroller,
                autovalidateMode: AutovalidateMode.disabled,
                validator: (String? value) {
                  if (!isEmail(value)) {
                    return "Please enter valid email.";
                  }
                },
                decoration: InputDecoration(
                  focusedBorder: inlineBorder(),
                  labelText: 'Email',
                  border: inlineBorder(),
                  errorBorder: inlineBorder(),
                  enabledBorder: inlineBorder(),
                  hintText: "Enter your email",
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: width * 0.05, vertical: height * 0.01),
              child: TextFormField(
                controller: passcontroller,
                obscureText: true,
                autovalidateMode: AutovalidateMode.disabled,
                validator: (String? value) {
                  if (!isPassworrd(value)) {
                    return "Entered password must contains 1 digit, 1 lowercase letter, 1 uppercase letter upto 8 letters.";
                  }
                },
                // maxLength: 8,
                decoration: InputDecoration(
                  errorMaxLines: 2,
                  focusedBorder: inlineBorder(),
                  labelText: "password",
                  errorBorder: inlineBorder(),
                  border: inlineBorder(),
                  enabledBorder: inlineBorder(),
                  hintText: "Enter your password",
                ),
              ),
            ),
            ElevatedButton(
              onPressed: signin,
              child: Text(
                'LOGIN',
              ),
            )
          ],
        ),
      ),
    );
  }
}
