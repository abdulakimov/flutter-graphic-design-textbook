import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:graphic_design_textbook/data/menu_data.dart';
import 'package:graphic_design_textbook/screens/books_screen.dart';
import 'package:graphic_design_textbook/screens/home_screen.dart';
import 'package:graphic_design_textbook/screens/videos_screens.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  Future<void> share() async {
    await FlutterShare.share(
        title: 'Test share',
        text: 'Test share text',
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Test Chooser Title');
  }

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F9),
      appBar: AppBar(
        title: const Text("Grafik Dizayn"),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: IconButton(
                onPressed: widget.share,
                tooltip: "Ulashish",
                icon: const Icon(
                  FluentSystemIcons.ic_fluent_share_android_regular,
                  size: 28,
                )),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              padding: const EdgeInsets.all(0),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue, Colors.cyan],
                  ),
                ),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "Graphic design Textbook",
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          HomeScreen(),
          BooksScreen(),
          VideosScreen(),
          Center(
            child: Text("Profile"),
          ),
        ],
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: List.generate(menu.length, (index) {
          return SalomonBottomBarItem(
            title: menu[index]["title"],
            icon: menu[index]["icon"],
          );
        }),
      ),
    );
  }
}
