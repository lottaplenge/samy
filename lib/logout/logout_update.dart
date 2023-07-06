import 'package:samy_app/logging/logging.dart';
import 'package:samy_app/mvu/update.dart';
import 'package:samy_app/logout/logout_message.dart';
import 'package:samy_app/logout/logout_model.dart';
import 'package:samy_app/user/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http hide get;
import 'dart:convert';

class LogoutUpdate extends Update<LogoutMessage, LogoutModel> {
  LogoutUpdate(LogoutModel initialModel) : super(initialModel);

  // ignore: avoid_unused_constructor_parameters
  factory LogoutUpdate.of(BuildContext context) => LogoutUpdate(initialLogoutModel);

  @override
  Option<LogoutModel> processMessage(LogoutMessage message, LogoutModel model) {
    if (message is LogoutUser) {
       UserModel.get().user.forEach((user) {logoutBackend(user);});
      return None();
    }
    logger.e('Unimplemented message update $message');
    return const None();
    }
  }



Future<void> logoutBackend(User user) async {
  final Uri localUrl = Uri.parse('http://localhost:3000/logout'); //richtiger Link fehlt

  final response = await http.post(
    localUrl,
    headers: {'Content-Type': 'application/json', 'token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NDY0ZDhkN2M4ZTNkM2I1YzEyNjU2ZTciLCJpYXQiOjE2ODQzMzA3MTEsImV4cCI6MTY4NDQxNzExMX0.CyT913nzztrBH9fOaL3f3mzAz94qGKDzgFg6pMTmIPw'},
    body: json.encode({
    }),
  );

  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  //return Offer.fromJSON(jsonDecode(response.body) as Map<String, dynamic>); // aus create_offer_update
}
