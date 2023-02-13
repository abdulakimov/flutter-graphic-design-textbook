import 'package:flutter/material.dart';
import 'package:graphic_design_textbook/data/videos_data.dart';
import 'package:graphic_design_textbook/screens/document_screen.dart';
import 'package:graphic_design_textbook/screens/video_player_screen.dart';
import 'package:line_icons/line_icons.dart';

class VideosScreen extends StatefulWidget {
  const VideosScreen({super.key});

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        VideoPlayerScreen(video: videos[index]),
                  ));
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                      color: Color(0xFFF8F8F9).withOpacity(0.1),
                      spreadRadius: 10,
                      blurRadius: 10),
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        videos[index]["title"],
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Icon(LineIcons.arrowRight)
                  ],
                ),
              ),
            ),
          ),
        );
      },
      itemCount: videos.length,
    );
  }
}
