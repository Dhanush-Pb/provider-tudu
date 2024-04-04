// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/model/studentmodel.dart';
import 'package:provider_app/provider/providerDemo.dart';

class detailspage extends StatelessWidget {
  final int studentid;
  const detailspage({super.key, required this.studentid});

  @override
  Widget build(BuildContext context) {
    student stu = context.read<ProviderDemo>().prList.firstWhere(
        // ignore: avoid_types_as_parameter_names
        (student) => student.id == studentid,
        orElse: () => student(name: '', age: '', country: ''));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        centerTitle: true,
        title: Text('Details of ${stu.name}'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
          ),
          const CircleAvatar(
            radius: 70,
            child: Icon(
              Icons.hail_sharp,
              size: 60,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          show('Name :   ', stu.name),
          const SizedBox(
            height: 2,
          ),
          show('A g e:         ', stu.age),
          const SizedBox(
            height: 2,
          ),
          show('Country: ', stu.country)
        ],
      ),
    );
  }

  Widget show(String label, String data) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        height: 60,
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 159, 206, 245),
            borderRadius: BorderRadius.circular(25)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              data,
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
