import 'package:flutter/material.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:tutorinv/model/category.dart';
import 'package:tutorinv/model/services.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/searchscreen';
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  List<Category> categories = List();
  List<Category> filtered = List();

  @override
  void initState() { 
    super.initState();
    Services.getCategories().then((categoriesFromServer) {
      setState(() {
        categories = categoriesFromServer;
        filtered = categories;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buscar', 
          style: TextStyle(
            color: Colors.blueGrey
            )
          ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      /*
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SearchBar(
              onSearch: (string){
              setState(() {
                filtered = categories.where((u) => (u.subject
                .toLowerCase()
                .contains(string.toLowerCase()) ||
                u.description.toLowerCase().contains(string.toLowerCase())))
                .toList();
              });
            },
              hintText: 'Buscar...',
              loader: Center(
                child: Text('Cargando...'),
              ),
              cancellationWidget: Text("Cancelar"),
            ),
          ),
          
        ),
      */
      body: Container(
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        icon: Icon(Icons.search),
                        hintText: 'Buscar...',
                      ),
                      onChanged: (string){
                        setState(() {
                          filtered = categories.where((u) => (u.subject
                          .toLowerCase()
                          .contains(string.toLowerCase()) ||
                          u.description.toLowerCase().contains(string.toLowerCase())))
                          .toList();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(10.0),
                itemCount: filtered.length,
                itemBuilder: (BuildContext context, int index){
                  return Card(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image.network(
                            (filtered[index].image),),
                          SizedBox(height: 5.0,),
                          Text(
                            filtered[index].subject,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}