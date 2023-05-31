import 'package:flutter/material.dart';
import 'package:news_app/Provider/home_Screen_Provider.dart';
import 'package:provider/provider.dart';

class SelectedNewsDetailsScreen extends StatefulWidget {
  var uniqueId;
  int? index;
  String? author;
  String? name;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  SelectedNewsDetailsScreen(
    {
      Key? key,
      required this.uniqueId,
      required this.index,
      required this.author,
      required this.name,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content,
    }) : super(key: key);

  @override
  State<SelectedNewsDetailsScreen> createState() => _SelectedNewsDetailsScreenState();
}

class _SelectedNewsDetailsScreenState extends State<SelectedNewsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final homeScreenProvider = Provider.of<HomeScreenProvider>(context, listen: false);
    homeScreenProvider.getNewsResponse(context);

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
                      "${widget.title}",
                      // homeScreenProvider.articlesList[widget.index!].title.toString(),

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
                        Text(""
                          "${widget.name.toString()}",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),

                    SizedBox(height: 20,),

                    /// Image
                    SizedBox(
                        // height: 100.0,
                        // width: 50.0, // fixed width and height
                        child: Image.network(
                          widget.urlToImage.toString(),
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
                      "${widget.author.toString()}",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20
                      ),
                    ),

                    SizedBox(height: 20,),

                    /// Description
                    Container(
                      child: Text(
                        "${widget.description.toString()}"
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