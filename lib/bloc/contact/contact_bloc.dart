import 'dart:io';
import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcontact/core/model/contact_details_list_temp.dart';
import 'package:mcontact/core/services/contact/contact_service.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final ContactService contactService;
  ContactListResponseModel? contactListResponseModel;

  ContactBloc({required this.contactService}) : super(ContactInitial()) {
    on<ContactListEvent>(getContactListModel);
  }
  getContactListModel(ContactListEvent event, Emitter emitter) async {
    try {
      contactListResponseModel = await contactService.getContactListModel();
      if (contactListResponseModel != null) {
        emitter(
          ContactListState(contactListResponseModel!),
        );
      }
    } on SocketException {
      emitter(ContactErrorState(e));
    }
  }
}
