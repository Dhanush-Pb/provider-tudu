import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/home.dart';

import 'package:provider_app/provider/providerDemo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProviderDemo()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.light(),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: Homepage(),
      ),
    );
  }
}
