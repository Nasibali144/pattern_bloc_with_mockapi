import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pattern_bloc_with_mockapi/blocs/list_contact_cubit.dart';
import 'package:pattern_bloc_with_mockapi/models/contact_model.dart';

Widget itemOfList({BuildContext context, Contact contact}) {
  return Slidable(
    actionPane: SlidableDrawerActionPane(),
    actionExtentRatio: 0.2,
    child: ListTile(
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.grey[300]
        ),
        child: Icon(Icons.person, color: Colors.white, size: 30,),
      ),
      title: Text(contact.fullname,),
      subtitle: Text(contact.phoneNumber),
    ),
    actions: <Widget>[
      IconSlideAction(
        caption: 'Update',
        color: Colors.indigo,
        icon: Icons.edit,
        onTap: () {
          //apiUpdateContact(contact);
        },
      ),
    ],
    secondaryActions: <Widget>[
      IconSlideAction(
        caption: 'Delete',
        color: Colors.red,
        icon: Icons.delete,
        onTap: () {
          BlocProvider.of<ListContactCubit>(context).apiContactDelete(contact);
        },
      ),
    ],
  );
}