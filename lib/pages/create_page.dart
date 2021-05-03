import 'package:flutter/material.dart';
import 'package:pattern_bloc_with_mockapi/models/contact_model.dart';
import 'package:pattern_bloc_with_mockapi/services/http_service.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  bool isLoading = false;
  var fullnameController = TextEditingController();
  var phoneNumberController = TextEditingController();

  Future<void> apiCreateContact() async{
    setState(() {
      isLoading = true;
    });
    String fullname = fullnameController.text.trim().toString();
    String phoneNumber = phoneNumberController.text.trim().toString();
    Contact contact = Contact(fullname: fullname, phoneNumber: phoneNumber);

    String response = await Network.POST(Network.API_CREATE, Network.paramsCreate(contact));
    setState(() {
      isLoading = false;
    });
    Navigator.pop(context, response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Contact', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
      ),
      body: Stack(
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
                    onPressed: apiCreateContact,
                  ),
                )
              ],
            ),
          ),

          isLoading ? Center(
            child: CircularProgressIndicator(),
          ) : SizedBox.shrink()
        ],
      ),
    );
  }
}
