import 'package:mcontact/core/model/contact_details_list_temp.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future<void> setAppOpened() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('is_app_open', true);
  }

  static Future<bool> getAppOpened() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('is_app_open') ?? false;
  }

  static Future<void> setContactDetails(String contactDetails) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('contact_list', contactDetails);
  }

  static Future<String> getContactDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('contact_list') ?? '';
  }

  static Future<void> initialSetContactDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var contactDetails = ContactsList.getContactList();
    prefs.setString('contact_list', contactDetails);
  }
}
