import 'package:flutter/material.dart';

const kPrimaryColor = Colors.blue;

OutlineInputBorder border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        10,
      ),
    );
  }

//Validations

bool isEmail(String? email) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(email!);
  }

bool isPassworrd(String? pass) {
    String pr =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$';
    RegExp regExp = new RegExp(pr);

    return regExp.hasMatch(pass!);
  }