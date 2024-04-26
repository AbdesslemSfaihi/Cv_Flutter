import 'package:flutter/material.dart';

class GlobalParams {
  static List<Map<String, dynamic>> menus = [
    {
      "title": "Acceuil",
      "icon": Icon(
        Icons.home_filled,
        color: Colors.indigo,
      ),
      "route": "/home"
    },
    {
      "title": "Météo",
      "icon": Icon(
        Icons.sunny_snowing,
        color: Colors.indigo,
      ),
      "route": "/meteo"
    },
    {
      "title": "Gallerie",
      "icon": Icon(
        Icons.image_rounded,
        color: Colors.indigo,
      ),
      "route": "/gallerie"
    },
    {
      "title": "Pays",
      "icon": Icon(
        Icons.maps_home_work_rounded,
        color: Colors.indigo,
      ),
      "route": "/pays"
    },
    {
      "title": "Contact",
      "icon": Icon(
        Icons.contact_page_rounded,
        color: Colors.indigo,
      ),
      "route": "/contact"
    },
    {
      "title": "Paramètres",
      "icon": Icon(
        Icons.settings,
        color: Colors.indigo,
      ),
      "route": "/parametres"
    },
  ];

  static List<Map<String, dynamic>> accueil = [
    {"title": "images/meteo.png", "route": "/meteo"},
    {"title": "images/gallerie.png", "route": "/gallerie"},
    {"title": "images/pays.png", "route": "/pays"},
    {"title": "images/contact.png", "route": "/contact"},
    {"title": "images/parametres.png", "route": "/parametres"},
  ];
}