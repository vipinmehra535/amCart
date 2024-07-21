import 'dart:convert';

import 'package:amcart/constants/error_handling.dart';
import 'package:amcart/constants/global_variables.dart';
import 'package:amcart/constants/utlis.dart';
import 'package:amcart/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService {
  void signUp({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      User user = User(
        name: name,
        email: email,
        password: password,
        address: '',
        type: '',
        token: '',
        id: '',
      );

      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (context.mounted) {
        httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(
                context, 'Account created! Login with the same credentials');
          },
        );
      } else {
        return;
      }
      print(res.body);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signIn({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/login'),
        body: jsonEncode({"email": email, "password": password}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      print(res.body);
      if (context.mounted) {
        httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {},
        );
      } else {
        return;
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
