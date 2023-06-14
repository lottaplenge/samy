import 'package:bloc_mvu_app/mvu/messaging.dart';
import 'package:bloc_mvu_app/mvu/view.dart';
import 'package:bloc_mvu_app/offers_create/create_offer_messages.dart';
import 'package:bloc_mvu_app/offers_create/create_offer_model.dart';
import 'package:bloc_mvu_app/offers_create/create_offer_update.dart';
import 'package:flutter/material.dart' hide View;

// ignore: must_be_immutable
class CreateOfferView
    extends View<CreateOfferMessage, CreateOfferModel, CreateOfferUpdate> {
  const CreateOfferView({Key? key}) : super(key: key);

  @override
  Widget buildView(CreateOfferModel model) => ListView(
        padding: const EdgeInsets.all(30),
        children: [
          Text(
            'Create offer',
            style: TextStyle(color: Colors.grey[700], fontSize: 18),
          ),
          CreateOffersForm(),
        ],
      );
}

// ignore: use_key_in_widget_constructors
class CreateOffersForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CreateOffersFormState();
}

class CreateOffersFormState extends State<CreateOffersForm> {
  CreateOffersFormState();

  SchoolType selectedSchooltype = SchoolType.Grundschule;
  int selectedClassNo = 1;
  SchoolName selectedSchoolname = SchoolName.Schule1;
  String selectedFirstSchoolday = DateTime.now() as String;
  String selectedSchoolId = "1"; //hart gecoded

  TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(30),
                child: DropdownButton<SchoolType>(
                  items: SchoolType.values
                      .map((type) =>
                          DropdownMenuItem(value: type, child: Text(type.name)))
                      .toList(),
                  onChanged: (newItem) => setState(() {
                    selectedSchooltype = newItem!;
                  }),
                  value: selectedSchooltype,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: DropdownButton<SchoolName>(
                  items: SchoolName.values
                      .map((type) =>
                          DropdownMenuItem(value: type, child: Text(type.name)))
                      .toList(),
                  onChanged: (newName) => setState(() {
                    selectedSchoolname = newName!;
                  }),
                  value: selectedSchoolname,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: DropdownButton<int>(
                  items: List<int>.generate(13, (i) => i + 1)
                      .map((no) => DropdownMenuItem(
                          value: no, child: Text(no.toString())))
                      .toList(),
                  onChanged: (newNo) => setState(() {
                    selectedClassNo = newNo!;
                  }),
                  value: selectedClassNo,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    TextField(
                      controller: _dateController,
                      decoration: InputDecoration(
                        labelText: 'Datum',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        selectedFirstSchoolday = _dateController.text;
                      },
                      child: Text('Speichern'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue[900],
              ),
              child: const Text(
                'Tauschgesuch erstellen',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              onPressed: () {
                dispatch(
                  CreateOffer(
                    classNumber: selectedClassNo,
                    schoolId: selectedSchoolId,
                    firstSchoolday: selectedFirstSchoolday,
                  ),
                );
              },
            ),
          ),
        ],
      );
}
