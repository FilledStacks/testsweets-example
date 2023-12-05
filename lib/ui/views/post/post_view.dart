import 'package:example/ui/shared/app_colors.dart';
import 'package:example/ui/shared/ui_helpers.dart';
import 'package:example/ui/views/post/post_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class PostView extends StatelessWidget {
  const PostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PostViewModel>.reactive(
      disposeViewModel: false,
      builder: (context, model, child) => Scaffold(
        backgroundColor: kcDarkGreyColor,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            verticalSpaceMedium,
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 270,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: model.horizontalPosts.length,
                separatorBuilder: (context, index) => SizedBox(width: 15),
                itemBuilder: (context, index) => Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.yellow[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    model.horizontalPosts[index],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  alignment: Alignment.center,
                ),
              ),
            ),
            verticalSpaceMedium,
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 270,
              child: ListView.separated(
                itemCount: model.horizontalPosts.length,
                separatorBuilder: (context, index) => SizedBox(height: 15),
                itemBuilder: (context, index) => Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    model.verticalPosts[index],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  alignment: Alignment.center,
                ),
              ),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => PostViewModel(),
    );
  }
}
