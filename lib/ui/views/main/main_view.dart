import 'package:example/ui/shared/app_colors.dart';
import 'package:example/ui/views/main/main_viewmodel.dart';
import 'package:example/ui/views/post/post_view.dart';
import 'package:example/ui/views/todo/todo_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: getViewForIndex(model.currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: kcMediumGrey,
          currentIndex: model.currentIndex,
          onTap: (index) {
            model.setIndex(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.post_add,
                color: Colors.white,
              ),
              label: '',
              activeIcon: Icon(
                Icons.post_add,
                color: kcPrimaryColor,
              ),
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.list,
                color: Colors.white,
              ),
              activeIcon: Icon(
                Icons.list,
                color: kcPrimaryColor,
              ),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => MainViewModel(),
    );
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return PostView();
      case 1:
        return TodoView();
      default:
        return PostView();
    }
  }
}
