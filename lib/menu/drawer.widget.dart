import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../config/global.params.dart';

class MyDrawer extends StatelessWidget {
  late SharedPreferences prefs;

  MyDrawer({super.key}); // Déclaration de SharedPreferences

  // Helper method to handle navigation and preferences


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Colors.grey,
                  Colors.lightBlue,
                ],
              ),
            ),
            child: Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('images/profil.jpg'),
                  ),
                  SizedBox(height: 10,),
                  Text("Sfaihi Abdesslem",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)
                  )
                ],
              ),
            ),
          ),
          ...(GlobalParams.menus as List<Map<String, dynamic>>).map((item) {
            return ListTile(
              title: Text(item['title'] as String),
              leading: item['icon'] as Icon,
            );
          }).toList(),
        ],
      ),
    );
  }
}
