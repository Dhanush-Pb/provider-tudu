import 'package:flutter/material.dart';
import 'package:provider_app/model/studentmodel.dart';

class ProviderDemo with ChangeNotifier {
  List<student> prList = [];
  List<student> searchResults = []; // List to store search results
  int _idCounter = -1; // Counter to keep track of student IDs

  void addToPr(student value) {
    value.id = _idCounter++; // Assigning unique ID to student
    prList.add(value);
    notifyListeners();
  }

  void editStudent(student update) {
    int index = prList.indexWhere((student) => student.id == update.id);

    prList[index] = update;
    notifyListeners();
  }

  void delete(int studentid) {
    prList.removeWhere((student) => student.id == studentid);
    notifyListeners();
  }

  void search(String query) {
    searchResults.clear();

    // If the query is empty, return all students
    if (query.isEmpty) {
      searchResults.addAll(prList);
    } else {
      // Filter students whose name contains the query
      searchResults.addAll(
        prList.where((student) =>
            student.name.toLowerCase().contains(query.toLowerCase())),
      );
    }

    notifyListeners();
  }
}
