import 'package:flutter/material.dart';

void main() => runApp(const ChipApp());

class ChipApp extends StatefulWidget {
  const ChipApp({super.key});

  @override
  State<ChipApp> createState() => _ChipAppState();
}

class _ChipAppState extends State<ChipApp> {
  bool selected = false;
  bool filterSelected = false;
  String choice = "None";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Chips Example")),
        body: Wrap(
          spacing: 10,
          children: [
            const Chip(label: Text("Simple Chip")),
            InputChip(
              label: const Text("Input Chip"),
              selected: selected,
              onSelected: (val) => setState(() => selected = val),
            ),
            FilterChip(
              label: const Text("Filter Chip"),
              selected: filterSelected,
              onSelected: (val) => setState(() => filterSelected = val),
            ),
            ChoiceChip(
              label: const Text("Choice Chip"),
              selected: choice == "Choice Chip",
              onSelected: (_) => setState(() => choice = "Choice Chip"),
            ),
          ],
        ),
      ),
    );
  }
}
