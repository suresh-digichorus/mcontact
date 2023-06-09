import 'package:flutter/material.dart';
import 'package:mcontact/resources/images.dart';
import 'package:mcontact/routes/routes.dart';
import 'package:mcontact/utils/local_storage.dart';
import 'package:mcontact/utils/navigation.dart';
import 'package:mcontact/utils/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initData();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      fetchData();
    });
  }

  initData() async {
    var isAppOpened = await LocalStorage.getAppOpened();
    if (!isAppOpened) {
      LocalStorage.initialSetContactDetails();
      LocalStorage.setAppOpened();
    }
  }

  Future<void> fetchData() async {
    Future.delayed(const Duration(seconds: 1), () {
      gotoContactScreen();
    });
  }

  gotoContactScreen() {
    Navigation.pushAndRemoveUntil(context, Routes.contactScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.asset(
          Images.logo,
          width: Utils.getScreenSize(context).width * 0.35,
        ),
      ),
    );
  }
}
