# To-Do List App for Invisipay
# By Shawn Matheson


## Firestore Rules used:

allow read, write: if true;  

These are the rules i'm using, these rules allow anyone read and write access. These rules would NOT be appropriate if this were a real product,
but for a small app like this with no important data in the database it should be fine.


## Setup instructions

### Setting up a firebase database:
Sign-up/login to firebase  
Create a new project with a project name  
Create a firestore database -> choose start in production mode  
Change the rules from "allow read, write: if false" -> "allow read, write: if true" to allow anyone to read write to the database  
<mark>Note:You can also setup authentication and create more complex rules to handle access</mark>  
Start a collection named "tasks"  
Create the first document which defines the fields in the collections  
  document id: anything you want  
  title (string)  
  completed (boolean)  
  created_at (timestamp)  
The database is now complete.  

### Setting up the app:
Install flutter and its dependancies  
Install firebase and its dependancies  
Clone the To-Do List App repository  
I've included my firebase_options.dart file with access to the database I made so there's no need to connect your own.  
  
  <mark>Note: if you want to connect your own firebase you'll need to use flutterfire CLI  
    Run dart pub global activate flutterfire_cli
    Run flutterfire configure (*make sure web is selected) this will generate a new firebase_options.dart file for your firebase project  
    Enable firestore service</mark>  
    
Once you have firebase all setup you can build and run the app  
Run "flutter build web" in the root directory  
Run "flutter run -d chrome"  

## Assumptions/Limitations:

You have Firebase and its dependancies installed.  
You have flutter and its dependancies installed.  
You have VSCode installed (This app was written and tested in vscode).  
You have google chrome installed, chrome is used as the browser for the web app.  
You have a stable internet connection.  
