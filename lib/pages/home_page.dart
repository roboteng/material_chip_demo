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
    labels = [
      'All',
      'None',
      'One',
      'Two',
      'Lunch',
      'Dinner',
      'Games',
      'Christmas',
    ];
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
            hint: selected,
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
                        (e) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ChoiceChip(
                            selected: selected == e,
                            label: Text(e),
                            onSelected: (bool select) {
                              setState(() {
                                selected = e;
                              });
                            },
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
          Text('Content content content'),
          Text('You have selected: $selected'),
        ],
      ),
    );
  }
}
