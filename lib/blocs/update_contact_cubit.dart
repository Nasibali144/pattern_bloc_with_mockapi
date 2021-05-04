import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_bloc_with_mockapi/blocs/update_contact_state.dart';
import 'package:pattern_bloc_with_mockapi/models/contact_model.dart';
import 'package:pattern_bloc_with_mockapi/services/http_service.dart';

class UpdateContactCubit extends Cubit<UpdateContactState> {
  UpdateContactCubit() : super(UpdateContactInit());

  Future<void> apiUpdateContact(BuildContext context, Contact contact) async{
    emit(UpdateContactLoading());
    String response = await Network.PUT(Network.API_UPDATE + contact.id.toString(), Network.paramsUpdate(contact));
    if(response != null) {
      emit(UpdateContactLoaded(isUpdated: true));
      Navigator.pop(context, response);
    } else {
      emit(UpdateContactError(error: "Couldn't update a contact"));
    }
  }
}