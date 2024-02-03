import 'package:advanced_python_project/pages/reddit_stocks.dart';
import 'package:flutter/material.dart';

class LookUpSearchPage extends StatefulWidget {
  const LookUpSearchPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LookUpSearchPageState();
}

class _LookUpSearchPageState extends State<LookUpSearchPage> {
  String searchEntry = "initial";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: const Color.fromRGBO(34, 52, 60, 1),
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                TextFormField(
                  style: const TextStyle(color: Colors.white),
                  onChanged: (value) {searchEntry=value;}),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => RedditStocksPage(
                            ticker: searchEntry,
                          ),
                        ),
                      );
                    },
                    child: const Text("Enter")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
