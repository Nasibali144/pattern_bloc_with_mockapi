import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_bloc_with_mockapi/blocs/list_contact_state.dart';
import 'package:pattern_bloc_with_mockapi/models/contact_model.dart';
import 'package:pattern_bloc_with_mockapi/pages/create_page.dart';
import 'package:pattern_bloc_with_mockapi/pages/update_page.dart';
import 'package:pattern_bloc_with_mockapi/services/http_service.dart';

class ListContactCubit extends Cubit<ListContactState> {
  ListContactCubit() : super(ListContactInit());

  Future<void> apiListContact() async {
    emit(ListContactLoading());
    String response =
        await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if (response != null) {
      emit(ListContactLoaded(contacts: Network.parsePostList(response)));
    } else {
      emit(ListContactError(error: "Couldn't fetch contacts"));
    }
  }

  Future<void> apiSearchList(String text) async {
    emit(ListContactLoading());
    String response = '';
    if (text.isEmpty) {
      response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    } else {
      response = await Network.SEARCH(
        text.toString(),
      );
    }
    if (response != null) {
      emit(ListContactLoaded(contacts: Network.parsePostList(response)));
    } else {
      emit(ListContactError(error: "No data"));
    }
  }

  Future<void> apiContactDelete(Contact contact) async {
    emit(ListContactLoading());
    String response = await Network.DEL(
        Network.API_DELETE + contact.id, Network.paramsEmpty());
    if (response != null) {
      apiListContact();
    } else {
      emit(ListContactError(error: "Couldn't delete contact"));
    }
  }

  Future apiCreateContact(BuildContext context) async {
    String response = await Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePage()));
    if (response != null) apiListContact();
  }

  Future apiUpdateContact(BuildContext context, Contact contact) async {
    String response = await Navigator.push(context, MaterialPageRoute(builder: (context) => UpdatePage(contact: contact,),),);
    if (response != null) apiListContact();
  }
}
