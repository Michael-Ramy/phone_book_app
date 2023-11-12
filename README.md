
# Phone Book App

A Flutter application for managing contacts. The app allows users to view a list of contacts, add new contacts, edit existing ones, and view detailed information about each contact. Contacts are persisted locally using shared preferences.

## Getting Started

### Installation

To Clone the repository:

   ```bash
   git clone https://github.com/Michael-Ramy/phone_book_app.git
   ```

## Overview

The application consists of several Dart files:

- **main.dart:** The entry point of the app. Initializes the storage and sets up the main app structure.
- **contact.dart:** Defines the `Contact` class, representing a contact with a unique identifier, name, number, and optional avatar.
- **contacts_screen.dart:** The main screen displaying a list of contacts. Allows users to add new contacts, view contact details, and perform basic operations.
- **add_edit_contact_screen.dart:** Screen for adding new contacts or editing existing ones.
- **contact_details_screen.dart:** Screen for viewing detailed information about a contact, including options to edit or delete the contact.
- **storage.dart:** Handles local storage using shared preferences.
- **contacts_handler.dart:** Manages the list of contacts, provides functions for adding, editing, and deleting contacts, and updates the UI using a stream.
- **common_widgets.dart:** Contains common widgets, such as a custom app bar.

## Usage

1. **Home Screen:** The main screen displays a list of contacts. Tap on a contact to view details.

2. **Add/Edit Contact:** Press the "+" button on the home screen to add a new contact. Tap on an existing contact to view detailed information, with options to edit or delete the contact.

3. **View Details:** Tap on a contact to view detailed information, including the avatar if available. Options to edit or delete the contact are available.

## Data Persistence

Contacts are persisted locally using shared preferences. The `Storage` class in `storage.dart` handles saving and retrieving contacts.

## Contact Handling

The `ContactsHandler` class in `contacts_handler.dart` manages the list of contacts, provides functions for adding, editing, and deleting contacts, and updates the UI using a stream.

## Screens

- **Contacts Screen (`contacts_screen.dart`):** Displays a list of contacts with options to add, view details, edit, and delete.
- **Add/Edit Contact Screen (`add_edit_contact_screen.dart`):** Allows users to add new contacts or edit existing ones.
- **Contact Details Screen (`contact_details_screen.dart`):** Displays detailed information about a contact with options to edit or delete.

## Custom Widgets

- **Custom App Bar (`common_widgets.dart`):** Customizable app bar for consistent styling across screens.


## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
