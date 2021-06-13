import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wellpaperapp/data/data.dart';
import 'package:wellpaperapp/model/wallpaper_model.dart';
import 'package:wellpaperapp/widgets/widget.dart';


class Categorie extends StatefulWidget {
   final String categorieName;
  Categorie({required this.categorieName});

  @override
  _CategorieState createState() => _CategorieState();
}

class _CategorieState extends State<Categorie> {
 
    List<WallpaperModel> wallpapers = [];


    getSearchWallpaper(String query) async {
    var response = await http.get(
        Uri.parse(
          "https://api.pexels.com/v1/search?query=$query&per_page=20",
        ),
        headers: {"Authorization": apiKey});
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element) {
      WallpaperModel wallpaperModel = new WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    getSearchWallpaper(widget.categorieName);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: brandName(),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [

              SizedBox(
                height: 16,
              ),
      
              WallpapersList(wallpapers: wallpapers, context: context)
            ],
          ),
        ),
      ),
    );
  }
}