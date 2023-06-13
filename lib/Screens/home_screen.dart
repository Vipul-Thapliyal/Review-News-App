import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Provider/home_Screen_Provider.dart';
import 'package:news_app/Screens/Details_Screens/selected_News_Details_Screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/homeScreenRoute";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeScreenProvider = Provider.of<HomeScreenProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: FutureBuilder(
        future: homeScreenProvider.getNewsResponse(context),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else if(snapshot.hasError) {
            debugPrint("Snapshot erro");
            debugPrint(snapshot.error.toString());
            return const Center(
              child: Text("An error has occurred, Please try again later"),
            );
          }
          return Consumer<HomeScreenProvider>(
            builder: (context, value, child) {
              return ListView.builder(
                  itemCount: homeScreenProvider.articlesList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            SelectedNewsDetailsScreen.routeName,
                            arguments: index.toInt(),
                            // arguments: {
                            //   // "article" : homeScreenProvider.articlesList[index],
                            //   "index" : index.toInt(),
                            //   // "author" : homeScreenProvider.articlesList[index].author.toString(),
                            //   // "name" : homeScreenProvider.articlesList[index].source!.name.toString(),
                            //   // "title" : homeScreenProvider.articlesList[index].title.toString(),
                            //   // "description" : homeScreenProvider.articlesList[index].description.toString(),
                            //   // "urlToImage" : homeScreenProvider.articlesList[index].urlToImage.toString(),
                            // },
                          );
                        },
                        leading: SizedBox(
                            height: 200.0,
                            width: 100.0, // fixed width and height
                            child: Image.network(
                              // homeScreenProvider.articlesList[index].urlToImage.toString(),
                              homeScreenProvider.articlesList[index].urlToImage.toString(),
                              fit: BoxFit.fill,
                              loadingBuilder: (context, child, loadingProgress) {
                                if(loadingProgress == null) {
                                  return child;
                                }
                                else {
                                  return SizedBox(
                                      child:
                                      // Text("Wait...")
                                    Image.asset(
                                      "assets/images/placeholderImage.png",
                                      fit: BoxFit.fill,
                                    ),
                                  );
                                }
                              },
                              errorBuilder: (context, exception, stackTrace) {
                                return const Icon(Icons.error);
                              },
                            )
                        ),
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "#${homeScreenProvider.articlesList[index].source!.name.toString()}",
                              style: const TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Text(homeScreenProvider.articlesList[index].title.toString()),
                          ],
                        ),
                        trailing: Wrap(
                          spacing: 12, // space between two icons
                          children: <Widget>[
                            InkWell(
                                onTap: () {
                                  if(kDebugMode) {
                                    print("add Data function");
                                  }
                                  homeScreenProvider.toggleFavorite(homeScreenProvider.articlesList[index].publishedAt.toString());
                                },
                                child: homeScreenProvider.articlesList[index].isFavorite ? const Icon(Icons.favorite,size: 30,) : const Icon(Icons.favorite_border,size: 30,)
                            ),
                            const Icon(
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
