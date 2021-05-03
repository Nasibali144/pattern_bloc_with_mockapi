import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_bloc_with_mockapi/blocs/list_contact_cubit.dart';

Widget search({int length, BuildContext context}) {
  return Container(
    height: 45,
    width: double.infinity,
    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
    padding: EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(
      color: Colors.grey[300],
      borderRadius: BorderRadius.circular(22.5),
    ),
    child: TextField(
      onChanged: (text) {
        BlocProvider.of<ListContactCubit>(context).apiSearchList(text);
      },
      decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(Icons.search,),
          hintText: '$length contact',
          hintStyle: TextStyle(fontWeight: FontWeight.w400)
      ),
    ),
  );
}