import 'package:cloud_firestore/cloud_firestore.dart';
  
  class Firestore {

    final tasks = FirebaseFirestore.instance.collection('tasks');
  
  // This function adds a task to the firestore db as long as the task textfield is not empty  
    void addTask(String title) {
      if (title.trim().isEmpty) return;
      tasks.add({
        'title': title,
        'completed': false,
        'created_at': Timestamp.now(),
      });
    }

  // This function changes the completed field in firestore for a particular task when the check box is clicked
    void toggleComplete(String id, bool current) {
      tasks.doc(id).update({'completed': !current});
    }

  // This function Deletes a task from the firestore db
    void deleteTask(String id) {
      tasks.doc(id).delete();
    }

  }
