import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mcontact/core/model/contact_details_list_temp.dart';
import 'package:mcontact/resources/images.dart';
import 'package:mcontact/resources/strings.dart';
import 'package:mcontact/routes/routes.dart';
import 'package:mcontact/themes/colors.dart';
import 'package:mcontact/utils/navigation.dart';
import 'package:mcontact/utils/utils.dart';
import 'package:mcontact/widget/common/loading_overlay.dart';
import 'package:mcontact/widget/common/text_field.dart';
import 'package:mcontact/widget/contact/contact_card_widget.dart';
import 'package:mcontact/widget/contact/welcome_avatar_widget.dart';
import 'package:mcontact/widget/containers/containers.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  TextEditingController searchController = TextEditingController();

  ContactListResponseModel? contactListResponseModel;

  void fetchData() async {
    var tempString = ContactsList.getContactList();
    contactListResponseModel = contactListResponseModelFromJson(tempString);
  }

  void gotoPersonDetailsScreen(int id) {
    Navigation.pushNamed(
      context,
      Routes.personDetailsScreen,
      {'id': id},
    );
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          snap: true,
          floating: true,
          pinned: true,
          centerTitle: true,
          expandedHeight: 150,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
//TODO: do the opacity
              WelcomeAvatar(
                name: 'Shahid Ahmed',
                filePath: Images.logo,
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 50),
            child: Padding(
              padding: const EdgeInsets.only(left: 26, bottom: 10),
              child: Row(
                children: [
                  Text(
                    Strings.contacts,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: SearchBarWidget(controller: searchController),
              ),
              (contactListResponseModel == null)
                  ? const LoadingOverlay()
                  : Center(
                      child: Wrap(
                        runSpacing: 20,
                        spacing: 20,
                        children: contactListResponseModel!.persons
                            .map(
                              (e) => ContactCardWidget(
                                imagePath: Images.logo,
                                name: e.name,
                                number: e.phoneNumber,
                                email: e.email,
                                isFavorite: e.isFavorite,
                                onTap: gotoPersonDetailsScreen,
                                onTapFavorite: () {},
                                id: e.id,
                              ),
                            )
                            .toList(),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
