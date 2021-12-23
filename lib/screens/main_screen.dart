import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:rxdart_bloc_02/blocs/navbar_bloc.dart';
import 'package:rxdart_bloc_02/screens/about_screen.dart';
import 'package:rxdart_bloc_02/screens/home_screen.dart';
import 'package:rxdart_bloc_02/screens/profile_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final NavBarBloc _navBarBloc = NavBarBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: StreamBuilder<NavBarItem>(
          stream: _navBarBloc.navbarData,
          initialData: _navBarBloc.defaultItem,
          // ignore: missing_return
          builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
            switch (snapshot.data) {
              case NavBarItem.HOME:
                return const HomeScreen();
              case NavBarItem.PROFILE:
                return const ProfileScreen();
              case NavBarItem.ABOUT:
                return const AboutScreen();
            }
            return Container();
          },
        ),
      ),
      bottomNavigationBar: StreamBuilder(
        stream: _navBarBloc.navbarData,
        initialData: _navBarBloc.defaultItem,
        builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade100,
                    spreadRadius: 0,
                    blurRadius: 10),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.white,
                iconSize: 20,
                unselectedItemColor: Colors.grey,
                unselectedFontSize: 9.5,
                selectedFontSize: 9.5,
                type: BottomNavigationBarType.fixed,
                fixedColor: const Color(0xFFF6511D),
                currentIndex: snapshot.data!.index,
                onTap: _navBarBloc.pickItem,
                items: const [
                  BottomNavigationBarItem(
                    title: Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text("Home",
                            style: TextStyle(fontWeight: FontWeight.w600))),
                    icon: Icon(EvaIcons.homeOutline),
                    activeIcon: Icon(EvaIcons.home),
                  ),
                  BottomNavigationBarItem(
                    title: Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text("Profile",
                            style: TextStyle(fontWeight: FontWeight.w600))),
                    icon: Icon(EvaIcons.gridOutline),
                    activeIcon: Icon(EvaIcons.grid),
                  ),
                  BottomNavigationBarItem(
                    title: Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text("About",
                            style: TextStyle(fontWeight: FontWeight.w600))),
                    icon: Icon(EvaIcons.inboxOutline),
                    activeIcon: Icon(EvaIcons.infoOutline),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
