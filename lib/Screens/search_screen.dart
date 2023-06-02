import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController userInput = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Screen"),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            child: ListTile(
              title: TextFormField(
                controller: userInput,
                textDirection: TextDirection.ltr,
                keyboardType: TextInputType.name,
                autofocus: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: "Search",
                ),
              ),
              trailing: const Icon(Icons.search),
            ),
          ),
        ],
      ),
    );
  }
}
