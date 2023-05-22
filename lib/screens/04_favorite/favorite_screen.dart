import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcontact/bloc/contact/contact_bloc.dart';
import 'package:mcontact/core/model/contact_details_list_temp.dart';
import 'package:mcontact/resources/images.dart';
import 'package:mcontact/resources/strings.dart';
import 'package:mcontact/routes/routes.dart';
import 'package:mcontact/utils/navigation.dart';
import 'package:mcontact/widget/common/loading_overlay.dart';
import 'package:mcontact/widget/common/sliver_app_bar.dart';
import 'package:mcontact/widget/common/text_field.dart';
import 'package:mcontact/widget/contact/contact_card_widget.dart';
import 'package:mcontact/widget/toast/toast.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  ContactListResponseModel? contactListResponseModel;

  List<Person> person = [];

  TextEditingController searchController = TextEditingController();

  ScrollController scrollController = ScrollController();

  late ContactBloc contactBloc;

  @override
  void initState() {
    super.initState();
    contactBloc = BlocProvider.of<ContactBloc>(context, listen: false);

    fetchData();
  }

  Future<void> fetchData() async {
    person.clear();
    contactListResponseModel = contactBloc.contactListResponseModel;
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

  void onTapFavorite(int id) {
    contactBloc.add(AddOrRemoveFavoriteEvent(id));
  }

  void searhcOnTap() {
    Navigation.pushNamed(context, Routes.searchScreen);
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      controller: scrollController,
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        CommonSliverAppBar(
          scrollController: scrollController,
          name: 'Shahid Ahmed',
          title: Strings.favorite,
          imagePath: Images.logo,
        )
      ],
      body: BlocConsumer(
        bloc: contactBloc,
        listener: (context, state) {
          if (state is AddOrRemoveFavoriteState) {
            contactBloc.add(ContactListEvent());
            showToast(Strings.updated);
          }
          if (state is ContactListState) {
            fetchData();
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Stack(
                      children: [
                        SearchBarWidget(controller: searchController),
                        Positioned(
                          left: 0,
                          right: 0,
                          top: 0,
                          bottom: 0,
                          child: GestureDetector(
                            onTap: () {
                              searhcOnTap();
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  (contactListResponseModel == null)
                      ? const LoadingOverlay()
                      : person.isEmpty
                          ? const Center(child: Text('No favorite contact'))
                          : Center(
                              child: Wrap(
                                runSpacing: 20,
                                spacing: 20,
                                children: person
                                    .map(
                                      (e) => ContactCardWidget(
                                        imagePath: e.avatarPath,
                                        name: e.name,
                                        number: e.phoneNumber,
                                        email: e.email,
                                        isFavorite: e.isFavorite,
                                        onTap: gotoPersonDetailsScreen,
                                        onTapFavorite: onTapFavorite,
                                        id: e.id,
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
