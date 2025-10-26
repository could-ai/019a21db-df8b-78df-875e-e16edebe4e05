import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Complete Tasks'),
      ),
      body: ListView.builder(
        itemCount: appProvider.tasks.length,
        itemBuilder: (context, index) {
          final task = appProvider.tasks[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(task.title),
              subtitle: Text('${task.reward.toStringAsFixed(4)} BTC'),
              trailing: task.isCompleted
                  ? const Icon(Icons.check_circle, color: Colors.green)
                  : ElevatedButton(
                      onPressed: () => appProvider.completeTask(index),
                      child: const Text('Complete'),
                    ),
            ),
          );
        },
      ),
    );
  }
}