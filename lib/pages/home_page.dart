import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_bloc_with_mockapi/blocs/list_contact_cubit.dart';
import 'package:pattern_bloc_with_mockapi/blocs/list_contact_state.dart';
import 'package:pattern_bloc_with_mockapi/models/contact_model.dart';
import 'package:pattern_bloc_with_mockapi/views/view_of_home.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Contact> items = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ListContactCubit>(context).apiListContact();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
      ),
      body: BlocBuilder<ListContactCubit, ListContactState>(
        builder: (context, state) {
          if(state is ListContactError) {
            return viewOfHome(context, items, true);
          }
          if(state is ListContactLoaded) {
            items = state.contacts;
            return viewOfHome(context, items, false);
          }

          return viewOfHome(context, items, true);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
          BlocProvider.of<ListContactCubit>(context).apiCreateContact(context);
        },
      ),
    );
  }
}
