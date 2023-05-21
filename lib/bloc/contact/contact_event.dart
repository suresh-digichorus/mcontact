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
