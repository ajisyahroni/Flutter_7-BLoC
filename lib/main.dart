import 'package:bloc_native/color_bloc.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _title = 'BloC from Scracth';
  ColorBloc colorBloc = ColorBloc();

  @override
  void dispose() {
    // close sink
    colorBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                colorBloc.eventSink.add(ColorEvent.to_amber);
              },
              backgroundColor: Colors.amber,
            ),
            SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              onPressed: () {
                colorBloc.eventSink.add(ColorEvent.to_light_blue);
              },
              backgroundColor: Colors.lightBlue,
            ),
          ],
        ),
        body: Center(
          child: StreamBuilder(
            stream: colorBloc.stateStream,
            initialData: Colors.amber,
            builder: (context, snapshot) {
              return AnimatedContainer(
                decoration: BoxDecoration(
                    color: snapshot.data,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                duration: Duration(milliseconds: 500),
                width: 100,
                height: 100,
              );
            },
          ),
        ),
      ),
    );
  }
}
