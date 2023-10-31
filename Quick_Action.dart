dependencies:
  cupertino_icons: ^1.0.2
  flutter:
    sdk: flutter
  quick_actions: ^1.0.6  // Add this package 

// Make Sure Android (minsdkversion is 16 above ) Ios ( 9 above )

// Add ICONS  from https://fonts.google.com/ by downloading in Png
// Android add these icons in drawable folder foun in main
// Ios add these icons in Assets.xcassets found in Runner    

import 'package:example/Call_Page.dart';
import 'package:example/Chat_Page.dart';
import 'package:example/Search_Page.dart';
import 'package:flutter/material.dart';
import 'package:quick_actions/quick_actions.dart';

class QuickActionApp extends StatefulWidget {
  const QuickActionApp({super.key});

  @override
  State<QuickActionApp> createState() => _QuickActionAppState();
}

class _QuickActionAppState extends State<QuickActionApp> {
  QuickActions quickactions=const QuickActions();
  
  @override
  void initState() {
    quickactions.initialize((type) {
      if(type=='search'){
        Navigator.push(context, MaterialPageRoute(builder:(context) {
          return SearchPage();
        },));
      }
      if(type=='chat'){
        Navigator.push(context, MaterialPageRoute(builder:(context) {
          return ChatPage();
        },));
      }
      if(type=='call'){
        Navigator.push(context, MaterialPageRoute(builder:(context) {
          return CallPage();
        },));
      }
    });
    quickactions.setShortcutItems([
      const ShortcutItem(type: 'search', localizedTitle: 'Search',
      icon: 'search'),
      const ShortcutItem(type: 'chat', localizedTitle: 'Chat',
      icon: 'chat'),
      const ShortcutItem(type: 'call', localizedTitle: 'Call',
      icon: 'call')
    ]);
    super.initState();
  }
  @override
  void dispose() {
    quickactions.clearShortcutItems();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.indigo,
          title: const Text(
            'Quick Action App ',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 250,
                color: Colors.indigo,
                child: const Center(
                    child: Icon(Icons.home, size: 100, color: Colors.white)),
              ),
              const SizedBox(height: 15),
              const Text(
                'Home Page ',
                style: TextStyle(
                    fontSize: 40,
                    color: Color.fromARGB(255, 62, 61, 61),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ));
  }
}
