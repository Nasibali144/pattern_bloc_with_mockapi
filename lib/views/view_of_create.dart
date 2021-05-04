import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_bloc_with_mockapi/blocs/create_contact_cubit.dart';
import 'package:pattern_bloc_with_mockapi/models/contact_model.dart';

Widget viewOfCreate(BuildContext context, TextEditingController fullnameController, TextEditingController phoneNumberController, bool isLoading) {
  return Stack(
    children: [
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 55,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blueAccent, width: 2)
              ),
              child: TextField(
                controller: fullnameController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey),
                    hintText: 'Fullname',
                    icon: Icon(Icons.person)
                ),
                keyboardType: TextInputType.name,
                autofocus: true,
              ),
            ),

            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 55,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blueAccent, width: 2)
              ),
              child: TextField(
                controller: phoneNumberController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey),
                    hintText: 'Phone Number',
                    icon: Icon(Icons.phone)
                ),
                keyboardType: TextInputType.phone,
                autofocus: true,
              ),
            ),

            Container(
              height: 55,
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: TextButton(
                child: Text("Save", style: TextStyle(color: Colors.white, fontSize: 20)),
                onPressed: () {
                  Contact contact = Contact(fullname: fullnameController.text.toString(), phoneNumber: phoneNumberController.text.toString());
                  BlocProvider.of<CreateContactCubit>(context).apiCreateContact(context, contact);
                },
              ),
            )
          ],
        ),
      ),

      isLoading ? Center(
        child: CircularProgressIndicator(),
      ) : SizedBox.shrink()
    ],
  );
}