import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: ExpansionExample());
  }
}

class ExpansionExample extends StatefulWidget {
  const ExpansionExample({super.key});

  @override
  State<ExpansionExample> createState() => _ExpansionExampleState();
}

class _ExpansionExampleState extends State<ExpansionExample> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ExpansionPanel Example")),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (index, isExpanded) {
            setState(() => expanded = !expanded);
          },
          children: [
            ExpansionPanel(
              headerBuilder: (context, isExpanded) =>
                  const ListTile(title: Text("Tap to Expand")),
              body: const ListTile(title: Text("Expanded Content")),
              isExpanded: expanded,
            ),
          ],
        ),
      ),
    );
  }
}
