import 'package:stacked/stacked.dart';

class PostViewModel extends BaseViewModel {
  String _post = 'Random Text Generator';
  String get post => _post;

  List<String> get horizontalPosts =>
      List<String>.generate(15, (index) => 'Horizontal $index');

  List<String> get verticalPosts =>
      List<String>.generate(15, (index) => 'Vertical $index');
}
