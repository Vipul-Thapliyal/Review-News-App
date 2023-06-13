import 'package:flutter/material.dart';

class SavedNewsDetailsScreen extends StatefulWidget {
  static const String routeName = "/savedNewsDetailsScreen";

  const SavedNewsDetailsScreen(
    {
      Key? key,
    }) : super(key: key);

  @override
  State<SavedNewsDetailsScreen> createState() => _SavedNewsDetailsScreenState();
}

class _SavedNewsDetailsScreenState extends State<SavedNewsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final article = arguments["article"];
    // final  author = arguments["author"];
    // final name = arguments["name"];
    // final title = arguments["title"];
    // final description = arguments["description"];
    // final urlToImage = arguments["urlToImage"];

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
                      // title.toString(),
                      article.title.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20
                      ),
                    ),
                    const SizedBox(height: 20,),

                    /// Source
                    Text(
                      // name.toString(),
                      article.source!.name.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 20,),

                    /// Image
                    SizedBox(
                      child: Image.network(
                        // urlToImage.toString(),
                        article.urlToImage.toString(),
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
                      // author.toString(),
                      article.author.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),

                    const SizedBox(height: 20,),

                    /// Description
                    // Text(description.toString(),)
                    Text(article.description.toString(),)
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
