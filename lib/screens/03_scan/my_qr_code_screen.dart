import 'package:flutter/material.dart';
import 'package:mcontact/resources/images.dart';
import 'package:mcontact/resources/strings.dart';
import 'package:mcontact/utils/navigation.dart';
import 'package:mcontact/utils/utils.dart';
import 'package:mcontact/widget/common/black_space_widget.dart';
import 'package:mcontact/widget/common/button.dart';
import 'package:mcontact/widget/common/image_avatar_widget.dart';
import 'package:mcontact/widget/contact/contact_card_widget.dart';
import 'package:mcontact/widget/person_details/icon_value_widget.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MyQrCodeScreen extends StatefulWidget {
  const MyQrCodeScreen({super.key});

  @override
  State<MyQrCodeScreen> createState() => _MyQrCodeScreenState();
}

class _MyQrCodeScreenState extends State<MyQrCodeScreen> {
  void popScreen() {
    Navigation.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: Utils.getScreenSize(context).width,
        height: Utils.getScreenSize(context).height,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: Utils.getScreenSize(context).width * 0.2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                child: CommonCardContainer(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 20),
                    child: Column(
                      children: [
                        const VerticalSpace(height: 40),
                        Text(
                          'Ahmed Al Ameen',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: SizedBox(
                            width: Utils.getScreenSize(context).width * 0.5,
                            child: QrImageView(data: 'Please add your profile'),
                          ),
                        ),
                        const IconAndValueWidget(
                          icon: Icons.my_location_rounded,
                          value: 'Tech Lead',
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 6),
                          child: IconAndValueWidget(
                            icon: Icons.phone_in_talk_outlined,
                            value: '666787',
                          ),
                        ),
                        const IconAndValueWidget(
                            icon: Icons.mail, value: 'alameed@example.ecom'),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 6),
                          child: IconAndValueWidget(
                            icon: Icons.business_outlined,
                            value: 'Mannai trading company',
                          ),
                        ),
                        const IconAndValueWidget(
                            icon: Icons.location_on_sharp,
                            value: 'Soura Doha Qatar'),
                        const VerticalSpace(height: 6),
                        const IconAndValueWidget(
                            icon: Icons.public_rounded,
                            value: 'Soura Doha Qatar'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: Utils.getScreenSize(context).width * 0.2 - 22.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ImageAvatar(
                  //   imagePath: Images.logo,
                  //   size: 45,
                  // ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      Images.logo,
                      width: 45,
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 150,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: PrimaryButton(
                  onTap: popScreen,
                  title: Strings.ok,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
