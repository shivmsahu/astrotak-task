part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class GetRelativeListEvent extends ProfileEvent {
  @override
  List<Object?> get props => [];
}

class AddRelativeProfileEvent extends ProfileEvent {
  final AddRelativeRequestModel relativeData;

  const AddRelativeProfileEvent({required this.relativeData});

  @override
  List<Object?> get props => [relativeData];
}

class UpdateRelativeProfileEvent extends ProfileEvent {
  final UpdateRelativeRequestModel relativeData;

  const UpdateRelativeProfileEvent({required this.relativeData});

  @override
  List<Object?> get props => [relativeData];
}

class DeleteRelativeProfileEvent extends ProfileEvent {
  final String uuid;

  const DeleteRelativeProfileEvent({required this.uuid});

  @override
  List<Object?> get props => [uuid];
}

class GetLocationDataEvent extends ProfileEvent {
  final String location;

  const GetLocationDataEvent({required this.location});

  @override
  List<Object?> get props => [location];
}
