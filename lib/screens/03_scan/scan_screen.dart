import 'package:flutter/material.dart';
import 'package:mcontact/core/model/contact_details_list_temp.dart';
import 'package:mcontact/resources/strings.dart';
import 'package:mcontact/routes/routes.dart';
import 'package:mcontact/themes/colors.dart';
import 'package:mcontact/utils/navigation.dart';
import 'package:mcontact/widget/common/black_space_widget.dart';
import 'package:mcontact/widget/common/button.dart';
import 'package:mcontact/widget/toast/toast.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  MobileScannerController mobileScannerController = MobileScannerController();

  void gotoAddOrUpdateContact() {
    Navigation.pushReplacementNamed(context, Routes.profileAddOrUpdateScreen);
  }

  void gotoShowMyQrCodeScreen() {
    Navigation.pushReplacementNamed(context, Routes.myQrCodeScreen);
  }

  void onTapUploadQr() {
    showToast(Strings.inProgress);
  }

  scanQrCode(BarcodeCapture value) async {
    if (value.barcodes.isNotEmpty) {
      if (value.barcodes[0].displayValue != null) {
        var qrString = value.barcodes[0].displayValue!;
        Person? person = personFromJson(qrString);
        if (person != null) {
          Navigation.popAndPushNamed(
            context,
            Routes.profileAddOrUpdateScreen,
            {
              'is_qr': true,
              'person': person,
            },
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MobileScanner(
          controller: mobileScannerController,
          onDetect: (value) {
            scanQrCode(value);
          },
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 100,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: PrimaryButton(
                        onTap: onTapUploadQr,
                        title: Strings.uploadQr,
                        icon: Icons.file_upload_outlined,
                      ),
                    ),
                    const HorizontalSpace(width: 20),
                    Expanded(
                      child: PrimaryButton(
                        onTap: gotoShowMyQrCodeScreen,
                        title: Strings.showMyQr,
                        icon: Icons.qr_code,
                      ),
                    ),
                  ],
                ),
                const VerticalSpace(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: PrimaryButton(
                        onTap: gotoAddOrUpdateContact,
                        title: Strings.addContactManually,
                        icon: Icons.add_box_outlined,
                        bgColor: AppColors.green5b,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
