import 'package:advanced_python_project/pages/lookup_search_page.dart';
import 'package:advanced_python_project/pages/reddit_search_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Stocks")),
        toolbarHeight: MediaQuery.of(context).size.height / 10,
        backgroundColor: const Color.fromARGB(255, 22, 35, 40),
      ),
      body: Container(
        color: const Color.fromRGBO(34, 52, 60, 1),
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 4,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          const RedditSearchPage(),
                    ));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    alignment: Alignment.center,
                    color: Colors.green,
                    child: const Text(
                      "Top Reddit Stocks",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const LookUpSearchPage(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    alignment: Alignment.center,
                    color: Colors.yellow[700],
                    child: const Text(
                      "Look Up Stocks",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
