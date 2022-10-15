import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/Model/model.dart';
import 'package:myapp/Views/Search/search_display_screen.dart';


class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate(var this.listOfStudents);
  List<dynamic> listOfStudents;

  @override
  List<Widget>? buildActions(BuildContext context) {
    // IconButton(
    //     onPressed: () {
    //       query = '';
    //     },
    //     icon: const Icon(Icons.clear));
  }

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    final matchQuery = listOfStudents
        .toList()
        .where((element) =>
        element.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return matchQuery.isEmpty
        ? Center(
        child: Lottie.network(
            'https://assets4.lottiefiles.com/packages/lf20_tmsiddoc.json'))
        : ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: ((context, index) {
          DataBase result = matchQuery[index];
          return ListTile(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SearchDetailsScreen(
                  result: result,
                ),
              ),
            ),
            title: Text(result.name),
          );
        }));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final matchQuery = listOfStudents
        .toList()
        .where((element) =>
        element.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return matchQuery.isEmpty
        ? Center(
        child: Center(
            child: Lottie.network(
                'https://assets4.lottiefiles.com/packages/lf20_tmsiddoc.json')))
        : ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: ((context, index) {
          DataBase result = matchQuery[index];
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  // gradient: const LinearGradient(
                  //   begin: Alignment.topRight,
                  //   end: Alignment.bottomLeft,
                  //   colors: [
                  //     Colors.blue,
                  //     Colors.blueGrey,
                  //   ],
             //     )
                color: Colors.blueGrey[100]
            ),
              child: ListTile(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SearchDetailsScreen(
                      result: result,
                    ),
                  ),
                ),
                leading: CircleAvatar(
                  radius: 27,
                  backgroundImage: FileImage(
                    File(result.image),
                  ),
                ),
                title: Text(result.name),
                subtitle: Text(result.age),
              ),
            ),
          );
        }));
  }
}
