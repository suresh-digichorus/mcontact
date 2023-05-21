import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcontact/bloc/contact/contact_bloc.dart';
import 'package:mcontact/resources/images.dart';
import 'package:mcontact/resources/strings.dart';
import 'package:mcontact/routes/routes.dart';
import 'package:mcontact/utils/navigation.dart';
import 'package:mcontact/widget/common/loading_overlay.dart';
import 'package:mcontact/widget/common/sliver_app_bar.dart';
import 'package:mcontact/widget/common/text_field.dart';
import 'package:mcontact/widget/contact/contact_card_widget.dart';
import 'package:mcontact/widget/toast/toast.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  late ContactBloc contactBloc;
  @override
  void initState() {
    super.initState();
    contactBloc = BlocProvider.of<ContactBloc>(context, listen: false);
    fetchData();
  }

  TextEditingController searchController = TextEditingController();

  ScrollController scrollController = ScrollController();

  void fetchData() async {
    contactBloc.add(ContactListEvent());
  }

  void gotoPersonDetailsScreen(int id) {
    Navigation.pushNamed(
      context,
      Routes.personDetailsScreen,
      {'id': id},
    );
  }

  void onTapFavorite() {
    showToast(Strings.inProgress);
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      controller: scrollController,
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        CommonSliverAppBar(
          scrollController: scrollController,
          name: 'Shahid Ahmed',
          title: Strings.contacts,
          imagePath: Images.logo,
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
              BlocConsumer(
                bloc: contactBloc,
                listener: (context, state) {},
                buildWhen: (previous, current) {
                  return true;
                },
                builder: (BuildContext context, ContactState contatctstate) =>
                    (contactBloc.contactListResponseModel == null)
                        ? const LoadingOverlay()
                        : Center(
                            child: Wrap(
                              runSpacing: 20,
                              spacing: 20,
                              children:
                                  contactBloc.contactListResponseModel!.persons
                                      .map(
                                        (e) => ContactCardWidget(
                                          imagePath: Images.logo,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
