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
          width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end
            ,children: [
            Container(
              width: MediaQuery.of(context).size.width / 2,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white54,width: 1),
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(colors: [
                  Color(0x36FFFFFF),
                   Color(0x36FFFFFF),
                ])
              ),
              child: 
            Column(children: [
              Text("Set Wallpaper",style: TextStyle(fontSize: 16,color: Colors.white),),
              Text("Image will be saved in gallery",style: TextStyle(fontSize: 10,color: Colors.white),)
            ],),),
            SizedBox(height: 16,),
            Text("Cancel", style: TextStyle(color: Colors.white),),
            SizedBox(height: 50,)
          ],),
        )
      ],),
    );
  }
}