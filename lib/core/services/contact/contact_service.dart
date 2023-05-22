import 'dart:math';

import 'package:mcontact/core/model/contact_details_list_temp.dart';
import 'package:mcontact/utils/local_storage.dart';
import 'package:mcontact/utils/utils.dart';

class ContactService {
  // API Call

  Future<ContactListResponseModel> getContactListModel() async {
    return Future.delayed(const Duration(seconds: 1), () async {
      var contactDetailsString = await LocalStorage.getContactDetails();
      return contactListResponseModelFromJson(contactDetailsString);
    });
  }

  Future<bool> addOrRemoveFavorite(int id) async {
    bool isSuccess = false;
    var contactDetailsString = await LocalStorage.getContactDetails();

    var data = contactListResponseModelFromJson(contactDetailsString);
    for (int i = 0; i < data.persons.length; i++) {
      if (data.persons[i].id == id) {
        data.persons[i].isFavorite = !data.persons[i].isFavorite;
        var jsonString = contactListResponseModelToJson(data);
        await LocalStorage.setContactDetails(jsonString);
        isSuccess = true;
        return isSuccess;
      }
    }
    return isSuccess;
  }

  Future<bool> updateContact(
      int id,
      String name,
      String email,
      String companyName,
      String website,
      String designation,
      String mobileNumber,
      String address,
      String imagePath) async {
    bool isSuccess = false;
    var contactDetailsString = await LocalStorage.getContactDetails();

    var data = contactListResponseModelFromJson(contactDetailsString);
    for (int i = 0; i < data.persons.length; i++) {
      if (data.persons[i].id == id) {
        data.persons[i].email = email;
        data.persons[i].name = name;
        data.persons[i].companyName = companyName;
        data.persons[i].website = website;
        data.persons[i].designation = designation;
        data.persons[i].phoneNumber = mobileNumber;
        data.persons[i].address = address;
        data.persons[i].avatarPath = imagePath;
        var jsonString = contactListResponseModelToJson(data);

        await LocalStorage.setContactDetails(jsonString);
        isSuccess = true;
        return isSuccess;
      }
    }
    return isSuccess;
  }

  Future<bool> addContact(
      String name,
      String email,
      String companyName,
      String website,
      String designation,
      String mobileNumber,
      String address,
      String imagePath) async {
    bool isSuccess = false;
    var contactDetailsString = await LocalStorage.getContactDetails();

    var data = contactListResponseModelFromJson(contactDetailsString);
    var qrToken = Utils.generateRandomString(10);
    var id = data.persons.length + 1;
    data.persons.add(
      Person(
        name: name,
        email: email,
        phoneNumber: mobileNumber,
        avatarPath: imagePath,
        isFavorite: false,
        id: id,
        designation: designation,
        companyName: companyName,
        address: address,
        website: website,
        qrToken: qrToken,
      ),
    );
    var jsonString = contactListResponseModelToJson(data);
    await LocalStorage.setContactDetails(jsonString);
    return isSuccess;
  }

  Future<bool> deleteContact(int id) async {
    bool isSuccess = false;
    var contactDetailsString = await LocalStorage.getContactDetails();

    var data = contactListResponseModelFromJson(contactDetailsString);
    for (int i = 0; i < data.persons.length; i++) {
      if (data.persons[i].id == id) {
        data.persons.removeAt(i);
      }
    }
    var jsonString = contactListResponseModelToJson(data);
    await LocalStorage.setContactDetails(jsonString);
    return isSuccess;
  }
}
