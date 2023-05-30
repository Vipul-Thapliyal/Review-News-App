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
    homeScreenProvider.getNewsRespone(context);

    int? addElementAtindex = 0;

    // print(homeScreenProvider.articlesList[0].title.toString());
    // print(homeScreenProvider.articlesList[0].source![0].name.toString());


    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: FutureBuilder(
        future: homeScreenProvider.getNewsRespone(context),
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
          return
            // Text(homeScreenProvider.newsModelVar!.status.toString());
          Consumer<SaveNewsProvider>(
            builder: (context, value, child) {
              return ListView.builder(
                  itemCount: homeScreenProvider.articlesList.length,
                  itemBuilder: (context, index) {
                    // return Text(homeScreenProvider.artclesList[index].title.toString());
                    // return Text(homeScreenProvider.newsModelVar!.status.toString());
                    return Container(
                      margin: EdgeInsets.all(10),
                      child: ListTile(
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
                        title: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SelectedNewsDetailsScreen(
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
                          child: Column(
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
                        ),
                        trailing: Wrap(
                          spacing: 12, // space between two icons
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                if(value.selectedItem.contains(index)) {
                                  value.removeItem(index);
                                  if(savedArticleScreenProvider.savedArticlesList.contains(index)) {

                                  }
                                  savedArticleScreenProvider.removeData(index.toInt(), homeScreenProvider.articlesList[index].content.toString());
                                  // savedArticleScreenProvider.savedArticlesList.removeAt(addElementAtindex!);
                                } else {
                                  value.addItem(index);
                                  addElementAtindex = index;
                                  // savedArticleScreenProvider.addListItem(homeScreenProvider.articlesList[index]);
                                  // savedArticleScreenProvider.addData(
                                  //   homeScreenProvider.articlesList[index].description,
                                  // );
                                  print("add Data function");
                                  // print("${homeScreenProvider.articlesList[index].name.toString()}");
                                  savedArticleScreenProvider.addData(
                                    author: homeScreenProvider.articlesList[index].author.toString(),
                                    name: homeScreenProvider.articlesList[index].name.toString(),
                                    description: homeScreenProvider.articlesList[index].description.toString(),
                                    title: homeScreenProvider.articlesList[index].title.toString(),
                                    publishedAt: homeScreenProvider.articlesList[index].publishedAt.toString(),
                                    url: homeScreenProvider.articlesList[index].url.toString(),
                                    urlToImage: homeScreenProvider.articlesList[index].urlToImage.toString(),
                                    // index: addElementAtindex,
                                  );
                                  // print("${homeScreenProvider.articlesList[index].name.toString()}");
                                }
                              },
                              child: Icon(
                                  value.selectedItem.contains(index) ? Icons.favorite : Icons.favorite_border_outlined
                              ),
                            ),
                            Icon(Icons.share), // icon-2
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
