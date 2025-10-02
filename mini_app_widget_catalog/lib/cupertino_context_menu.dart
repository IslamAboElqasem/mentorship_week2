import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CupertinoContextMenuExample(),
    );
  }
}

class CupertinoContextMenuExample extends StatelessWidget {
  const CupertinoContextMenuExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("CupertinoContextMenu Example")),
      body: Center(
        child: CupertinoContextMenu(
          actions: const [
            CupertinoContextMenuAction(child: Text("Copy")),
            CupertinoContextMenuAction(child: Text("Share")),
            CupertinoContextMenuAction(
                child: Text("Delete"), isDestructiveAction: true),
          ],
          child: Image.network(
            "https://picsum.photos/200",
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}
