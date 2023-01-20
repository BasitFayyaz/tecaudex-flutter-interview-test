import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:interview/Avatar.dart';

import 'package:interview/data/user.dart';
import 'package:interview/data/mock_data.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final searchController = TextEditingController();

  var users = User.fromJsonToList(allData());
  String? keyword="";


  @override
  void initState() {
    searchController.addListener((){
      setState(() {
        keyword = searchController.text;
      });
    });
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  _filterList() {
  }


  @override
  Widget build(BuildContext context) {


    _getUserAvatar(url) {
      return CircleAvatar(backgroundImage:   NetworkImage(url));
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('The Interview'),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchController,
                focusNode: primaryFocus,

                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Flexible(
            child: ListView.builder(

              itemCount: users.length,
              itemBuilder: (context, index) {

                if (users[index]
                    .firstName
                    .toString()
                    .toLowerCase()
                    .contains(keyword!.toLowerCase()) ||
                    users[index]
                        .firstName
                        .toString()
                        .toLowerCase()
                        .contains(keyword!.toLowerCase()) ||
                    users[index]
                        .role
                        .toString()
                        .toLowerCase()
                        .contains(keyword!.toLowerCase()) ||
                    users[index]
                        .email
                        .toString()
                        .toUpperCase()
                        .contains(keyword!.toUpperCase())){
                  return ListTile(

                    leading: Avatar(avatar: users[index].avatar ?? ""),


                    title: Text("${users[index].firstName} ${users[index].lastName}"),

                    subtitle: Text("${users[index].role}"),
                  );

                } else{
                  return const SizedBox();
                }


              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            users.add(User(

                id: "b32ec56c-21bb-4b7b-a3a0-635b8bca1f9d",
                avatar: null,
                firstName: "James",
                lastName: "May",
                email: "ssaull1c@tripod.com",
                role: "Developer"
            ));
          });

        },
        tooltip: 'Add new',
        child: Icon(Icons.add),
      ),
    );
  }
}
