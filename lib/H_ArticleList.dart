import 'package:flutter/material.dart';
import 'package:news/ArticleListItems.dart';
import 'package:news/models/article_model.dart';
import 'package:news/services/articleapi.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HArticleList extends StatefulWidget {
  const HArticleList({Key? key}) : super(key: key);

  @override
  _HArticleListState createState() => _HArticleListState();
}

class _HArticleListState extends State<HArticleList> {
  late final Future<List<ArticleModel>> _ArticleList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ArticleList = ArticleApi.GetHealthArticleData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: _ArticleList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ArticleModel> _MyList = snapshot.data!;
          return MediaQuery.of(context).orientation == Orientation.portrait
              ? ListView.builder(
                  itemExtent: MediaQuery.of(context).size.height * 0.5,
                  itemCount: _MyList.length,
                  itemBuilder: (context, index) =>
                      ArticleListItem(Article: _MyList[index]))
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10,
                      crossAxisCount: 3,
                      childAspectRatio:
                          0.0014 * MediaQuery.of(context).size.height),
                  itemCount: _MyList.length,
                  itemBuilder: (context, index) {
                    return ArticleListItem(Article: _MyList[index]);
                  });
        } else if (snapshot.hasError) {
          return Center(
            child: Text("Couldn't retrieve data"),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
