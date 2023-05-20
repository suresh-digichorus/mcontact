import 'package:flutter/material.dart';
import 'package:mcontact/core/model/contact_details_list_temp.dart';
import 'package:mcontact/resources/images.dart';
import 'package:mcontact/resources/strings.dart';
import 'package:mcontact/routes/routes.dart';
import 'package:mcontact/themes/colors.dart';
import 'package:mcontact/utils/navigation.dart';
import 'package:mcontact/widget/common/loading_overlay.dart';
import 'package:mcontact/widget/common/text_field.dart';
import 'package:mcontact/widget/contact/contact_card_widget.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  ContactListResponseModel? contactListResponseModel;

  List<Person> person = [];

  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    var contactList = ContactsList.getContactList();

    contactListResponseModel = contactListResponseModelFromJson(contactList);
    for (int i = 0; i < contactListResponseModel!.persons.length; i++) {
      if (contactListResponseModel!.persons[i].isFavorite) {
        person.add(contactListResponseModel!.persons[i]);
      }
    }
    setState(() {});
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
          actions: const [],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('data'),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 50),
            child: Padding(
              padding: const EdgeInsets.only(left: 26, bottom: 10),
              child: Row(
                children: [
                  Text(
                    Strings.favorite,
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
              (person.isEmpty)
                  ? const LoadingOverlay()
                  : Center(
                      child: Wrap(
                        runSpacing: 20,
                        spacing: 20,
                        children: person
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
