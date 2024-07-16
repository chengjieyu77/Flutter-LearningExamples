import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoappmy/providers/providers.dart';
import 'package:todoappmy/utils/utils.dart';
import 'package:todoappmy/widgets/form_title.dart';

class SelectCategory extends ConsumerWidget {
  const SelectCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = TaskCategory.values.toList();
    final selectedCategory = ref.watch(categoryProvider);
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          FormTitle(text: 'Category'),
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: ListView.separated(
                  physics: AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return InkWell(
                      onTap: () {
                        ref.read(categoryProvider.notifier).state = category;
                      },
                      child: Icon(
                        category.icon,
                        color: category == selectedCategory
                            ? category.color
                            : Colors.grey,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 10,
                    );
                  }))
        ],
      ),
    );
  }
}
