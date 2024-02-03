import 'package:advanced_python_project/pages/reddit_stocks.dart';
import 'package:flutter/material.dart';

class RedditSearchPage extends StatefulWidget {
  const RedditSearchPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RedditSearchPageState();
}

class _RedditSearchPageState extends State<RedditSearchPage> {
  String searchEntry="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: const Color.fromRGBO(34, 52, 60, 1),
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width/2,
        height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                TextFormField(
                  style: const TextStyle(color: Colors.white),
                  onChanged: (value) => searchEntry,
                ),
                TextButton(onPressed: (){
                  Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>  RedditStocksPage(ticker: searchEntry,),
                              ),
                            );
                }, child: const Text("Enter")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
