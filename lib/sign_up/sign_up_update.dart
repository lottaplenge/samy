import 'dart:convert';
import 'package:samy_app/mvu/messaging.dart';
import 'package:samy_app/mvu/update.dart';
import 'package:samy_app/sign_up/sign_up_message.dart';
import 'package:samy_app/sign_up/sign_up_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:samy_app/user/user_message.dart';
import 'package:samy_app/user/user_model.dart';
import 'package:http/http.dart' as http;

class SignUpUpdate extends Update<SignUpMessage, SignUpModel> {
  SignUpUpdate(SignUpModel initialModel) : super(initialModel);

  // ignore: avoid_unused_constructor_parameters
  factory SignUpUpdate.of(BuildContext context) => SignUpUpdate(initialSignUpModel);

  @override
  Option<SignUpModel> processMessage(SignUpMessage message, SignUpModel model) {
    if (message is ChangePasswordVisibility) {
      return Some(model.copyWith(obscurePassword: !model.obscurePassword));
    }
    if (message is SignUpUser) {
      //Frage: Wie UserModel kopieren??
      //Antwort: UserModel userModel = UserModel.get();

      model.firstNameController.text;
    }
    return const None();
  }
}

Future<void> signUpBackend(User user) async {
  final Uri localUrl = Uri.parse('http://localhost:3000/login'); //richtiger Link fehlt

  final response = await http.post(
    localUrl,
    headers: {'Content-Type': 'application/json'},
    body: json.encode({
      'firstName': user.firstName,
      'lastName': user.lastName,
      'street': user.street,
      'streetNumber': user.streetNumber,
      'city': user.city,
      'mail': user.mail,
      'postCode': user.postCode,
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