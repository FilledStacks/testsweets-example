import 'package:stacked/stacked.dart';

class TodoViewModel extends BaseViewModel {
  String _todo = 'Click to post a new Todo';
  String get todo => _todo;

  int _currentIndex = 0;
  List<String> _todoItems = [];
  List<String> get todoItems => _todoItems;

  void createIndexedTodo() {
    _todoItems.add('Todo $_currentIndex');
    _currentIndex++;
    notifyListeners();
  }
}
