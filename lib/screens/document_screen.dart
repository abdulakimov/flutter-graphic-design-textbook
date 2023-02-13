import 'package:flutter/material.dart';

class DocumentScreen extends StatefulWidget {
  const DocumentScreen({super.key});

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("O'qituvchi dasturi"),
      ),
      body: Center(
        child: Container(
          width: size.width - 30,
          height: size.height - 100,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/document.jpg",
                ),
                fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}
