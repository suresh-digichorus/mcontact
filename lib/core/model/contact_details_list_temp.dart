import 'dart:convert';

class ContactsList {
  static String getContactList() => '''{
        "persons": [
          {
            "id":1,
            "qr_token":"eyijeoi38u33h83",
            "name": "John Doe",
            "email": "johndoe@example.com",
            "phone_number": "555-1234",
            "avatar_path": "",
            "is_favorite": true,
            "designation":"Accountant",
            "company_name":"Mannai trading company",
            "address":"Manasoura, Doha Qatar",
            "website":"www.mannai.com"
          },
          {
            "id":2,
            "qr_token":"eyijewwi38u33h83",
            "name": "Jane Smith",
            "email": "janesmith@example.com",
            "phone_number": "555-5678",
            "avatar_path": "",
            "is_favorite": false,
            "designation":"Software engineer",
            "company_name":"Mannai trading company",
            "address":"Manasoura, Doha Qatar",
            "website":"www.mannai.com"

          },
          {
            "id":3,
            "qr_token":"eyijewwi38u3383",
            "name": "David Johnson",
            "email": "davidjohnson@example.com",
            "phone_number": "555-9012",
            "avatar_path": "",
            "is_favorite": true,
            "designation":"Sales",
            "company_name":"Mannai trading company",
            "address":"Manasoura, Doha Qatar",
            "website":"www.mannai.com"

          },
          {
            "id":4,
            "qr_token":"eyijewwi38u33h8fj3",
            "name": "Sarah Williams",
            "email": "sarahwilliams@example.com",
            "phone_number": "555-3456",
            "avatar_path": "",
            "is_favorite": false,
            "designation":"Bussiness Development",
            "company_name":"Mannai trading company",
            "address":"Manasoura, Doha Qatar",
            "website":"www.mannai.com"

          },
          {
            "id":5,
            "qr_token":"eyijewwi3jd83",
            "name": "Michael Brown",
            "email": "michaelbrown@example.com",
            "phone_number": "555-7890",
            "avatar_path": "",
            "is_favorite": true,
            "designation":"Accountant",
            "company_name":"Mannai trading company",
            "address":"Manasoura, Doha Qatar",
            "website":"www.mannai.com"

          },
          {
            "id":6,
            "qr_token":"eyisnsewwi38u33h83",
            "name": "Emily Davis",
            "email": "emilydavis@example.com",
            "phone_number": "555-2345",
            "avatar_path": "",
            "is_favorite": false,
            "designation":"Tech Lead",
            "company_name":"Mannai trading company",
            "address":"Manasoura, Doha Qatar",
            "website":"www.mannai.com"

          },
          {
            "id":7,
            "qr_token":"eyijewwauaq38u33h83",
            "name": "Robert Wilson",
            "email": "robertwilson@example.com",
            "phone_number": "555-6789",
            "avatar_path": "",
            "is_favorite": false,
            "designation":"QA",
            "company_name":"Mannai trading company",
            "address":"Manasoura, Doha Qatar",
            "website":"www.mannai.com"

          },
          {
            "id":8,
            "qr_token":"eyijewwi18u33h83",
            "name": "Olivia Taylor",
            "email": "oliviataylor@example.com",
            "phone_number": "555-0123",
            "avatar_path": "",
            "is_favorite": true,
            "designation":"Manager",
            "company_name":"Mannai trading company",
            "address":"Manasoura, Doha Qatar",
            "website":"www.mannai.com"

          }
        ]
      }''';
}

ContactListResponseModel contactListResponseModelFromJson(String str) =>
    ContactListResponseModel.fromJson(json.decode(str));

String contactListResponseModelToJson(ContactListResponseModel data) =>
    json.encode(data.toJson());

Person? personFromJson(String str) => Person.fromJson(json.decode(str));

class ContactListResponseModel {
  List<Person> persons;

  ContactListResponseModel({
    required this.persons,
  });

  factory ContactListResponseModel.fromJson(Map<String, dynamic> json) =>
      ContactListResponseModel(
        persons:
            List<Person>.from(json["persons"].map((x) => Person.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "persons": List<dynamic>.from(persons.map((x) => x.toJson())),
      };
}

class Person {
  String name;
  String email;
  String phoneNumber;
  String avatarPath;
  bool isFavorite;
  int id;
  String designation;
  String companyName;
  String address;
  String website;
  String qrToken;

  Person({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.avatarPath,
    required this.isFavorite,
    required this.id,
    required this.designation,
    required this.companyName,
    required this.address,
    required this.website,
    required this.qrToken,
  });

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        avatarPath: json["avatar_path"],
        isFavorite: json["is_favorite"],
        id: json["id"],
        designation: json["designation"],
        companyName: json["company_name"],
        address: json["address"],
        website: json["website"],
        qrToken: json["qr_token"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone_number": phoneNumber,
        "avatar_path": avatarPath,
        "is_favorite": isFavorite,
        "id": id,
        "designation": designation,
        "company_name": companyName,
        "address": address,
        "website": website,
        "qr_token": qrToken,
      };
}
