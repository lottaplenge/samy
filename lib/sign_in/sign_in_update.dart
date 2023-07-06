import 'dart:convert';
import 'package:samy_app/mvu/messaging.dart';
import 'package:samy_app/mvu/update.dart';
import 'package:samy_app/sign_in/sign_in_message.dart';
import 'package:samy_app/sign_in/sign_in_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:samy_app/user/user_message.dart';
import 'package:samy_app/user/user_model.dart';
import 'package:http/http.dart' as http;


class SignInUpdate extends Update<SignInMessage, SignInModel> {
  SignInUpdate(SignInModel initialModel) : super(initialModel);

  // ignore: avoid_unused_constructor_parameters
  factory SignInUpdate.of(BuildContext context) => SignInUpdate(initialSignInModel);

  @override
  Option<SignInModel> processMessage(SignInMessage message, SignInModel model) {
    if (message is ChangePasswordVisibility) {
      return Some(model.copyWith(obscurePassword: !model.obscurePassword));
    }
    return const None();
  }
}

Future<void> signInBackend(User user) async {
  final Uri localUrl = Uri.parse('http://localhost:3000/login'); //richtiger Link fehlt

  final response = await http.post(
    localUrl,
    headers: {'Content-Type': 'application/json', 'token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NDY0ZDhkN2M4ZTNkM2I1YzEyNjU2ZTciLCJpYXQiOjE2ODQzMzA3MTEsImV4cCI6MTY4NDQxNzExMX0.CyT913nzztrBH9fOaL3f3mzAz94qGKDzgFg6pMTmIPw'},
    body: json.encode({
      'mail': user.mail,
      'password': user.password
    }),
  );

  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  final responseMap = jsonDecode(response.body) as Map<String, dynamic>;
  final cookie = response.headers ['set-cookie'];
  if(cookie!=null) {
    dispatch(SetUserAndToken(User.fromJSON(responseMap), cookie));
  }
}
