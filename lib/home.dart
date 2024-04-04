// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/editpage.dart';
import 'package:provider_app/model/studentmodel.dart';
import 'package:provider_app/provider/providerDemo.dart';
import 'package:provider_app/searchScreen.dart';
import 'package:provider_app/second.dart';
import 'package:provider_app/thirdpage.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("page rebuild");
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => page2()));
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black12,
        centerTitle: true,
        title: const Text("Students"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Searchscreen()));
              },
              icon: Icon(Icons.search_outlined)),
        ],
      ),
      body: Consumer<ProviderDemo>(
        // ignore: avoid_types_as_parameter_names
        builder: (context, ProviderDemo, child) {
          List<student> students = ProviderDemo.prList;
          print(students.length);

          if (students.isEmpty) {
            return const Center(
              child: Text('No students'),
            );
          } else {
            return ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  final student = students[index];
                  final id = student.id;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                        color: const Color.fromARGB(255, 193, 227, 255),
                        elevation: 5,
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => detailspage(
                                      studentid: student.id!,
                                    )));
                          },
                          leading: CircleAvatar(
                            child: Text('${index + 1}'),
                          ),
                          title: Text(student.name),
                          subtitle: Text('From ${student.country}'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.red,
                                child: IconButton(
                                  onPressed: () {
                                    if (id != null) {
                                      ProviderDemo.delete(student.id!);
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.green,
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => EditPage(
                                                  studentId: student.id!)));
                                    },
                                    icon: const Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                    )),
                              ),
                            ],
                          ),
                        )),
                  );
                });
          }
        },
      ),
    );
  }
}

class custmtestfield extends StatelessWidget {
  final TextEditingController controller;
  final String labeltext;
  final TextInputType keybordtype;

  const custmtestfield({
    super.key,
    required this.controller,
    required this.keybordtype,
    required this.labeltext,
  });

  @override
  Widget build(BuildContext context) {
    AppBar(
      title: const Text('addstudent'),
    );
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color.fromARGB(255, 110, 110, 110),
        ),
        child: TextFormField(
          keyboardType: keybordtype,
          controller: controller,
          decoration: InputDecoration(
              // ignore: prefer_const_constructors
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              labelText: labeltext,
              labelStyle:
                  const TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
        ),
      ),
    );
  }
}
