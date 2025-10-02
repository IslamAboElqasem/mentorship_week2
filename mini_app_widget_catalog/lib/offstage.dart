import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool hide = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Offstage Example")),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () => setState(() => hide = !hide),
              child: Text(hide ? "Show Widget" : "Hide Widget"),
            ),
            Offstage(
              offstage: hide,
              child: const Text("This text can be hidden!"),
            ),
          ],
        ),
      ),
    );
  }
}
