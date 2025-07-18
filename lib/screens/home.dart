import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '/services/firestore.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController taskController = TextEditingController();
  final tasks = FirebaseFirestore.instance.collection('Tasks');
  final fireStore =  Firestore();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: false, title: const Text('To-Do List App', style: TextStyle(fontSize: 32.0,),), backgroundColor: Colors.blue[300],),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 60.0),
        child: Column(
          children: [
           Text('Add a Task', style: TextStyle(fontSize: 30.0,),),
            Row(
              children: [
                //This is the textfield and button where you can create a task and add it to firestore
                Expanded(
                  child: TextField(
                    controller: taskController,
                    decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'New task'),
                  ),
                ),
                SizedBox(width:20.0),
                ElevatedButton(
                  child: Text('Add'),
                  onPressed: () {
                    fireStore.addTask(taskController.text);
                    taskController.clear();
                  }
                )
              ],
            ),
            const SizedBox(height: 50),
            Expanded(
              // This is where the streambuilder pulls a snapshot of the database and creates a listview of all the tasks
              // it also keeps this listview updated in real-time, if any updates to the database are made it will reflect it
              child: StreamBuilder<QuerySnapshot>(
                stream:tasks.snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  else {
                    final taskData = snapshot.data!.docs;
                    bool titleCheck = false;

                    return ListView.separated(
                      itemCount: taskData.length + 1,
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 10);
                      },
                      itemBuilder: (context, index) {
                        if(index == 0 && !titleCheck){
                          titleCheck == true;
                          return ListTile(
                            title: Center(child:Text('List of Current Tasks',style: TextStyle(fontSize: 30.0,),)),
                          );
                        }
                        else{
                        final doc = taskData[index - 1];
                        final data = doc.data() as Map<String, dynamic>;
                        SizedBox(height:100);
                        // These listtiles are the individual Tasks that are pulled from firestore and include all of the fields
                        return ListTile(
                          tileColor: Colors.grey[100],
                          leading: Checkbox(
                            value: data['completed'],
                            onChanged: (_) => fireStore.toggleComplete(doc.id, data['completed']),
                          ),
                          title: Text(
                            data['title'],
                            style: TextStyle(
                              decoration: data['completed']
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),
                          subtitle: Text('Created on: ${DateFormat('yyyy-MM-dd – kk:mm').format((data['created_at'].toDate()))}'),
                          trailing: ElevatedButton(
                            child:Text("Delete"),
                            onPressed: () => fireStore.deleteTask(doc.id),
                          ),
                        );}
                      },
                    );
                  } 
              })
            ),
          ],
        ),
      ),
    );
  }      

















}