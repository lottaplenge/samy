import 'package:bloc_mvu_app/mvu/messaging.dart';
import 'package:bloc_mvu_app/offers_create/create_offer_model.dart';
import 'package:bloc_mvu_app/offers_create/create_offer_update.dart';

abstract class CreateOfferMessage extends UpdateMessage {
  CreateOfferMessage() : super(routeTo: CreateOfferUpdate);
}

class CreateOffer extends CreateOfferMessage {
  CreateOffer({required this.schoolType, required this.classNo});

  final SchoolType schoolType;
  final int classNo;
}
