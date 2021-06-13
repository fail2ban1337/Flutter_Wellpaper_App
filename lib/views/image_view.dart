import 'package:flutter/material.dart';

class ImageView extends StatefulWidget {
  final String imgUrl;
  ImageView({required this.imgUrl});

  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Hero(
          tag: widget.imgUrl
          ,child: Container(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,child: Image.network(widget.imgUrl, fit: BoxFit.cover),)),
        Container(
          child: Column(children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0x36FFFFFF),
                   Color(0x36FFFFFF),
                ])
              ),
              child: 
            Column(children: [
              Text("Set Wallpaper"),
              Text("Image will be saved in gallery")
            ],),),
            Text("Cancel", style: TextStyle(color: Colors.white),)
          ],),
        )
      ],),
    );
  }
}