import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:phone_book_app/contacts_handler.dart';
import 'package:phone_book_app/models/contact.dart';
import 'package:phone_book_app/screens/add_edit_contact_screen.dart';
import 'package:phone_book_app/screens/contact_details_screen.dart';
import 'package:phone_book_app/utils/common_widgets.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key,});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {

  @override
  void initState() {
    super.initState();
    ContactsHandler.loadContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Contacts"),
      body: StreamBuilder<List<Contact>>(
        stream: ContactsHandler.contactStream,
        initialData: const [],
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if(snapshot.hasError) {
            /// TODO: Handling error logic
            log(snapshot.error.toString());
            return const Center(child: Text(''));
          }
          List<Contact> contacts = snapshot.data!;
          return ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              Contact contact = contacts[index];
              return ListTile(
                leading: contact.avatar != null ?
                CircleAvatar(
                  backgroundImage: NetworkImage(contact.avatar!),
                ) : const CircleAvatar(
                  child: Icon(Icons.person),
                ),
                title: Text(contact.name),
                subtitle: Text(contact.number),
                onTap: () {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ContactDetailsScreen(contact: contact)));
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddEditContactScreen())
          );
        },
      ),
    );
  }
}
