import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        color: const Color.fromRGBO(34, 52, 60, 1),
        child: const Center(
          
          child:  SizedBox(
            width: 300,
            height: 300,
            child: CircularProgressIndicator(
              
            ),
          ),
        ),
      ),
    );
  }
}
