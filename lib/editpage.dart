import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/home.dart';
import 'package:provider_app/model/studentmodel.dart';
import 'package:provider_app/provider/providerDemo.dart';

class EditPage extends StatelessWidget {
  final int studentId;

  EditPage({Key? key, required this.studentId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final studentProvider = context.read<ProviderDemo>();
    final studentToUpdate = studentProvider.prList.firstWhere(
      (student) => student.id == studentId,
      orElse: () => student(id: -1, name: '', age: '', country: ''),
    );

    final TextEditingController nameController =
        TextEditingController(text: studentToUpdate.name);
    final TextEditingController ageController =
        TextEditingController(text: studentToUpdate.age);
    final TextEditingController countryController =
        TextEditingController(text: studentToUpdate.country);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        centerTitle: true,
        title: Text('Edit details of ${studentToUpdate.name}'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                ),
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 50,
                  child: Icon(
                    Icons.mood,
                    size: 50,
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                custmtestfield(
                  controller: nameController,
                  keybordtype: TextInputType.name,
                  labeltext: 'Name',
                ),
                custmtestfield(
                  controller: ageController,
                  keybordtype: TextInputType.number,
                  labeltext: 'Age',
                ),
                custmtestfield(
                  controller: countryController,
                  keybordtype: TextInputType.name,
                  labeltext: 'Country',
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    final updatedStudent = student(
                      id: studentId,
                      name: nameController.text,
                      age: ageController.text,
                      country: countryController.text,
                    );
                    studentProvider.editStudent(updatedStudent);
                    Navigator.of(context).pop();
                  },
                  child: Text('Save Details'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
