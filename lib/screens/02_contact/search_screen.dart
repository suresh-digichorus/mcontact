import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcontact/bloc/contact/contact_bloc.dart';
import 'package:mcontact/core/model/contact_details_list_temp.dart';
import 'package:mcontact/routes/routes.dart';
import 'package:mcontact/utils/navigation.dart';
import 'package:mcontact/widget/common/text_field.dart';
import 'package:mcontact/widget/contact/contact_card_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  late ContactBloc contactBloc;

  FocusNode searchFocusNode = FocusNode();

  List<Person> searchPersonList = [];
  @override
  void initState() {
    super.initState();
    contactBloc = BlocProvider.of<ContactBloc>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      searchFocusNode.requestFocus();
    });
  }

  void onChang(String value) {
    searchPersonList.clear();
    for (int i = 0;
        i < contactBloc.contactListResponseModel!.persons.length;
        i++) {
      if (contactBloc.contactListResponseModel!.persons[i].name
          .toLowerCase()
          .contains(value.toLowerCase())) {
        searchPersonList.add(contactBloc.contactListResponseModel!.persons[i]);
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

  void onTapFavorite(int id) {
    contactBloc.add(AddOrRemoveFavoriteEvent(id));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SearchBarWidget(
              controller: searchController,
              focusNode: searchFocusNode,
              onChang: onChang,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: Center(
              child: Wrap(
                runSpacing: 20,
                spacing: 20,
                children: searchController.text.isNotEmpty
                    ? searchPersonList
                        .map((e) => ContactCardWidget(
                              imagePath: e.avatarPath,
                              name: e.name,
                              number: e.phoneNumber,
                              email: e.email,
                              isFavorite: e.isFavorite,
                              onTap: gotoPersonDetailsScreen,
                              onTapFavorite: onTapFavorite,
                              id: e.id,
                            ))
                        .toList()
                    : contactBloc.contactListResponseModel!.persons.map(
                        (e) {
                          return ContactCardWidget(
                            imagePath: e.avatarPath,
                            name: e.name,
                            number: e.phoneNumber,
                            email: e.email,
                            isFavorite: e.isFavorite,
                            onTap: gotoPersonDetailsScreen,
                            onTapFavorite: onTapFavorite,
                            id: e.id,
                          );
                        },
                      ).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
