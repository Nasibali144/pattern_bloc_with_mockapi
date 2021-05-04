import 'package:equatable/equatable.dart';

abstract class UpdateContactState extends Equatable {
  @override
  List<Object> get props => [];
}

class UpdateContactInit extends UpdateContactState {}

class UpdateContactLoading extends UpdateContactState {}

class UpdateContactLoaded extends UpdateContactState {
  final bool isUpdated;
  UpdateContactLoaded({this.isUpdated});
}

class UpdateContactError extends UpdateContactState{
  final error;
  UpdateContactError({this.error});
}