import 'package:flutter/material.dart';
import 'package:rxdart_bloc_02/screens/search_users.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Chats", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
        centerTitle: true,
        elevation: 0,
        actions:  [
          InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchUsers())),
            child: Padding(
              padding: const EdgeInsets.only(right: 0.0),
              child: Image.asset('assets/images/search_03.jpg', height: 60, width: 60,),
            ),
          ),
        ],
      ),
      body: const Center(child: Text("No Recent Chat", style: TextStyle(color: Colors.grey),),),
    );
  }
}



