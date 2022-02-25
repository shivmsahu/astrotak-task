import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:task_app/common/default_button.dart';
import 'package:task_app/modules/profile/bloc/profile_bloc.dart';
import 'package:task_app/modules/profile/controllers/profile_controller.dart';
import 'package:task_app/modules/profile/models/location_response_model.dart';
import 'package:task_app/modules/profile/models/update_relative_request_model.dart';
import 'package:task_app/modules/profile/profile_provider.dart';
import 'package:task_app/resources/resources.dart';
import 'package:task_app/utils/utils.dart';

class UpdateRelativeForm extends StatefulWidget {
  static const String routeName = 'UpdateRelativeForm';

  const UpdateRelativeForm({Key? key}) : super(key: key);

  @override
  _UpdateRelativeFormState createState() => _UpdateRelativeFormState();
}

class _UpdateRelativeFormState extends State<UpdateRelativeForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController dayController;
  late TextEditingController monthController;
  late TextEditingController yearController;
  late TextEditingController hourController;
  late TextEditingController minuteController;
  late TextEditingController placeOfBirthController;
  String? gender;
  String? uuid;
  int? relationCode;
  bool isAm = true;
  BirthPlace? _birthPlace;
  late ProfileBloc _profileBloc;
  late ProfileProvider _profileProvider;

  @override
  void initState() {
    _profileBloc = BlocProvider.of<ProfileBloc>(context);
    _profileProvider = Provider.of<ProfileProvider>(context, listen: false);
    _profileBloc.stream.listen((state) {
      if (state is UpdateRelativeProfileCompletedState) {
        Fluttertoast.showToast(msg: StringBase.profileUpdatedSuccess);
        Navigator.of(context).pop();
      }
      if (state is UpdateRelativeProfileErrorState) {
        Fluttertoast.showToast(msg: StringBase.somethingWentWrong);
      }
    });
    var relativeData = _profileProvider.updateProfileData;
    if (relativeData != null) {
      uuid = relativeData.uuid;
      _birthPlace = BirthPlace(
          placeName: relativeData.birthPlace?.placeName,
          placeId: relativeData.birthPlace?.placeId);
      relationCode = (relativeData.relationId ?? 3) % relationList.length;

      ///matched according dummy list

      gender = relativeData.gender;
    }
    var date = DateTime.parse(relativeData?.dateAndTimeOfBirth ?? '');
    var time = DateFormat('hh:mm a').format(date);
    var timeArr = time.split(' ');
    if (timeArr.length > 1) {
      isAm = (timeArr[1]).toUpperCase() == StringBase.am;
    }
    nameController = TextEditingController(
        text: '${relativeData?.firstName} ${relativeData?.lastName}');
    dayController = TextEditingController(text: date.day.toString());
    monthController = TextEditingController(text: date.month.toString());
    yearController = TextEditingController(text: date.year.toString());
    hourController = TextEditingController(
        text: (date.hour - (date.hour > 12 ? 12 : 0)).toString());
    minuteController = TextEditingController(text: date.minute.toString());
    placeOfBirthController =
        TextEditingController(text: _birthPlace?.placeName);
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    dayController.dispose();
    monthController.dispose();
    yearController.dispose();
    hourController.dispose();
    minuteController.dispose();
    placeOfBirthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorBase.offWhite,
        elevation: 0,
        titleSpacing: 0,
        leading: IconButton(
            onPressed: () {
              Utils.profileNav.currentState?.pop();
            },
            icon: const Icon(
              Icons.chevron_left,
              size: 30,
              color: ColorBase.black,
            )),
        title: const Text(
          StringBase.editProfile,
          style: TextStyle(
            color: ColorBase.black,
            fontWeight: FontWeight.w200,
            fontSize: 18,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    StringBase.name,
                    style: TextStyle(
                      color: ColorBase.black,
                      fontWeight: FontWeight.w200,
                      fontSize: 14,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      controller: nameController,
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return StringBase.enterValidName;
                        }
                        return null;
                      },
                    ),
                  ),
                  const Text(
                    StringBase.dateOfBirth,
                    style: TextStyle(
                      color: ColorBase.black,
                      fontWeight: FontWeight.w200,
                      fontSize: 14,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: dayController,
                            keyboardType: TextInputType.number,
                            maxLength: 2,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: StringBase.dd),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return StringBase.invalid + ' ' + StringBase.dd;
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: monthController,
                            keyboardType: TextInputType.number,
                            maxLength: 2,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: StringBase.mm),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return StringBase.invalid + ' ' + StringBase.mm;
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: yearController,
                            keyboardType: TextInputType.number,
                            maxLength: 4,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: StringBase.yyyy),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return StringBase.invalid +
                                    ' ' +
                                    StringBase.yyyy;
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    StringBase.timeOfBirth,
                    style: TextStyle(
                      color: ColorBase.black,
                      fontWeight: FontWeight.w200,
                      fontSize: 14,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: hourController,
                            keyboardType: TextInputType.number,
                            maxLength: 2,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: StringBase.hh),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return StringBase.invalid + ' ' + StringBase.hh;
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: minuteController,
                            keyboardType: TextInputType.number,
                            maxLength: 2,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: StringBase.mm),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return StringBase.invalid + ' ' + StringBase.mm;
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          flex: 3,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isAm = !isAm;
                              });
                            },
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18, vertical: 18),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: isAm
                                        ? ColorBase.steelBlue
                                        : ColorBase.white,
                                    boxShadow:
                                        isAm ? null : kElevationToShadow[1],
                                  ),
                                  child: Text(
                                    StringBase.am,
                                    style: TextStyle(
                                        color: isAm
                                            ? ColorBase.white
                                            : ColorBase.black),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18, vertical: 18),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: !isAm
                                        ? ColorBase.steelBlue
                                        : ColorBase.white,
                                    boxShadow:
                                        !isAm ? null : kElevationToShadow[1],
                                  ),
                                  child: Text(
                                    StringBase.pm,
                                    style: TextStyle(
                                        color: !isAm
                                            ? ColorBase.white
                                            : ColorBase.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    StringBase.placeOfBirth,
                    style: TextStyle(
                      color: ColorBase.black,
                      fontWeight: FontWeight.w200,
                      fontSize: 14,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TypeAheadField(
                      textFieldConfiguration: TextFieldConfiguration(
                        controller: placeOfBirthController,
                        style: DefaultTextStyle.of(context)
                            .style
                            .copyWith(fontStyle: FontStyle.italic),
                        decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                      ),
                      suggestionsCallback: (pattern) async {
                        return await ProfileController.getLocationList(
                            location: pattern);
                      },
                      itemBuilder: (context, suggestion) {
                        suggestion as LocationData;
                        return ListTile(
                          title: Text(suggestion.placeName ?? ""),
                        );
                      },
                      onSuggestionSelected: (suggestion) {
                        suggestion as LocationData;
                        placeOfBirthController.text = suggestion.placeName!;
                        _birthPlace = BirthPlace(
                            placeId: suggestion.placeId,
                            placeName: suggestion.placeName);
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              StringBase.gender,
                              style: TextStyle(
                                color: ColorBase.black,
                                fontWeight: FontWeight.w200,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder()),
                              value: gender,
                              onChanged: (value) =>
                                  setState(() => gender = value),
                              validator: (value) => value == null
                                  ? StringBase.invalid + " " + StringBase.gender
                                  : null,
                              items: genderList.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              StringBase.relation,
                              style: TextStyle(
                                color: ColorBase.black,
                                fontWeight: FontWeight.w200,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder()),
                              value: relationCode != null
                                  ? relationList[relationCode!]
                                  : null,
                              onChanged: (value) => setState(() =>
                                  relationCode = relationList.indexOf(value!)),
                              validator: (value) => value == null
                                  ? StringBase.invalid +
                                      " " +
                                      StringBase.relation
                                  : null,
                              items: relationList.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  DefaultButton(
                      text: StringBase.saveChanges,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          var nameArr = nameController.text.split(' ');
                          var _firstName = nameArr.first;
                          var _lastName = '';
                          if (nameArr.length > 1) {
                            for (int i = 1; i < nameArr.length; i++) {
                              _lastName = '$_lastName ${nameArr[i]}';
                            }
                          }
                          _profileBloc
                              .updateRelativeProfile(UpdateRelativeRequestModel(
                            uuid: uuid,
                            firstName: _firstName,
                            middleName: '',
                            lastName: _lastName,
                            fullName: nameController.text,
                            relationId: relationCode! + 1,
                            relation: relationList[relationCode!],
                            gender: gender,
                            dateAndTimeOfBirth:
                                '${yearController.text}-${monthController.text}-${dayController.text} ${hourController.text}:${minuteController.text}',
                            birthDetails: BirthDetails(
                              dobDay: int.parse(dayController.text),
                              dobMonth: int.parse(monthController.text),
                              dobYear: int.parse(yearController.text),
                              tobHour: int.parse(hourController.text),
                              tobMin: int.parse(minuteController.text),
                              meridiem: isAm ? StringBase.am : StringBase.pm,
                            ),
                            birthPlace: _birthPlace,
                          ));
                          // _profileBloc
                          //     .addRelativeProfile(AddRelativeRequestModel(
                          //   firstName: _firstName,
                          //   lastName: _lastName,
                          //   relationId: relationCode! + 1,
                          //   gender: gender,
                          //   birthDetails: BirthDetails(
                          //     dobDay: int.parse(dayController.text),
                          //     dobMonth: int.parse(monthController.text),
                          //     dobYear: int.parse(yearController.text),
                          //     tobHour: int.parse(hourController.text),
                          //     tobMin: int.parse(minuteController.text),
                          //     meridiem: isAm ? StringBase.am : StringBase.pm,
                          //   ),
                          //   birthPlace: _birthPlace,
                          // ));
                        }
                      }),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<String> genderList = const [
    StringBase.male,
    StringBase.female,
    StringBase.others,
  ];

  ///Dummy relationList and codes
  List<String> relationList = const [
    StringBase.brother,
    StringBase.mother,
    StringBase.father,
    StringBase.sister,
    StringBase.wife,
    StringBase.son,
    StringBase.daughter,
  ];
}
