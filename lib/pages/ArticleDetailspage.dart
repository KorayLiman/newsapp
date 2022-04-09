import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/ArticleListItems.dart';
import 'package:news/models/article_model.dart';

class ArticleDetailsPage extends StatelessWidget {
  final ArticleModel Article;
  const ArticleDetailsPage({Key? key, required this.Article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: FlexibleSpaceBar(
            background: CachedNetworkImage(
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(),
              ),
              imageUrl: Article.urlToImage ??
                  "https://thumbs.dreamstime.com/b/letter-block-word-null-wood-background-187721938.jpg",
              fit: BoxFit.fill,
            ),
          ),
          expandedHeight: 200,
        ),
        SliverToBoxAdapter(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  Article.title ?? "No Title",
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  Article.description ??
                      "No ContenttesttesttesttesttestNo11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111 ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo ContenttesttesttesttesttestNo Contenttesttesttesttesttest",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
