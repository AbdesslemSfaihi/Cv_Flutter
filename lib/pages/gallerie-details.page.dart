import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'dart:collection';

class GallerieDetails extends StatefulWidget {
  final String keyword;

  GallerieDetails(this.keyword);

  @override
  State<GallerieDetails> createState() => _GallerieDetailsState();
}

class _GallerieDetailsState extends State<GallerieDetails> {
  var gallerieData;
  int currentPage = 1;
  int size = 10;
  late int totalPages;
  ScrollController _scrollController = new ScrollController();
  List<dynamic>hits = [];

  @override
  void initState() {
    super.initState();
    getGallerieData(widget.keyword);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (currentPage < totalPages) {
          currentPage++;
          getGallerieData(widget.keyword);
        }
      }
    });
  }

  void getGallerieData(String keyword) {
    print("Gallerie de " + keyword);
    String url =
        "https://pixabay.com/api/?key=15646595-375eb91b3408e352760ee72c8&q=${keyword}&page=${currentPage}&per_page=${size}";
    http.get(Uri.parse(url)).then((resp) {
      setState(() {
        this.gallerieData = json.decode(resp.body);
        hits.addAll(gallerieData['hits']);
        totalPages=(gallerieData['totalHits']/size).ceil();
        //print(gallerieData);
      });
    }).catchError((err) {
      print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: totalPages == 0
              ? Text('Pas de résultats')
              : Text("${widget.keyword}, Page ${currentPage}/${totalPages}",)),
        body: (gallerieData == null
            ? Center(
          child: CircularProgressIndicator(),
        )
            : ListView.builder(
            itemCount: (gallerieData == null ? 0 : hits.length),
          controller: _scrollController,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Card(
                    color: Colors.blue,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                        child: Text(
                          hits[index]['tags'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Card(
                      child: Image.network(
                        hits[index]['webformatURL'], // Afficher la photo depuis l'URL
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              );
            },
        )),
    );
  }

  @override
  void dispose() {
// TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }
}