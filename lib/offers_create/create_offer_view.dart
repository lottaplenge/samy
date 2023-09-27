import 'package:flutter/material.dart' hide View;
import 'package:samy_app/mvu/messaging.dart';
import 'package:samy_app/mvu/view.dart';
import 'package:samy_app/offers_create/create_offer_messages.dart';
import 'package:samy_app/offers_create/create_offer_model.dart';
import 'package:samy_app/offers_create/create_offer_update.dart';

const defaultSchoolType = SchoolType.Grundschule;
const defaultSchoolName = SchoolName.Schule1;
const defaultClassNo = 1;

// ignore: must_be_immutable
class CreateOfferView
    extends View<CreateOfferMessage, CreateOfferModel, CreateOfferUpdate> {
  const CreateOfferView({Key? key}) : super(key: key);

  @override
  Widget buildView(CreateOfferModel model) => ListView(
        padding: const EdgeInsets.all(30),
        children: [
          Text(
            'Erstellen Sie ein Tauschgesuch, um den perfekten Schulplatz zu finden.',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            'Geben Sie dazu die derzeitige Schule, die Schulklasse und das voraussichtliche Datum des Schulwechsels an.',
            style: TextStyle(fontSize: 16),
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

  SchoolType selectedSchooltype = defaultSchoolType;
  int selectedClassNo = defaultClassNo;
  SchoolName selectedSchoolname = defaultSchoolName;
  String selectedFirstSchoolday = DateTime.now().toString();
  String selectedSchoolId = "1"; //hart gecoded
  DateTime date = DateTime.timestamp();

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: Text(
                    'Bitte geben Sie hier den gewünschten Schultypen ein!'),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: DropdownButton<SchoolType>(
                    items: SchoolType.values
                        .map((type) => DropdownMenuItem(
                            value: type, child: Text(type.name)))
                        .toList(),
                    onChanged: (newItem) {
                      setState(() {
                        selectedSchooltype = newItem ?? defaultSchoolType;
                      });
                    },
                    value: selectedSchooltype,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child:
                    Text('Bitte geben Sie hier den bisherigen Schulnamen ein!'),),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child:
                    DropdownButton<SchoolName>(
                      items: SchoolName.values
                          .map((type) => DropdownMenuItem(
                              value: type, child: Text(type.name)))
                          .toList(),
                      onChanged: (newName) {
                        setState(() {
                          selectedSchoolname = newName ?? defaultSchoolName;
                        });
                      },
                      value: selectedSchoolname,
                    ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child:
                    Text(
                        'Bitte geben Sie hier die gewünschte Schulklasse ein!'),),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child:DropdownButton<int>(
                      items: List<int>.generate(13, (i) => i + 1)
                          .map((no) => DropdownMenuItem(
                              value: no, child: Text(no.toString())))
                          .toList(),
                      onChanged: (newNo) {
                        setState(() {
                          selectedClassNo = newNo ?? defaultClassNo;
                        });
                      },
                    value: selectedClassNo,
                    ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    Text('Bitte geben Sie hier das gewünschten Datum ein!'),
                    Text(
                      '${date.year}/${date.month}/${date.day}',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      child: Text('Datum wählen'),
                      onPressed: () async {
                        DateTime? selectedFirstSchoolday = await showDatePicker(
                          context: context,
                          initialDate: date,
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                        );
                        //if 'CANCEL' => null
                        if (selectedFirstSchoolday == null) return;

                        //if 'OK' => DateTime
                        setState(() => date = selectedFirstSchoolday);
                      }, //onPressed
                    ),
                  ], //children
                ),
              ),
            ], //Children
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              child: const Text(
                'Tauschgesuch erstellen',
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
