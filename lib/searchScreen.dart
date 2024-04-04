import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/model/studentmodel.dart';
import 'package:provider_app/provider/providerDemo.dart';
import 'package:provider_app/thirdpage.dart';

class Searchscreen extends StatelessWidget {
  const Searchscreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: CupertinoTextField(
              prefix: Icon(
                Icons.search,
                color: Colors.white,
              ),
              placeholder: 'Search...',
              placeholderStyle:
                  const TextStyle(fontSize: 14), // Adjust font size
              style: const TextStyle(fontSize: 16, color: Colors.white),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
              ),
              onChanged: (query) {
                context.read<ProviderDemo>().search(query);
              },
            ),
          ),
          Expanded(
            child: Consumer<ProviderDemo>(
              builder: (context, providerDemo, child) {
                List<student> seatchrsult = providerDemo.searchResults;
                if (seatchrsult.isEmpty) {
                  return Center(
                    child: Text('No data'),
                  );
                } else {
                  return ListView.builder(
                    itemCount: seatchrsult.length,
                    itemBuilder: (context, index) {
                      final student = seatchrsult[index];
                      return Padding(
                        padding:
                            const EdgeInsets.only(top: 15, left: 15, right: 15),
                        child: Card(
                          color: const Color.fromARGB(255, 183, 218, 247),
                          child: ListTile(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      detailspage(studentid: student.id!)));
                            },
                            title: Text(student.name),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
