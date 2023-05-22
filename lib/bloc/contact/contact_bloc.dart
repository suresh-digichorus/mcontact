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
    on<AddOrRemoveFavoriteEvent>(addOrRemoveFavorite);
    on<UpdateContactEvent>(updateContact);
    on<AddContactEvent>(addContact);
    on<DeleteContactEvent>(deleteContact);
  }
  Future<void> getContactListModel(
      ContactListEvent event, Emitter emitter) async {
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

  Future<void> addOrRemoveFavorite(
      AddOrRemoveFavoriteEvent event, Emitter emitter) async {
    try {
      emitter(
        AddOrRemoveFavoriteState(
          await contactService.addOrRemoveFavorite(event.id),
        ),
      );
      contactListResponseModel = await contactService.getContactListModel();
    } on SocketException {
      emitter(ContactErrorState(e));
    }
  }

  Future<void> updateContact(UpdateContactEvent event, Emitter emitter) async {
    try {
      emitter(
        UpdateContactState(
          await contactService.updateContact(
            event.id,
            event.name,
            event.email,
            event.companyName,
            event.website,
            event.designation,
            event.mobileNumber,
            event.address,
            event.imagePath,
          ),
        ),
      );
    } on SocketException {
      emitter(ContactErrorState(e));
    }
  }

  Future<void> addContact(AddContactEvent event, Emitter emitter) async {
    try {
      emitter(
        AddContactState(
          await contactService.addContact(
            event.name,
            event.email,
            event.companyName,
            event.website,
            event.designation,
            event.mobileNumber,
            event.address,
            event.imagePath,
          ),
        ),
      );
      contactListResponseModel = await contactService.getContactListModel();
    } on SocketException {
      emitter(ContactErrorState(e));
    }
  }

  Future<void> deleteContact(DeleteContactEvent event, Emitter emitter) async {
    try {
      emitter(
        DeleteContactState(
          await contactService.deleteContact(event.id),
        ),
      );
      contactListResponseModel = await contactService.getContactListModel();
    } on SocketException {
      emitter(ContactErrorState(e));
    }
  }
}
