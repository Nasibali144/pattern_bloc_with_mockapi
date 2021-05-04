import 'package:equatable/equatable.dart';

abstract class CreateContactState extends Equatable {
  @override
  List<Object> get props => [];
}

class CreateContactInit extends CreateContactState {}

class CreateContactLoading extends CreateContactState {}

class CreateContactLoaded extends CreateContactState{
  final bool isCreated;
  CreateContactLoaded({this.isCreated});
}

class CreateContactError extends CreateContactState {
  final error;
  CreateContactError({this.error});
}