import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_bloc_with_mockapi/blocs/create_contact_state.dart';
import 'package:pattern_bloc_with_mockapi/models/contact_model.dart';
import 'package:pattern_bloc_with_mockapi/services/http_service.dart';

class CreateContactCubit extends Cubit<CreateContactState> {
  CreateContactCubit() : super(CreateContactInit());

  Future<void> apiCreateContact(BuildContext context, Contact contact) async{
    emit(CreateContactLoading());
    String response = await Network.POST(Network.API_CREATE, Network.paramsCreate(contact));
    if(response != null) {
      emit(CreateContactLoaded(isCreated: true));
      // Navigator.pop(context, response);
    } else {
      emit(CreateContactError(error: "Couldn't create contact"));
    }
  }
}