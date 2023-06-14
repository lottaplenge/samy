import 'package:bloc_mvu_app/user/user_model.dart';
import 'package:dartz/dartz.dart';

class CreateOfferModel {
  CreateOfferModel();



  CreateOfferModel copyWith() =>
      CreateOfferModel(
      );
}

final CreateOfferModel initialCreateOffersModel = CreateOfferModel(

);
class Offer {
  Offer({
    required this.offerId,
    required this.schoolId,
    required this.firstSchoolDay,
    required this.classNumber,
  });

  factory Offer.fromJSON(Map<String, dynamic> data) {
    // note the explicit cast to String
    // this is required if robust lint rules are enabled
    final offerId = data ['offerId'] as String;
    final schoolId = data['schoolId'] as String;
    final classNumber = data['classNumber'] as int;
    final firstSchoolDay = data['firstSchoolDay'] as String;

    return Offer(
      offerId: offerId,
      schoolId: schoolId,
      classNumber: classNumber,
      firstSchoolDay: firstSchoolDay,

    );
  }

  final String offerId, firstSchoolDay, schoolId;
  final int classNumber;

}

  // ignore: constant_identifier_names
  enum SchoolType { Gymnasium, Realschule, Hauptschule, Grundschule, Berufsschule }
  enum SchoolName {Schule1, Schule2, Schule3}
