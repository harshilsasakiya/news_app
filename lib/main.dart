import 'package:flutter/material.dart';
import 'package:untitled/service/api_service.dart';

import 'model/article.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('News App'),
        ),
        body: FutureBuilder(
          future: apiService.getArticle(),
          builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, index){
                  return Card(
                    elevation: 15,
                    child: ListTile(
                      title: Text('${snapshot.data![index].title}'),
                      subtitle: Text('${snapshot.data![index].description}'),
                      trailing: Text('${snapshot.data![index].author}'),
                    ),
                  );
                },
              );
            } return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
    );
  }
}
