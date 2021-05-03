import 'package:equatable/equatable.dart';
import 'package:pattern_bloc_with_mockapi/models/contact_model.dart';

abstract class ListContactState extends Equatable {
  @override
  List<Object> get props => [];
}

class ListContactInit extends ListContactState{}

class ListContactLoading extends ListContactState{}

class ListContactLoaded extends ListContactState{
  final List<Contact> contacts;
  final bool isDeleted;

  ListContactLoaded({this.contacts, this.isDeleted});
}

class ListContactError extends ListContactState{
  final error;

  ListContactError({this.error});
}