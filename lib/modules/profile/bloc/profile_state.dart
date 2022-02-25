part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}

class GetRelativeListLoadingState extends ProfileState {
  @override
  List<Object> get props => [];
}

class GetRelativeListErrorState extends ProfileState {
  final String message;

  const GetRelativeListErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class GetRelativeListCompletedState extends ProfileState {
  final RelativeListResponseModel data;

  const GetRelativeListCompletedState({required this.data});

  @override
  List<Object> get props => [data];
}

class AddRelativeProfileLoadingState extends ProfileState {
  @override
  List<Object> get props => [];
}

class AddRelativeProfileErrorState extends ProfileState {
  final String message;

  const AddRelativeProfileErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class AddRelativeProfileCompletedState extends ProfileState {
  @override
  List<Object> get props => [];
}

class UpdateRelativeProfileLoadingState extends ProfileState {
  @override
  List<Object> get props => [];
}

class UpdateRelativeProfileErrorState extends ProfileState {
  final String message;

  const UpdateRelativeProfileErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class UpdateRelativeProfileCompletedState extends ProfileState {
  @override
  List<Object> get props => [];
}

class DeleteRelativeProfileLoadingState extends ProfileState {
  @override
  List<Object> get props => [];
}

class DeleteRelativeProfileErrorState extends ProfileState {
  final String message;

  const DeleteRelativeProfileErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class DeleteRelativeProfileCompletedState extends ProfileState {
  @override
  List<Object> get props => [];
}

class GetLocationDataLoadingState extends ProfileState {
  @override
  List<Object> get props => [];
}

class GetLocationDataErrorState extends ProfileState {
  final String message;

  const GetLocationDataErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class GetLocationDataCompletedState extends ProfileState {
  final LocationResponseModel data;

  const GetLocationDataCompletedState({required this.data});

  @override
  List<Object> get props => [data];
}
