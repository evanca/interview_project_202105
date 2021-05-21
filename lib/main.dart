import 'package:flutter/material.dart';
import 'package:interview_project_202105/data/user_api_provider.dart';
import 'package:interview_project_202105/ui/main_user_row.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Stream<List<Map>> _stream() async* {
    // The initial data:
    yield await UserApiProvider().fetchUsers();
    // Check back every 10 minutes:
    yield* Stream.periodic(Duration(minutes: 10), (_) {
      print("Checking for data updates: ${DateTime.now()}");
      return UserApiProvider().fetchUsers();
    }).asyncMap((event) async => await event);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: StreamBuilder(
            stream: _stream(),
            builder: (context, snapshot) {
              if (snapshot.hasData)
                return ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    // Generate a color based on list index:
                    Color circleColor =
                        Color((index + 1) * 0xFFE1BE7).withOpacity(.5);
                    return userRow(context, snapshot.data[index], circleColor);
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                );
              else if (snapshot.data == []) {
                return Text(
                    "No users fetched. Please check your internet connection.");
              } else
                return Center(child: CircularProgressIndicator());
            }));
  }
}
