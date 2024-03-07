import 'package:example/app/app.locator.dart';
import 'package:example/services/analytics_service.dart';
import 'package:stacked/stacked.dart';

class TodoViewModel extends BaseViewModel {
  final _analyticsService = locator<AnalyticsService>();

  String _todo = 'Click to post a new Todo';
  String get todo => _todo;

  int _currentIndex = 0;
  List<String> _todoItems = [];
  List<String> get todoItems => _todoItems;

  void createIndexedTodo() {
    _todoItems.add('Todo $_currentIndex');

    _analyticsService.logEvent(name: 'Add Todo', properties: {
      'index': _currentIndex,
    });
    _currentIndex++;
    notifyListeners();
  }
}
