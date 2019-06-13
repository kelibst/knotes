import 'package:flutter/material.dart';

class NoteDetails extends StatefulWidget {
  String appBarTitle;
  NoteDetails(this.appBarTitle);
  @override
  _NoteDetailsState createState() => _NoteDetailsState(this.appBarTitle);
}

class _NoteDetailsState extends State<NoteDetails> {
  static var _priorities = ['High', 'Low'];
  String appBarTitle;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionControl = TextEditingController();
  _NoteDetailsState(this.appBarTitle);
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    var raisedColor = Colors.blueGrey;
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: DropdownButton(
                items: _priorities.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem));
                }).toList(),
                style: textStyle,
                value: 'Low',
                onChanged: (valueSelectedByUser) {
                  debugPrint('The user just clicked $valueSelectedByUser');
                },
              ),
            ),

            //second Element
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  debugPrint('$value clicked');
                },
                controller: titleController,
                style: textStyle,
                decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ),

            //description field

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: descriptionControl,
                style: textStyle,
                decoration: InputDecoration(
                  labelText: 'Description',
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
                onChanged: (value) {
                  debugPrint('$value clicked');
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: raisedColor,
                      textColor: Colors.white,
                      child: Text(
                        'Save',
                      textScaleFactor: 1.5),
                      onPressed: () {
                        setState(() {
                          debugPrint('Save is Clicked');
                        });
                      },
                    ),
                  ),
                  Container(
                    width: 5.0,
                  ),
                  Expanded(
                    child: RaisedButton(
                      color: raisedColor,
                      textColor: Colors.white,
                      child: Text(
                        'Delete',textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        setState(() {
                          debugPrint('Delete is Clicked');
                        });
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
