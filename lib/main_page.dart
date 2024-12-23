import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'contact_model.dart';
import 'contact.dart';
import 'add_edit_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: Consumer<ContactModel>(
        builder: (context, contactModel, child) {
          // Display a list of contacts
          return ListView.builder(
            itemCount: contactModel.contacts.length,
            itemBuilder: (context, index) {
              final contact = contactModel.contacts[index];
              return ListTile(
                //circle avatar
                leading: CircleAvatar(
                  child: Text(contact.name[0]),
                ),
                //title name contact and trailing icon delete
                title: Text(contact.name),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    contactModel.deleteContact(index);
                  },
                ),
                //onTap show dialog contact info 
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Contact Info'),
                      content: Text(
                        'Name: ${contact.name}\nPhone: ${contact.phone}',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Close'),
                        ),
                      ],
                    ),
                  );
                },
                //onLongPress navigate to AddEditPage
                onLongPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AddEditPage(contact: contact, index: index),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      // Add a floating action button to add a new contact
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddEditPage(),
            ),
          );
        },
      ),
    );
  }
}
