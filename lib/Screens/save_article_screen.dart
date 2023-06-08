import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Provider/home_Screen_Provider.dart';
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
    if(kDebugMode) {
      print("Saved Articles Screen");
    }

    final homeScreenProvider = Provider.of<HomeScreenProvider>(context, listen: false);
    final favoriteItems = homeScreenProvider.getFavoriteItems();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Saved News"),
      ),
      body: favoriteItems.isEmpty ?
      const Center(
        child: Text("No articles added to favorites"),
      )
      :
      ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: favoriteItems.length,
        itemBuilder: (context, index) {
          return ListTile(
              onTap: () {
                /// Navigator.pushNamed
                Navigator.pushNamed(
                  context,
                  SavedNewsDetailsScreen.routeName,
                  arguments: {
                    "author" : favoriteItems[index].author.toString(),
                    "name" : favoriteItems[index].source!.name.toString(),
                    "title" : favoriteItems[index].title.toString(),
                    "description" : favoriteItems[index].description.toString(),
                    "urlToImage" : favoriteItems[index].urlToImage.toString(),
                  },
                );
              },
              leading: SizedBox(
                  height: 200.0,
                  width: 100.0, // fixed width and height
                  child: Image.network(
                    favoriteItems[index].urlToImage.toString(),
                    fit: BoxFit.fill,
                    loadingBuilder: (context, child,
                        loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      else {
                        return const Center(
                          child: Text("Wait.."),
                        );
                      }
                    },
                    errorBuilder: (context, exception, stackTrace) {
                      return const Icon(Icons.error);
                    },
                  )
              ),
              title: InkWell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "#${favoriteItems[index].source!.name.toString()}",
                      style: const TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Text(favoriteItems[index].title.toString()),
                  ],
                ),
              ),
              trailing: Wrap(
                spacing: 12, // space between two icons
                children: <Widget>[
                  InkWell(
                      onTap: () {
                        homeScreenProvider.toggleFavorite(favoriteItems[index].publishedAt.toString());
                        setState(() {

                        });
                      },
                    child: const Icon(Icons.delete),
                  ), // icon-2
                ],
              ),
            );
        }
      ),
    );
  }
}
