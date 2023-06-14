import 'package:bloc_mvu_app/mvu/messaging.dart';
import 'package:bloc_mvu_app/offers_create/create_offer_model.dart';
import 'package:bloc_mvu_app/offers_create/create_offer_update.dart';
import 'package:bloc_mvu_app/user/user_message.dart';
import '../user/user_model.dart';

abstract class CreateOfferMessage extends UpdateMessage {
  CreateOfferMessage() : super(routeTo: CreateOfferUpdate);
}

class CreateOffer extends CreateOfferMessage { //implements createUser? mit @Override
  CreateOffer({required this.classNumber, required this.firstSchoolday, required this.schoolId});

  final int classNumber;
  final String firstSchoolday;
  final String schoolId;

}
