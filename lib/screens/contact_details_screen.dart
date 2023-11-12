import 'package:flutter/material.dart';
import 'package:phone_book_app/contacts_handler.dart';
import 'package:phone_book_app/models/contact.dart';
import 'package:phone_book_app/screens/add_edit_contact_screen.dart';
import 'package:phone_book_app/utils/common_widgets.dart';

class ContactDetailsScreen extends StatelessWidget {
  final Contact contact;
  const ContactDetailsScreen({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Contact's Details",),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 50),
          elevation: 20,
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  contact.avatar != null && contact.avatar!.isNotEmpty ?
                      CircleAvatar(backgroundImage: NetworkImage(contact.avatar!),) :
                      const CircleAvatar(backgroundColor: Colors.white, child: Icon(Icons.person),),
                  const SizedBox(height: 15,),
                  Text(contact.name),
                  const SizedBox(height: 10,),
                  Text(contact.number),
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                        onPressed: () {
                          ContactsHandler.deleteContact(contact);
                          Navigator.pop(context);
                        },
                        child: const Text('Delete',
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                        onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => AddEditContactScreen(contact: contact))
                            );
                        },
                        child: const Text('Edit',
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
