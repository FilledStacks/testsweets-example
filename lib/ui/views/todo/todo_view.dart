import 'package:example/ui/shared/app_colors.dart';
import 'package:example/ui/views/todo/todo_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class TodoView extends StatelessWidget {
  const TodoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TodoViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: model.createIndexedTodo,
        ),
        backgroundColor: kcDarkGreyColor,
        body: ListView.builder(
          itemCount: model.todoItems.length,
          itemBuilder: (context, index) => Container(
            height: 50,
            alignment: Alignment.center,
            child: Text(model.todoItems[index]),
          ),
        ),
      ),
      viewModelBuilder: () => TodoViewModel(),
    );
  }
}
