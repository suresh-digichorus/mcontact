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

class AddOrRemoveFavoriteState extends ContactState {
  final bool success;
  AddOrRemoveFavoriteState(this.success);
  @override
  List<Object?> get props => [success];
}

class UpdateContactState extends ContactState {
  final bool isUpdated;
  UpdateContactState(this.isUpdated);
  @override
  List<Object?> get props => [isUpdated];
}

class AddContactState extends ContactState {
  final bool isAddedd;
  AddContactState(this.isAddedd);
  @override
  List<Object?> get props => [isAddedd];
}


class DeleteContactState extends ContactState {
  final bool isDeleted;
  DeleteContactState(this.isDeleted);
  @override
  List<Object?> get props => [isDeleted];
}
