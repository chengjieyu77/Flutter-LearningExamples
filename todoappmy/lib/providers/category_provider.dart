import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoappmy/utils/utils.dart';

final categoryProvider = StateProvider<TaskCategory>((ref) {
  return TaskCategory.others;
});
