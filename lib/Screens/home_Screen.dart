import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news_app/Conditional%20Tasks/save_News.dart';
import 'package:news_app/Provider/home_Screen_Provider.dart';
import 'package:news_app/Provider/saved_Articles_Screen_Provider.dart';
import 'package:news_app/Screens/Details_Screens/selected_News_Details_Screen.dart';
import 'package:news_app/Screens/search_Screen.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  @override
  Widget build(BuildContext context) {
    final homeScreenProvider = Provider.of<HomeScreenProvider>(context, listen: false);
    final savedArticleScreenProvider = Provider.of<SavedArticleScreenProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: FutureBuilder(
        future: homeScreenProvider.getNewsResponse(context),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else if(snapshot.hasError) {
            return Center(
              child: Text("An error has occurred, Please try again later"),
            );
          }
          return Consumer<SaveNewsProvider>(
            builder: (context, value, child) {
              return ListView.builder(
                  itemCount: homeScreenProvider.articlesList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SelectedNewsDetailsScreen(
                              uniqueId: homeScreenProvider.articlesList[index].uniqueId,
                              index: index,
                              title: homeScreenProvider.articlesList[index].title.toString(),
                              author: homeScreenProvider.articlesList[index].author.toString(),
                              name: homeScreenProvider.articlesList[index].name.toString(),
                              urlToImage: homeScreenProvider.articlesList[index].urlToImage.toString(),
                              url: homeScreenProvider.articlesList[index].url.toString(),
                              content: homeScreenProvider.articlesList[index].content.toString(),
                              publishedAt: homeScreenProvider.articlesList[index].publishedAt.toString(),
                              description: homeScreenProvider.articlesList[index].description.toString(),
                            ),
                            ),
                          );
                        },
                        leading: SizedBox(
                            height: 200.0,
                            width: 100.0, // fixed width and height
                            child: Image.network(
                              homeScreenProvider.articlesList[index].urlToImage.toString(),
                              fit: BoxFit.fill,
                              loadingBuilder: (context, child, loadingProgress) {
                                if(loadingProgress == null) {
                                  return child;
                                }
                                else {
                                  return Center(
                                    child: Text("Wait.."),
                                  );
                                }
                              },
                              errorBuilder: (context, exception, stackTrace) {
                                return Icon(Icons.error);
                              },
                            )
                        ),
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "#${homeScreenProvider.articlesList[index].name.toString()}",
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text(homeScreenProvider.articlesList[index].title.toString()),
                          ],
                        ),
                        trailing: Wrap(
                          spacing: 12, // space between two icons
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                  print("add Data function");
                                  savedArticleScreenProvider.addData(
                                    uniqueId: homeScreenProvider.articlesList[index].uniqueId,
                                    author: homeScreenProvider.articlesList[index].author.toString(),
                                    name: homeScreenProvider.articlesList[index].name.toString(),
                                    description: homeScreenProvider.articlesList[index].description.toString(),
                                    title: homeScreenProvider.articlesList[index].title.toString(),
                                    publishedAt: homeScreenProvider.articlesList[index].publishedAt.toString(),
                                    url: homeScreenProvider.articlesList[index].url.toString(),
                                    urlToImage: homeScreenProvider.articlesList[index].urlToImage.toString(),
                                    content: homeScreenProvider.articlesList[index].content.toString()
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          duration: Duration(seconds: 1),
                                          content: Text("News is add to Saved Articles")
                                      )
                                  );
                              },
                              child: Icon(
                                Icons.add_box_outlined,
                                size: 30,
                              ),
                            ),
                            Icon(
                              Icons.share,
                              size: 30,
                            ), // icon-2
                          ],
                        ),
                      ),
                    );
                  }
              );
            },
          );
        }
      ),
    );
  }
}
