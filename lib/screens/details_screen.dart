import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({super.key, this.book});
  final book;
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book['title']),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Text(widget.book["body"]),
          )
        ],
      )),
    );
  }
}
