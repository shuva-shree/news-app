import 'package:flutter/material.dart';
import 'package:newstoday/helper/news.dart';
import 'package:newstoday/models/article-model.dart';
import 'package:newstoday/views/home_screen.dart';

class CategoryView extends StatefulWidget {
  final String category;
  CategoryView({required this.category});

  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  List<ArticleModel> articles = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async {
    CategoryNews newsClass = CategoryNews();
    await newsClass.getNews(widget.category);
    articles = newsClass.news!;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text("News"),
            Text(
              "Today",
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    SingleChildScrollView(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (ctx, index) {
                            return BlogTile(
                                title: articles[index].title,
                                imageUrl: articles[index].urlToImage,
                                desc: articles[index].description,
                                url: articles[index].url);
                          },
                          itemCount: articles.length,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
