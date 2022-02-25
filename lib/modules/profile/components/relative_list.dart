import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:task_app/common/default_button.dart';
import 'package:task_app/modules/profile/bloc/profile_bloc.dart';
import 'package:task_app/modules/profile/components/add_relative_form.dart';
import 'package:task_app/modules/profile/components/relative_tile.dart';
import 'package:task_app/modules/profile/components/update_relative_form.dart';
import 'package:task_app/modules/profile/components/wallet_balance_card.dart';
import 'package:task_app/modules/profile/profile_provider.dart';
import 'package:task_app/resources/resources.dart';
import 'package:task_app/utils/utils.dart';

class RelativeList extends StatefulWidget {
  static const String routeName = 'RelativeList';

  const RelativeList({Key? key}) : super(key: key);

  @override
  _RelativeListState createState() => _RelativeListState();
}

class _RelativeListState extends State<RelativeList> {
  late ProfileBloc _profileBloc;
  late ProfileProvider _profileProvider;

  @override
  void initState() {
    _profileBloc = BlocProvider.of<ProfileBloc>(context);
    _profileProvider = Provider.of<ProfileProvider>(context, listen: false);
    _profileBloc.stream.listen((state) {
      if (state is DeleteRelativeProfileCompletedState ||
          state is AddRelativeProfileCompletedState ||
          state is UpdateRelativeProfileCompletedState ||
          state is AddRelativeProfileErrorState ||
          state is DeleteRelativeProfileErrorState) {
        _profileBloc.getRelativeList();
      }
      if (state is DeleteRelativeProfileCompletedState) {
        Fluttertoast.showToast(msg: StringBase.profileDeleteSuccess);
      }
      if (state is DeleteRelativeProfileErrorState) {
        Fluttertoast.showToast(msg: StringBase.somethingWentWrong);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WalletBalanceCard(
          balance: 56,
          onAddMoney: () {},
        ),
        Expanded(
          child: BlocBuilder<ProfileBloc, ProfileState>(
              bloc: _profileBloc,
              builder: (_, state) {
                if (state is GetRelativeListCompletedState) {
                  var data = state.data.data?.allRelatives ?? [];
                  if (data.isNotEmpty) {
                    _profileProvider.relativeList = data;
                    return Column(
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: const [
                            SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                StringBase.name,
                                style: TextStyle(
                                  color: ColorBase.steelBlue,
                                  fontWeight: FontWeight.w200,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                StringBase.dob,
                                style: TextStyle(
                                  color: ColorBase.steelBlue,
                                  fontWeight: FontWeight.w200,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                StringBase.tob,
                                style: TextStyle(
                                  color: ColorBase.steelBlue,
                                  fontWeight: FontWeight.w200,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                StringBase.relation,
                                style: TextStyle(
                                  color: ColorBase.steelBlue,
                                  fontWeight: FontWeight.w200,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Spacer(
                              flex: 2,
                            ),
                          ],
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (_, index) {
                              return RelativeTile(
                                relative: data[index],
                                onDelete: () {
                                  onDeleteRelative(data[index].uuid!);
                                },
                                onEdit: () {
                                  _profileProvider.updateProfileData =
                                      data[index];
                                  Utils.profileNav.currentState
                                      ?.pushNamed(UpdateRelativeForm.routeName);
                                },
                              );
                            },
                          ),
                        ),
                        Container(
                            width: 200,
                            padding: const EdgeInsets.only(top: 16,bottom: 20),
                            child: DefaultButton(
                                text: '+ ' + StringBase.addNewProfile,
                                onTap: () {
                                  Utils.profileNav.currentState
                                      ?.pushNamed(AddRelativeForm.routeName);
                                })),

                      ],
                    );
                  }
                } else if (state is GetRelativeListLoadingState ||
                    state is DeleteRelativeProfileLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(StringBase.noDataFound),
                    ),
                    Container(
                        width: 200,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: DefaultButton(
                            text: '+ ' + StringBase.addNewProfile,
                            onTap: () {
                              Utils.profileNav.currentState
                                  ?.pushNamed(AddRelativeForm.routeName);
                            })),
                  ],
                );
              }),
        ),
      ],
    );
  }

  void onDeleteRelative(String uuid) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 25),
                  child: Text(
                    StringBase.deleteConfirmation,
                    style: TextStyle(
                      color: ColorBase.black,
                      fontWeight: FontWeight.w200,
                      fontSize: 14,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: DefaultButton(
                          text: StringBase.yes,
                          onTap: () {
                            _profileBloc.deleteRelativeProfile(uuid);
                            Utils.mainAppNav.currentState?.pop();
                          }),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: DefaultButton(
                          text: StringBase.no,
                          onTap: () {
                            Utils.mainAppNav.currentState?.pop();
                          }),
                    )
                  ],
                )
              ],
            ),
          );
        });
  }
}
