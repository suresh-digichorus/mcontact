import 'dart:convert';

class ContactsList {
  static String getContactList() => '''{
        "persons": [
          {
            "id":1,
            "name": "John Doe",
            "email": "johndoe@example.com",
            "phone_number": "555-1234",
            "avatar_path": "/avatars/johndoe.jpg",
            "is_favorite": true,
            "designation":"Accountant",
            "company_name":"Mannai trading company",
            "address":"Manasoura, Doha Qatar",
            "website":"www.mannai.com"
          },
          {
            "id":2,
            "name": "Jane Smith",
            "email": "janesmith@example.com",
            "phone_number": "555-5678",
            "avatar_path": "/avatars/janesmith.jpg",
            "is_favorite": false,
            "designation":"Software engineer",
            "company_name":"Mannai trading company",
            "address":"Manasoura, Doha Qatar",
            "website":"www.mannai.com"

          },
          {
            "id":3,
            "name": "David Johnson",
            "email": "davidjohnson@example.com",
            "phone_number": "555-9012",
            "avatar_path": "/avatars/davidjohnson.jpg",
            "is_favorite": true,
            "designation":"Sales",
            "company_name":"Mannai trading company",
            "address":"Manasoura, Doha Qatar",
            "website":"www.mannai.com"

          },
          {
            "id":4,
            "name": "Sarah Williams",
            "email": "sarahwilliams@example.com",
            "phone_number": "555-3456",
            "avatar_path": "/avatars/sarahwilliams.jpg",
            "is_favorite": false,
            "designation":"Bussiness Development",
            "company_name":"Mannai trading company",
            "address":"Manasoura, Doha Qatar",
            "website":"www.mannai.com"

          },
          {
            "id":5,
            "name": "Michael Brown",
            "email": "michaelbrown@example.com",
            "phone_number": "555-7890",
            "avatar_path": "/avatars/michaelbrown.jpg",
            "is_favorite": true,
            "designation":"Accountant",
            "company_name":"Mannai trading company",
            "address":"Manasoura, Doha Qatar",
            "website":"www.mannai.com"

          },
          {
            "id":6,
            "name": "Emily Davis",
            "email": "emilydavis@example.com",
            "phone_number": "555-2345",
            "avatar_path": "/avatars/emilydavis.jpg",
            "is_favorite": false,
            "designation":"Tech Lead",
            "company_name":"Mannai trading company",
            "address":"Manasoura, Doha Qatar",
            "website":"www.mannai.com"

          },
          {
            "id":7,
            "name": "Robert Wilson",
            "email": "robertwilson@example.com",
            "phone_number": "555-6789",
            "avatar_path": "/avatars/robertwilson.jpg",
            "is_favorite": false,
            "designation":"QA",
            "company_name":"Mannai trading company",
            "address":"Manasoura, Doha Qatar",
            "website":"www.mannai.com"

          },
          {
            "id":8,
            "name": "Olivia Taylor",
            "email": "oliviataylor@example.com",
            "phone_number": "555-0123",
            "avatar_path": "/avatars/oliviataylor.jpg",
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
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone_number": phoneNumber,
        "avatar_path": avatarPath,
        "is_favorite": isFavorite,
      };
}
