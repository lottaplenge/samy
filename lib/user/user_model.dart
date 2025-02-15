// ignore: flutter_style_todos
// ignore: flutter_style_todos
// ignore: flutter_style_todos
// ignore: flutter_style_todos
// ignore: flutter_style_todos
import 'package:samy_app/mvu/update.dart';
import 'package:samy_app/user/user_update.dart';
import 'package:dartz/dartz.dart';

class UserModel {
  UserModel({
    required this.user,
  });

  final Option<User> user;

  UserModel copyWith(
    Option<User>? user,
  ) =>
      UserModel(
        // Returns new UserModel with new values for class variables, if passed through copyWith function. Otherwise variables will be kept with old values
        user: user ?? this.user,
      );

  static UserModel get() {
    final userUpdate = updateByType[UserUpdate];

    if (userUpdate != null && userUpdate is UserUpdate) {
      return userUpdate.model();
    }

    throw Exception(
      'This app can not work without an instance of UserUpdate! Consider setting the lazy Parameter in the BlocBuilder to false.',
    );
  }
}

class User {
  User({
    required this.firstName,
    required this.lastName,
    required this.street,
    required this.streetNumber,
    required this.city,
    required this.mail,
    required this.password,
    required this.postCode,
    required this.image,
    required this.id,
  });

  // noch editieren!
  factory User.fromJSON(Map<String, dynamic> data) {
    // note the explicit cast to String
    // this is required if robust lint rules are enabled
    final id = optionOf(data['_id'] as String);
    final firstName = data['firstName'] as String;
    final lastName = data['lastName'] as String;
    final street = data['street'] as String;
    final streetNumber = data['street'] as String;
    final postCode = data['postCode'] as String;
    final city = data['city'] as String;
    final mail = data['mail'] as String;
    final password = data['password'] as String;

    return User(
      id: id,
      firstName: firstName,
      lastName: lastName,
      street: street,
      streetNumber: streetNumber,
      postCode: postCode,
      city: city,
      mail: mail,
      password: password,
      image: 'Platzhalter',
    );
  }

  final String firstName, lastName, street, streetNumber, postCode, city, mail, password, image;
  final Option<String> id; // ID is set after initial user instantiation once API response arrived

}

// TODO: initialUser rauslöschen, sobald Login funktioniert.
final User initialUser = User(
  firstName: 'Olive',
  lastName: 'Tree',
  street: 'Karl-Liebknecht-Straße',
  streetNumber: '38',
  city: 'Leipzig',
  mail: 'döner@olivetree.de',
  password: 'dönerMachtschöner',
  postCode: '04107',
  image: 'assets/samy_small.png',
  id: const None(),
);

final UserModel initialUserModel = UserModel(user: some(initialUser));
