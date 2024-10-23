import 'package:flutter/material.dart';
import 'package:hoagsource/hoagsource.dart';

import 'component.dart';
import 'icons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
      home: const MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Example'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: const Text('Icons'),
                leading: const BaseIcon(BaseIcons.icon1, style: BaseIconStyle.solid,),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ExIcons()),
                  );
                },
              ),

              ListTile(
                title: const Text('Component'),
                leading: const BaseIcon(BaseIcons.component, style: BaseIconStyle.solid,),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Component()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
