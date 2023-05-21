part of 'contact_bloc.dart';

abstract class ContactState extends Equatable {}

class ContactInitial extends ContactState {
  @override
  List<Object?> get props => [];
}

class ContactListState extends ContactState {
  ContactListState(this.contactListResponseModel);
  final ContactListResponseModel contactListResponseModel;
  @override
  List<Object?> get props => [contactListResponseModel];
}

class ContactErrorState extends ContactState {
  final dynamic error;
  ContactErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
