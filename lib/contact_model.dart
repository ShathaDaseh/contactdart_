import 'package:flutter/material.dart';
import 'contact.dart';

class ContactModel extends ChangeNotifier {
  final List<Contact> _contacts = [];

  List<Contact> get contacts => List.unmodifiable(_contacts);
// add contact to list
  void addContact(Contact contact) {
    _contacts.add(contact);
    notifyListeners();
  }

  void editContact(int index, Contact newContact) {
    _contacts[index] = newContact;
    notifyListeners();
  }

  void deleteContact(int index) {
    _contacts.removeAt(index);
    notifyListeners();
  }
}
