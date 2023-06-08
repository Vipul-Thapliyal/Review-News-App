import 'package:flutter/material.dart';
import 'package:news_app/Provider/home_screen_provider.dart';
import 'package:provider/provider.dart';

class SelectedNewsDetailsScreen extends StatelessWidget {
  static const String routeName = "/selectedNewsDetailsScreen";

  // Map<String, dynamic> data;

  // const SelectedNewsDetailsScreen(
  const SelectedNewsDetailsScreen(
    {
      Key? key,
      // required this.data,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>;
    final index = int.parse(arguments["index"]);
    final author = arguments["author"];
    final name = arguments["name"];
    final title = arguments["title"];
    final description = arguments["description"];
    final urlToImage = arguments["urlToImage"];

    // debugPrint(data.toString());
    debugPrint("index");
    debugPrint(index.toString());
    debugPrint(index.runtimeType.toString());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.keyboard_arrow_left,
            color: Colors.black,
            size: 35,
          ),
        ),
        actions: [
          Wrap(
            spacing: 12, // space between two icons
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Icon(
                  Icons.bookmark_border,
                  size: 30,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15,right: 10),
                child: Icon(
                  Icons.share,
                  size: 30,
                  color: Colors.black,
                ),
              ) // icon-2
            ],
          )

        ],
      ),
      body: Column(
        children: [
          // Text(data["Name"].toString()),
          //
          // Text(data["Age"].toString()),

          Expanded(
            child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Container(
                padding: const EdgeInsets.all(10),
                // height: screenHeight * 0.8,
                child: Column(
                  children: [
                  /// Title
                    Text(
                      "$title",
                      // homeScreenProvider.articlesList[widget.index!].title.toString(),
                      // homeScreenProvider.articlesList[index].title.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20
                      ),
                    ),
                    const SizedBox(height: 20,),

                    /// Source
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(""
                          "$name",
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),

                    const SizedBox(height: 20,),

                    /// Image
                    SizedBox(
                        // height: 100.0,
                        // width: 50.0, // fixed width and height
                      child: Image.network(
                        urlToImage.toString(),
                        loadingBuilder: (context, child, loadingProgress) {
                          if(loadingProgress == null) {
                            return child;
                          }
                          return SizedBox(
                            child:
                            // Text("Wait...")
                            Image.asset(
                              "assets/images/placeholderImage.png",
                              fit: BoxFit.fill,
                            ),
                          );
                        },
                        errorBuilder: (context, exception, stackTrace) {
                          return const Icon(Icons.error);
                        },
                      )
                    ),

                    /// Author
                    Text(
                      author.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20
                      ),
                    ),

                    const SizedBox(height: 20,),

                    /// Description
                    Text(description.toString())
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}