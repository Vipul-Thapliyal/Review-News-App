import 'package:flutter/material.dart';
import 'package:news_app/Provider/saved_Articles_Screen_Provider.dart';
import 'package:provider/provider.dart';

class SavedNewsDetailsScreen extends StatefulWidget {
  int? index;

  SavedNewsDetailsScreen(
    {
      Key? key,
      required this.index,
    }) : super(key: key);

  @override
  State<SavedNewsDetailsScreen> createState() => _SavedNewsDetailsScreenState();
}

class _SavedNewsDetailsScreenState extends State<SavedNewsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final saveArticleListProvider = Provider.of<SavedArticleScreenProvider>(context, listen: false);


    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.black,
              size: 35,
            ),
          ),
          actions: [
            Wrap(

              spacing: 12, // space between two icons
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Icon(
                    Icons.bookmark_border,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15,right: 10),
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
              physics: ScrollPhysics(),
              child: Container(
                padding: EdgeInsets.all(10),
                // height: screenHeight * 0.8,
                child: Column(
                  children: [
                    /// Title
                    Text(
                      // "${widget.title}",
                      saveArticleListProvider.savedArticlesList[widget.index!].title.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20
                      ),
                    ),
                    SizedBox(height: 20,),

                    /// Source
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Text(""
                        //     "${widget.name.toString()}",
                        //   style: TextStyle(
                        //     fontWeight: FontWeight.w600,
                        //   ),
                        // )
                      ],
                    ),

                    SizedBox(height: 20,),

                    /// Image
                    SizedBox(
                      // height: 100.0,
                      // width: 50.0, // fixed width and height
                        child: Image.network(
                          // widget.urlToImage.toString(),
                          saveArticleListProvider.savedArticlesList[widget.index!].urlToImage.toString(),
                          loadingBuilder: (context, child, loadingProgress) {
                            if(loadingProgress == null) {
                              return child;
                            }
                            else {
                              return Center(
                                child: Text("Loading.."),
                              );
                            }
                          },
                          errorBuilder: (context, exception, stackTrace) {
                            return Icon(Icons.error);
                          },
                        )
                    ),

                    /// Author
                    Text(
                      // "${widget.author.toString()}",
                      saveArticleListProvider.savedArticlesList[widget.index!].author.toString(),

                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20
                      ),
                    ),

                    SizedBox(height: 20,),

                    /// Description
                    Container(
                      child: Text(
                          // "${widget.description.toString()}"
                        saveArticleListProvider.savedArticlesList[widget.index!].description.toString(),

                      ),
                    )

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
