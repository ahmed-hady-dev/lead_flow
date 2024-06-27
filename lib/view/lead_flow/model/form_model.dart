class FormModel {
  int? id;
  String? firstName;
  String? familyName;
  int? age;
  String? gender;
  String? nationality;
  String? whatsapp;
  String? email;
  String? difficulties;
  String? description;
  String? subject;
  String? userIp;

  FormModel({
    this.id,
    this.firstName,
    this.familyName,
    this.age,
    this.gender,
    this.nationality,
    this.whatsapp,
    this.email,
    this.difficulties,
    this.description,
    this.subject,
    this.userIp,
  });
  FormModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    firstName = json['first_name']?.toString();
    familyName = json['family_name']?.toString();
    age = json['age']?.toInt();
    gender = json['gender']?.toString();
    nationality = json['nationality']?.toString();
    whatsapp = json['whatsapp']?.toString();
    email = json['email']?.toString();
    difficulties = json['difficulties']?.toString();
    description = json['description']?.toString();
    subject = json['subject']?.toString();
    userIp = json['user_ip']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['family_name'] = familyName;
    data['age'] = age;
    data['gender'] = gender;
    data['nationality'] = nationality;
    data['whatsapp'] = whatsapp;
    data['email'] = email;
    data['difficulties'] = difficulties;
    data['description'] = description;
    data['subject'] = subject;
    data['user_ip'] = userIp;
    return data;
  }
}
