import 'package:mcontact/core/model/contact_details_list_temp.dart';

class ContactService {
  // API Call

  Future<ContactListResponseModel> getContactListModel() async {
    return Future.delayed(const Duration(seconds: 1), () async {
      var response = ContactsList.getContactList();
      return contactListResponseModelFromJson(response);
    });
  }
}
