import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/model/tasks.dart';

CollectionReference<Tasks> getTaskColeection() {
  return FirebaseFirestore.instance.collection('Task').withConverter(
      fromFirestore: (snapshot, options) => Tasks.fromJson(snapshot.data()!),
      toFirestore: (task, _) => task.toJson());
}

Future<void> addTaskToFirebase(Tasks taskData) {
  var collection = getTaskColeection();
  var docRef = collection.doc();
  taskData.id = docRef.id;
  return docRef.set(taskData);
}

Stream<QuerySnapshot<Tasks>> getTasksFromFirestore(DateTime dateTime) {
  return getTaskColeection()
      .where('date',
          isEqualTo: DateUtils.dateOnly(dateTime).microsecondsSinceEpoch)
      .snapshots();
}

Future<void> deleteTaskFromFirebase(String id) {
  return getTaskColeection().doc(id).delete();
}

Future<void> updateTaskFromFirebase(String id, Tasks task) {
  return getTaskColeection().doc(id).update({
    "title": task.title,
    "description": task.description,
    "date": task.date,
  }).then((value) => print('Task Updated'));
}

Future<void> updateDone(Tasks task) {
  return getTaskColeection()
      .doc(task.id)
      .update({"isDone": true}).then((value) => print('finish'));
}
