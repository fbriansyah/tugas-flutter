import 'package:flutter/material.dart';

class MChip {
  @required
  String label;
  @required
  bool isActive;

  MChip(this.label, this.isActive);

  toggle() {
    isActive = !isActive;
  }
}

class WAddCard extends StatefulWidget {
  const WAddCard({Key key}) : super(key: key);

  @override
  _WAddCardState createState() => _WAddCardState();
}

class _WAddCardState extends State<WAddCard> {
  List<MChip> _chips = [
    MChip('Javascript', false),
    MChip('HTML', false),
    MChip('CSS', false),
    MChip('JAVA', false),
    MChip('Dart', true),
    MChip('Add', true),
  ];

  Widget _addChipBuilder({String label, VoidCallback onPressed}) {
    return ActionChip(
      avatar: CircleAvatar(
        backgroundColor: Colors.green[300],
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      label: Text(
        label,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.green,
      onPressed: onPressed,
    );
  }

  Widget _chipBuilder({MChip chipData, VoidCallback onPressed}) {
    return ActionChip(
      backgroundColor: chipData.isActive ? Colors.cyan : Colors.grey[300],
      label: Text(
        chipData.label,
        style: TextStyle(
          color: chipData.isActive ? Colors.white : Colors.black,
        ),
      ),
      onPressed: onPressed,
    );
  }

  _chipToggle(int index) {
    setState(() {
      _chips[index].toggle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      child: Container(
        width: 350,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Belajarku hari ini...',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/camera');
              },
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [0.1, 0.5, 0.7, 0.9],
                    colors: [
                      Colors.purple[800],
                      Colors.purple[700],
                      Colors.purple[600],
                      Colors.purple[400],
                    ],
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.add_a_photo,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
              children: List.generate(_chips.length, (index) {
                return index == (_chips.length - 1)
                    ? _addChipBuilder(
                        label: _chips[index].label,
                        onPressed: () {},
                      )
                    : _chipBuilder(
                        chipData: _chips[index],
                        onPressed: () {
                          _chipToggle(index);
                        },
                      );
              }),
            )
          ],
        ),
      ),
    );
  }
}
