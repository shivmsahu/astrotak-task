import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task_app/modules/profile/controllers/profile_controller.dart';
import 'package:task_app/modules/profile/models/add_relative_request_model.dart';
import 'package:task_app/modules/profile/models/location_response_model.dart';
import 'package:task_app/modules/profile/models/relative_list_response_model.dart';
import 'package:task_app/modules/profile/models/update_relative_request_model.dart';
import 'package:task_app/resources/strings.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  void getRelativeList() {
    add(GetRelativeListEvent());
  }

  void addRelativeProfile(AddRelativeRequestModel data) {
    add(AddRelativeProfileEvent(relativeData: data));
  }

  void updateRelativeProfile(UpdateRelativeRequestModel data) {
    add(UpdateRelativeProfileEvent(relativeData: data));
  }

  void deleteRelativeProfile(String uuid) {
    add(DeleteRelativeProfileEvent(uuid: uuid));
  }

  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) async {
      if (event is GetRelativeListEvent) {
        emit(GetRelativeListLoadingState());
        try {
          var res = await ProfileController.getRelativeList();
          if (!res.success) {
            emit(const GetRelativeListErrorState(
                message: StringBase.somethingWentWrong));
          } else {
            emit(GetRelativeListCompletedState(
                data:
                    RelativeListResponseModel.fromJson(jsonDecode(res.data))));
          }
        } catch (e) {
          emit(GetRelativeListErrorState(message: e.toString()));
        }
      } else if (event is AddRelativeProfileEvent) {
        emit(AddRelativeProfileLoadingState());
        try {
          var res = await ProfileController.addRelativeProfile(
              relativeData: event.relativeData);
          if (!res.success) {
            emit(const AddRelativeProfileErrorState(
                message: StringBase.somethingWentWrong));
          } else {
            emit(AddRelativeProfileCompletedState());
          }
        } catch (e) {
          emit(AddRelativeProfileErrorState(message: e.toString()));
        }
      } else if (event is UpdateRelativeProfileEvent) {
        emit(UpdateRelativeProfileLoadingState());
        try {
          var res = await ProfileController.updateRelativeProfile(
              relativeData: event.relativeData);
          if (!res.success) {
            emit(const UpdateRelativeProfileErrorState(
                message: StringBase.somethingWentWrong));
          } else {
            emit(UpdateRelativeProfileCompletedState());
          }
        } catch (e) {
          emit(UpdateRelativeProfileErrorState(message: e.toString()));
        }
      } else if (event is DeleteRelativeProfileEvent) {
        emit(DeleteRelativeProfileLoadingState());
        try {
          var res =
              await ProfileController.deleteRelativeProfile(uuid: event.uuid);
          if (!res.success) {
            emit(const DeleteRelativeProfileErrorState(
                message: StringBase.somethingWentWrong));
          } else {
            emit(DeleteRelativeProfileCompletedState());
          }
        } catch (e) {
          emit(DeleteRelativeProfileErrorState(message: e.toString()));
        }
      } else if (event is GetLocationDataEvent) {
        emit(GetLocationDataLoadingState());
        try {
          var res =
              await ProfileController.getLocationData(location: event.location);
          if (!res.success) {
            emit(const GetLocationDataErrorState(
                message: StringBase.somethingWentWrong));
          } else {
            emit(GetLocationDataCompletedState(
                data: LocationResponseModel.fromJson(jsonDecode(res.data))));
          }
        } catch (e) {
          emit(GetLocationDataErrorState(message: e.toString()));
        }
      }
    });
  }
}
