import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/models/article_model.dart';
import 'package:news/pages/ArticleDetailspage.dart';

class ArticleListItem extends StatelessWidget {
  const ArticleListItem({Key? key, required this.Article}) : super(key: key);

  final ArticleModel Article;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //
        Stack(
          children: [
            Container(
              height: 365,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 220,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(),
                    ),
                    imageUrl: Article.urlToImage ??
                        "https://thumbs.dreamstime.com/b/letter-block-word-null-wood-background-187721938.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: 80,
                right: 10,
                left: 10,
                child: Container(
                  child: AutoSizeText(
                    Article.title ?? "No Title",
                    minFontSize: 5,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                )),
            Positioned(
              right: 10,
              left: 10,
              bottom: 30,
              child: Container(
                height: 40,
                child: AutoSizeText(
                  Article.description ?? "No Content",
                  minFontSize: 11,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned(
              bottom: -7,
              left: MediaQuery.of(context).orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.width / 4
                  : MediaQuery.of(context).size.width / 20,
              right: MediaQuery.of(context).orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.width / 3.2
                  : 50,
              child: TextButton.icon(
                icon: Icon(Icons.arrow_forward_ios),
                label: const Text("See details"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ArticleDetailsPage(Article: Article)));
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              heightFactor:
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? 21
                      : 20,
              child: Padding(
                padding:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? const EdgeInsets.only(left: 8)
                        : const EdgeInsets.only(left: 12),
                child: Text(Article.source?.name ?? "No Source"),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              heightFactor:
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? 21
                      : 20,
              child: Padding(
                padding:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? const EdgeInsets.only(left: 8)
                        : const EdgeInsets.only(left: 12),
                child: Text(DateTime(
                        Article.publishedAt!.year,
                        Article.publishedAt!.month,
                        Article.publishedAt!.day,
                        Article.publishedAt!.hour,
                        Article.publishedAt!.minute,
                        Article.publishedAt!.second)
                    .toString()),
              ),
            )
          ],
        )
      ],
    );
  }
}

// InkWell(
//   onTap: () {
//     Navigator.push(context,
//         MaterialPageRoute(builder: (context) => ArticleDetailsPage()));
//   },
//   child: Container(
//     height: 365,
//     child: Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//             child: CachedNetworkImage(
//                 placeholder: (context, url) =>
//                     Center(child: CircularProgressIndicator()),
//                 fit: BoxFit.fill,
//                 imageUrl: Article.urlToImage ??
//                     "https://thumbs.dreamstime.com/b/letter-block-word-null-wood-background-187721938.jpg"),
//             height: 200,
//             width: MediaQuery.of(context).size.width,
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.black, width: 2),
//               borderRadius: BorderRadius.circular(8),
//               // image: DecorationImage(image: CachedNetworkImageProvider(Article.urlToImage?? "https://thumbs.dreamstime.com/b/letter-block-word-null-wood-background-187721938.jpg",),

//               // image: NetworkImage(Article.urlToImage ??
//               //     "https://thumbs.dreamstime.com/b/letter-block-word-null-wood-background-187721938.jpg"),
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//             height: 65,
//             child: AutoSizeText(
//               Article.title ?? "",
//               textAlign: TextAlign.center,
//               minFontSize: 12,
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ),
//         ),

//         Container(
//           height: 20,
//           child: Text(
//             Article.content ?? "No Content",
//             overflow: TextOverflow.ellipsis,
//             textAlign: TextAlign.center,
//           ),
//         ),
//         TextButton.icon(
//             onPressed: () {},
//             icon: Icon(Icons.arrow_forward_ios),
//             label: const Text("See more"))

//         // Divider(
//         //   thickness: 3,
//         // )
//       ],
//     ),
//   ),
