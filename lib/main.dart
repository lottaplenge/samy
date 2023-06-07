import 'package:samy_app/config/config_update.dart';
import 'package:samy_app/navigation/navigation_update.dart';
import 'package:samy_app/navigation/navigation_view.dart';
import 'package:samy_app/offers/offers_update.dart';
import 'package:samy_app/offers_create/create_offer_update.dart';
import 'package:samy_app/sign_in/sign_in_update.dart';
import 'package:samy_app/sign_up/sign_up_update.dart';
import 'package:samy_app/user/user_update.dart';
import 'package:flutter/material.dart' hide View;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:json_theme/json_theme.dart';
import 'package:flutter/services.dart'; // For rootBundle
import 'dart:convert'; // For jsonDecode

/// Entry widget
class SamyApp extends StatelessWidget {
  final ThemeData theme;
  const SamyApp({Key? key, required this.theme}) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: const [
          BlocProvider(create: NavigationUpdate.of),
          BlocProvider(create: ConfigUpdate.of, lazy: false),
          BlocProvider(create: UserUpdate.of, lazy: false),
          BlocProvider(create: SignInUpdate.of),
          BlocProvider(create: SignUpUpdate.of),
          BlocProvider(create: OffersUpdate.of),
          BlocProvider(create: CreateOfferUpdate.of),
        ],
        child: MaterialApp(
          navigatorKey: navigatorKey,
          title: 'LoginApp',
          theme: theme,
          home: const NavigationView(),
        ),
      );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeStr = await rootBundle.loadString('assets/appainter_theme.json');
  final themeJson = jsonDecode(themeStr);
  final theme = ThemeDecoder.decodeThemeData(themeJson)!;
  runApp(SamyApp(theme: theme));
}
