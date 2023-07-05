import 'package:samy_app/mvu/messaging.dart';
import 'package:samy_app/mvu/view.dart';
import 'package:samy_app/navigation/navigation_messages.dart';
import 'package:samy_app/navigation/navigation_model.dart';
import 'package:samy_app/sign_in/sign_in_message.dart';
import 'package:samy_app/sign_in/sign_in_model.dart';
import 'package:samy_app/sign_in/sign_in_update.dart';
import 'package:flutter/material.dart' hide Page, View;
import 'package:google_fonts/google_fonts.dart';

class SignInView extends View<SignInMessage, SignInModel, SignInUpdate> {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget buildView(SignInModel model) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Welcome to SAMY',
                            style: GoogleFonts.abel(fontSize: 25
                            )),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Log in to find the perfect place for your youngster',
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              const TextField(
                                decoration: InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextField(
                                obscureText: model.obscurePassword,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  border: const OutlineInputBorder(),
                                  suffixIcon: IconButton(
                                    icon: Icon(model.obscurePassword ? Icons.visibility_off : Icons.visibility),
                                    onPressed: () {
                                      dispatch(ChangePasswordVisibility());
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          padding: const EdgeInsets.all(15),
                                        ),
                                        onPressed: () {
                                          dispatch(NavigateTo(Page.signUp));
                                        },
                                        child: const Text(
                                          'Register now',
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 30,
                                    width: 1,
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: const Text('FORGOT PASSWORD?'),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(15),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Login',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
