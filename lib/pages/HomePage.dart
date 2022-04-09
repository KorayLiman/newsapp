import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:news/pages/PoliticsPage.dart';
import 'package:news/pages/WorldPage.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'BusinessPage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.OnThemeSwitch}) : super(key: key);
  final Function OnThemeSwitch;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final TabController MyTabController;
  late BusinessPage TP;
  late WorldPage HP;
  late PoliticsPage SP;
  var KeyTP = PageStorageKey("Key_TP");
  var KeyHP = PageStorageKey("Key_HP");
  var KeySP = PageStorageKey("Key_SP");

  late bool IsLight;
  int _currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MyTabController = TabController(length: 3, vsync: this);
    TP = BusinessPage(
      key: KeyTP,
    );
    HP = WorldPage(
      key: KeyHP,
    );
    SP = PoliticsPage(
      key: KeySP,
    );
    IsLight = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: Column(
        children: [
          UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orange,
                child: const Text("KL"),
              ),
              accountName: const Text("Welcome"),
              accountEmail: const Text("")),
          AboutListTile(
            child: Text("About"),
            applicationName: "News",
            applicationIcon: Icon(Icons.question_answer_outlined),
            applicationVersion: "v1.0",
            aboutBoxChildren: [
              Text(
                  "This application made with http. News are getted from newsapi.org")
            ],
            icon: Icon(Icons.question_answer_outlined),
          )
        ],
      )),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        items: [
          SalomonBottomBarItem(
              selectedColor: Colors.purple,
              icon: Icon(Icons.home),
              title: const Text("Home")),
          SalomonBottomBarItem(
              selectedColor: Colors.pink,
              icon: Icon(Icons.favorite_border),
              title: const Text("Likes")),
          SalomonBottomBarItem(
            icon: Icon(Icons.search),
            title: Text("Search"),
            selectedColor: Colors.orange,
          ),
          SalomonBottomBarItem(
              selectedColor: Colors.blue,
              icon: Icon(Icons.question_mark),
              title: const Text("About me")),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                widget.OnThemeSwitch(IsLight);
                IsLight = !IsLight;

                // AwesomeDialog(
                //     context: context,
                //     dialogType: DialogType.INFO,
                //     title: "Switch to Dark Mode",
                //     btnCancelOnPress: () {},
                //     btnOkOnPress: () {})
                //   ..show();
              },
              icon: Icon(Icons.dark_mode))
        ],
        bottom: TabBar(controller: MyTabController, tabs: [
          Tab(
            child: Text("Turkey"),
          ),
          Tab(
            child: Text("Health"),
          ),
          Tab(
            child: Text("Sports"),
          ),
        ]),
        centerTitle: true,
        title: FittedBox(
          child: Text(
            "News App Created by Koray Liman",
          ),
        ),
      ),
      body: TabBarView(controller: MyTabController, children: [
        BusinessPage(
          key: KeyTP,
        ),
        WorldPage(
          key: KeyHP,
        ),
        PoliticsPage(
          key: KeySP,
        )
      ]),
    );
  }
}
