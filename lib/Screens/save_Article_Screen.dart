import 'package:flutter/material.dart';
import 'package:news_app/Conditional%20Tasks/save_News.dart';
import 'package:news_app/Provider/home_Screen_Provider.dart';
import 'package:news_app/Provider/saved_Articles_Screen_Provider.dart';
import 'package:news_app/Screens/Details_Screens/saved_News_Details_Screen.dart';
import 'package:provider/provider.dart';

class SaveArticleScreen extends StatefulWidget {
  const SaveArticleScreen({Key? key}) : super(key: key);

  @override
  State<SaveArticleScreen> createState() => _SaveArticleScreenState();
}

class _SaveArticleScreenState extends State<SaveArticleScreen> {
  @override
  Widget build(BuildContext context) {
    print("Saved Articles Screen");
    final saveArticleListProvider = Provider.of<SavedArticleScreenProvider>(context, listen: false);
    final homeScreenProvider = Provider.of<HomeScreenProvider>(context, listen: false);
    final saveNewsProvider = Provider.of<SaveNewsProvider>(context, listen: false);

    print("saveArticleListProvider.savedArticlesList.length");
    print(saveArticleListProvider.savedArticlesList.length);
    print(saveArticleListProvider.savedArticlesList.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text("Saved News"),
      ),
      body: Consumer<SavedArticleScreenProvider>(
        builder: (context, value, child) {
          if(value.savedArticlesList.isEmpty) {
            return Center(
              child: Text("No Data availabe")
            );
          }
          return ListView.builder(
            itemCount: value.savedArticlesList.length,
            itemBuilder: (context, index) {
              // return Text(value.savedArticlesList[0].title.toString());
              // return Text(value.savedArticlesList[0].title.toString());
              return ListTile(
                leading: SizedBox(
                    height: 200.0,
                    width: 100.0, // fixed width and height
                    child: Image.network(
                      value.savedArticlesList[index].urlToImage.toString(),
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
                      MaterialPageRoute(builder: (context) => SavedNewsDetailsScreen(
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
                        "#${value.savedArticlesList[index].name.toString()}",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(value.savedArticlesList[index].title.toString()),
                    ],
                  ),
                ),
                trailing: Wrap(
                  spacing: 12, // space between two icons
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        if(saveNewsProvider.selectedItem.contains(index)) {
                          saveNewsProvider.removeItem(index);
                          // savedArticleScreenProvider.savedArticlesList.removeAt(index);
                        } else {
                          saveNewsProvider.addItem(index);
                        }
                      },
                      child: Icon(
                        saveNewsProvider.selectedItem.contains(index) ? Icons.favorite : Icons.favorite_border_outlined
                      ),
                    ),
                    Icon(Icons.share), // icon-2
                  ],
                ),
              );
            }
          );
        },
      ),
    );
  }
}
