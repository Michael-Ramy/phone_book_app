import 'dart:async';

import 'package:phone_book_app/models/contact.dart';
import 'package:phone_book_app/utils/storage.dart';

class ContactsHandler {
  static final List<Contact> _contacts = [];

  static final StreamController<List<Contact>>_contactsController = StreamController<List<Contact>>();
  static Stream<List<Contact>> get contactStream => _contactsController.stream;

  static void addContact(Contact contact) async {
    _contacts.add(contact);
    saveContacts(_contacts);
    _contactsController.sink.add(_contacts);
  }

  static void saveContacts(List<Contact> contacts) async {
    Storage.save('contacts', contacts);
  }

  static void loadContacts() async {
    List<dynamic> json = await Storage.getKey('contacts');
    for (var element in json) {
      _contacts.add(Contact.fromJson(element));
    }
    _contactsController.sink.add(_contacts);
  }

  static void editContact(Contact contact) async {
    _contacts.removeWhere((element) => element.id == contact.id);
    _contacts.add(contact);
    saveContacts(_contacts);
    _contactsController.sink.add(_contacts);
  }

  static void deleteContact(Contact contact) async {
    _contacts.remove(contact);
    saveContacts(_contacts);
    _contactsController.sink.add(_contacts);
  }

}