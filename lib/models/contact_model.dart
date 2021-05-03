class Contact {
  String id;
  String phoneNumber;
  String fullname;

  Contact({this.id, this.phoneNumber, this.fullname});

  Contact.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phoneNumber = json['phone_number'];
    fullname = json['fullname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phone_number'] = this.phoneNumber;
    data['fullname'] = this.fullname;
  }
}
