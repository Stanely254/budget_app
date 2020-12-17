import 'package:budget_app/AppState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends StatefulWidget {
  final GlobalKey<ScaffoldState> _globalKey;
  HomeDrawer(this._globalKey);

  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Drawer(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 700),
        color: appState.dark ? Color(0xFF0b313b) : Colors.white,
        child: Stack(
          children: [
            ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DrawerHeader(
                    decoration: BoxDecoration(
                        color: appState.dark
                            ? Color(0xFF06232c)
                            : Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 50,
                    ),
                  )),
                  ListTile(
                    title: Text("Show Intro"),
                  ),
                  ListTile(
                    title: Text("Import/Export")
                  ),
                  ListTile(
                    title: Text("Give Feedback")
                  ),
                  ListTile(
                    title: Text("About")
                  ),
                  ListTile(
                    title: Text("Settings")
                  )
              ],
            )
          ],
        ),
      )
    );
  }
}
