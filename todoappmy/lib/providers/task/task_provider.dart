import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoappmy/data/data.dart';
import 'package:todoappmy/providers/providers.dart';

final taskProvider = StateNotifierProvider<TaskNotifier, TaskState>((ref) {
  final repository = ref.watch(taskRepositoryProvider);
  return TaskNotifier(repository);
});
