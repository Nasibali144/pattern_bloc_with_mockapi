import 'package:flutter/material.dart';
import 'package:pattern_bloc_with_mockapi/models/contact_model.dart';
import 'package:pattern_bloc_with_mockapi/views/search_of_home.dart';

import 'item_of_contact.dart';

Widget viewOfHome(BuildContext context, List<Contact> items, bool isLoading) {
  return Stack(
    children: [
      Container(
        width: double.infinity,
        child: Column(
          children: [
            //#search
            search(length: items.length, context: context),

            //#contacts
            Expanded(
              child: Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return itemOfList(context: context, contact: items[index]);
                  },
                ),
              ),
            )
          ],
        ),
      ),

      isLoading ? Center(
        child: CircularProgressIndicator(),
      ) : SizedBox.shrink(),
    ],
  );
}