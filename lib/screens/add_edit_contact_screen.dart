import 'package:flutter/material.dart';
import 'package:phone_book_app/contacts_handler.dart';
import 'package:phone_book_app/models/contact.dart';
import 'package:phone_book_app/utils/common_widgets.dart';

class AddEditContactScreen extends StatelessWidget {
  final Contact? contact;
  late final bool isEditing;
  AddEditContactScreen({super.key, this.contact}){
    isEditing = contact == null ? false : true;
  }

  final _formKey = GlobalKey<FormState>();
  late final String name;
  late final String number;
  late final String avatar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: isEditing ? 'Edit Contact' : "Add New Contact"),
      body: Center(
        child: Card(
          elevation: 10,
          margin: const EdgeInsets.all(20),
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      initialValue: isEditing ? contact!.name : '',
                      decoration: const InputDecoration(labelText: "Contact's Name"),
                      validator: (value) {
                        if(value == null || value.isEmpty) {
                          return 'Please enter a name';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        name = value!;
                      },
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      initialValue: isEditing ? contact!.number : '',
                      decoration: const InputDecoration(labelText: "Contact's Number"),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if(value == null || value.isEmpty || value.length != 11) {
                          return 'Please enter a valid 11 digit phone number';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        number = value!;
                      },
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      initialValue: isEditing ? contact!.avatar : '',
                      decoration: const InputDecoration(labelText: "Contact's Avatar (URL)"),
                      onSaved: (value) {
                        avatar = value!;
                      },
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Discard',
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent),
                          onPressed: () {
                            if(_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              if(isEditing){
                                contact!.name = name;
                                contact!.number = number;
                                contact!.avatar = avatar;
                               ContactsHandler.editContact(contact!);
                              }
                              else {
                                ContactsHandler.addContact(Contact(
                                    name: name,
                                    number: number
                                ));
                              }
                              Navigator.pop(context);
                            }
                          },
                          child: Text(isEditing? 'Save' : 'Add',
                            style: const TextStyle(
                              color: Colors.white
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

