import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcontact/bloc/contact/contact_bloc.dart';
import 'package:mcontact/core/model/contact_details_list_temp.dart';
import 'package:mcontact/resources/images.dart';
import 'package:mcontact/resources/strings.dart';
import 'package:mcontact/routes/routes.dart';
import 'package:mcontact/themes/colors.dart';
import 'package:mcontact/utils/navigation.dart';
import 'package:mcontact/widget/common/black_space_widget.dart';
import 'package:mcontact/widget/common/button.dart';
import 'package:mcontact/widget/common/loading_overlay.dart';
import 'package:mcontact/widget/person_details/person_details_card_widget.dart';
import 'package:mcontact/widget/toast/toast.dart';

class PersonDetailsScreen extends StatefulWidget {
  const PersonDetailsScreen({super.key});

  @override
  State<PersonDetailsScreen> createState() => _PersonDetailsScreenState();
}

class _PersonDetailsScreenState extends State<PersonDetailsScreen> {
  var args = {};

  Person? person;

  late ContactBloc contactBloc;

  @override
  void initState() {
    super.initState();
    contactBloc = BlocProvider.of<ContactBloc>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (ModalRoute.of(context)!.settings.arguments != null) {
        args = ModalRoute.of(context)!.settings.arguments as Map;
      }
      if (args["id"] != null) {
        fetchData(int.parse(args["id"].toString()));
      }
    });
  }

  Future<void> fetchData(int id) async {
    var personDetails = contactBloc.contactListResponseModel!;
    for (int i = 0; i < personDetails.persons.length; i++) {
      if (personDetails.persons[i].id == id) {
        person = Person(
          name: personDetails.persons[i].name,
          email: personDetails.persons[i].email,
          phoneNumber: personDetails.persons[i].phoneNumber,
          avatarPath: personDetails.persons[i].avatarPath,
          isFavorite: personDetails.persons[i].isFavorite,
          id: id,
          designation: personDetails.persons[i].designation,
          address: personDetails.persons[i].address,
          companyName: personDetails.persons[i].companyName,
          website: personDetails.persons[i].website,
          qrToken: personDetails.persons[i].qrToken,
        );
      }
    }
    setState(() {});
  }

  void gotoProfileEditScreen(int id) {
    Navigation.pushNamed(context, Routes.profileAddOrUpdateScreen, {'id': id});
  }

  void onTapShare() {
    showToast(Strings.inProgress);
  }

  void onTapDelete() async {
    contactBloc.add(DeleteContactEvent(int.parse(args["id"].toString())));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: contactBloc,
      listener: (context, state) {
        if (state is ContactListState) {
          fetchData(int.parse(args["id"].toString()));
        }
        if (state is DeleteContactState) {
          contactBloc.add(ContactListEvent());
          showToast(Strings.contactDeleted);
          Navigation.pop(context);
        }
      },
      buildWhen: (previous, current) {
        return true;
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                person == null
                    ? const LoadingOverlay()
                    : Column(
                        children: [
                          PersonDetailsCardWidget(
                            person: person!,
                          ),
                          const VerticalSpace(height: 50),
                          Row(
                            children: [
                              Expanded(
                                child: PrimaryButton(
                                  onTap: onTapShare,
                                  title: Strings.shareContact,
                                  bgColor: AppColors.green5b,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Row(
                              children: [
                                Expanded(
                                  child: PrimaryButton(
                                    onTap: () {
                                      gotoProfileEditScreen(person!.id);
                                    },
                                    title: Strings.modify,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: PrimaryButton(
                                  onTap: onTapDelete,
                                  title: Strings.delete,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
              ],
            ),
          ),
        );
      },
    );
  }
}
