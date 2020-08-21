import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> labels;
  String selected;

  @override
  void initState() {
    super.initState();
    labels = ['All', 'None', 'One', 'Two', 'Lunch', 'Dinner'];
    selected = labels[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Chip Demo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Semantics(
            label: 'Items',
            hint: 'test',
            customSemanticsActions: {
              for (int i = 0; i < labels.length; i++)
                CustomSemanticsAction(label: '${labels[i]}'): () {
                  setState(() {
                    selected = labels[i];
                  });
                }
            },
            child: ExcludeSemantics(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: labels
                      .map<Widget>(
                        (e) => Semantics(
                          selected: selected == e,
                          button: true,
                          child: FlatButton(
                            key: ValueKey(e),
                            onPressed: () {
                              setState(() {
                                selected = e;
                              });
                            },
                            child: Chip(
                              label: Text(e),
                              backgroundColor:
                                  selected == e ? Colors.blue[700] : null,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
          Text('Content content content'),
        ],
      ),
    );
  }
}
