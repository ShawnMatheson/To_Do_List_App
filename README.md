# To-Do List App for Invisipay
# By Shawn Matheson


# Firestore Rules used:

These are the rules i'm using, these rules allow anyone read and write access. These rules would NOT be appropriate if this were a real product,
but for a small app like this with no important data in the database it should be fine.

service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if true;
    }
  }
}

# Setup instructions

# Setting up a firebase database:
sign-up/login to firebase
create a new project with a project name
create a firestore database -> choose start in production mode
change the rules from "allow read, write: if false" -> "allow read, write: if true" to allow anyone to read write to the database
  * you can also setup authentication and create more complex rules to handle access
start a collection named "tasks"
create the first document which defines the fields in the collections
  document id: anyhting you want
  title (string)
  completed (boolean)
  created_at (timestamp)
the database is now done

# Setting up the app:
Install flutter and its dependancies
install firebase and its dependancies
Clone the To-Do List App repository
I've included my firebase_options.dart file with access to the database I made so there's no need to connect your own.
  Note: if you want to connect your own firebase you'll need to use flutterfire CLI
    run dart pub global activate flutterfire_cli
    run flutterfire configure (*make sure web is selected) this will generate a new firebase_options.dart file for your firebase project
    enable firestore service
Once you have firebase all setup you can build and run the app
run "flutter build web" in the root directory
run "flutter run -d chrome"

# Assumptions/Limitations:

You have Firebase and its dependancies installed.
You have flutter and its dependancies installed.
You have VSCode installed (This app was written and tested in vscode).
You have google chrome installed, chrome is used as the browser for the web app.
You have a stable internet connection.


