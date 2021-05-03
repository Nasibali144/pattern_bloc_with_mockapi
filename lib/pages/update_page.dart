import 'package:flutter/material.dart';
import 'package:pattern_bloc_with_mockapi/models/contact_model.dart';
import 'package:pattern_bloc_with_mockapi/services/http_service.dart';

class UpdatePage extends StatefulWidget {

  final Contact contact;
  UpdatePage({this.contact});

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  bool isLoading = false;
  var fullnameController = TextEditingController();
  var phoneNumberController = TextEditingController();

  void getOldContact() {
    setState(() {
      fullnameController.text = widget.contact.fullname;
      phoneNumberController.text = widget.contact.phoneNumber;
    });
  }

  Future<void> apiUpdateContact() async{
    setState(() {
      isLoading = true;
    });
    String fullname = fullnameController.text.trim().toString();
    String phoneNumber = phoneNumberController.text.trim().toString();
    Contact contact = Contact(fullname: fullname, phoneNumber: phoneNumber, id: widget.contact.id);

    String response = await Network.PUT(Network.API_UPDATE + contact.id.toString(), Network.paramsUpdate(contact));
    setState(() {
      isLoading = false;
    });
    Navigator.pop(context, response);
  }

  @override
  void initState() {
    super.initState();
    getOldContact();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Contact', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
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
                    child: Text("Update", style: TextStyle(color: Colors.white, fontSize: 20)),
                    onPressed: apiUpdateContact,
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
