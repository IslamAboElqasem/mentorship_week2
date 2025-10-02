import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Manager',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Task Manager'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<_TaskItem> _tasks = <_TaskItem>[
    _TaskItem(id: 't1', title: 'Buy groceries'),
    _TaskItem(id: 't2', title: 'Walk the dog'),
    _TaskItem(id: 't3', title: 'Read a book'),
  ];

  Future<String?> _promptNewTaskTitle() async {
    final TextEditingController controller = TextEditingController();
    final String? result = await showDialog<String>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('New Task'),
          content: TextField(
            controller: controller,
            autofocus: true,
            decoration: const InputDecoration(hintText: 'Enter task title'),
            onSubmitted: (String value) {
              Navigator.of(dialogContext).pop(value.trim());
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () =>
                  Navigator.of(dialogContext).pop(controller.text.trim()),
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
    return result;
  }

  void _addTask(String title) {
    if (title.isEmpty) {
      return;
    }
    final String id = 't${DateTime.now().microsecondsSinceEpoch}';
    setState(() {
      _tasks.insert(0, _TaskItem(id: id, title: title));
    });
  }

  void _reorderTasks(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final _TaskItem movedTask = _tasks.removeAt(oldIndex);
      _tasks.insert(newIndex, movedTask);
    });
  }

  Future<bool> _confirmDeletion(BuildContext context, String taskTitle) async {
    final bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Delete task?'),
          content: Text('Are you sure you want to delete "$taskTitle"?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(true),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
    return confirmed ?? false;
  }

  void _deleteTaskWithUndo(BuildContext context, int index) {
    final _TaskItem removedTask = _tasks[index];
    setState(() {
      _tasks.removeAt(index);
    });

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text('Deleted "${removedTask.title}"'),
          action: SnackBarAction(
            label: 'UNDO',
            onPressed: () {
              setState(() {
                final int safeIndex = index.clamp(0, _tasks.length);
                _tasks.insert(safeIndex, removedTask);
              });
            },
          ),
          duration: const Duration(seconds: 4),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ReorderableListView.builder(
        buildDefaultDragHandles: true,
        itemCount: _tasks.length,
        onReorder: _reorderTasks,
        itemBuilder: (BuildContext itemContext, int index) {
          final _TaskItem task = _tasks[index];
          return Dismissible(
            key: ValueKey<String>(task.id),
            direction: DismissDirection.horizontal,
            background: Container(
              color: Colors.red.shade100,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerLeft,
              child: const Icon(Icons.delete, color: Colors.red),
            ),
            secondaryBackground: Container(
              color: Colors.red.shade100,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerRight,
              child: const Icon(Icons.delete, color: Colors.red),
            ),
            confirmDismiss: (DismissDirection direction) async {
              return _confirmDeletion(context, task.title);
            },
            onDismissed: (DismissDirection direction) {
              final int removedIndex = index;
              _deleteTaskWithUndo(context, removedIndex);
            },
            child: ListTile(
              key: ValueKey<String>('tile-${task.id}'),
              title: Text(task.title),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final String? title = await _promptNewTaskTitle();
          if (title != null && title.isNotEmpty) {
            _addTask(title);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _TaskItem {
  const _TaskItem({required this.id, required this.title});
  final String id;
  final String title;
}
