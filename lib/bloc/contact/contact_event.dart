part of 'contact_bloc.dart';

abstract class ContactEvent extends Equatable {
  const ContactEvent();
}

class ContactInitialEvent extends ContactEvent {
  @override
  List<Object?> get props => [];
}

class ContactListEvent extends ContactEvent {
  @override
  List<Object?> get props => [];
}

class AddOrRemoveFavoriteEvent extends ContactEvent {
  final int id;
  const AddOrRemoveFavoriteEvent(this.id);
  @override
  List<Object?> get props => [id];
}

class UpdateContactEvent extends ContactEvent {
  final String email,
      name,
      companyName,
      website,
      designation,
      mobileNumber,
      address,
      imagePath;
  final int id;
  const UpdateContactEvent(
      this.id,
      this.email,
      this.name,
      this.companyName,
      this.website,
      this.designation,
      this.mobileNumber,
      this.address,
      this.imagePath);
  @override
  List<Object?> get props => [
        id,
        email,
        name,
        companyName,
        website,
        designation,
        mobileNumber,
        address,
        imagePath,
      ];
}

class AddContactEvent extends ContactEvent {
  final String email,
      name,
      companyName,
      website,
      designation,
      mobileNumber,
      address,
      imagePath;
  const AddContactEvent(this.email, this.name, this.companyName, this.website,
      this.designation, this.mobileNumber, this.address, this.imagePath);
  @override
  List<Object?> get props => [
        email,
        name,
        companyName,
        website,
        designation,
        mobileNumber,
        address,
        imagePath
      ];
}

class DeleteContactEvent extends ContactEvent {
  final int id;
  const DeleteContactEvent(this.id);
  @override
  List<Object?> get props => [id];
}
