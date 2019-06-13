import 'package:flutter/material.dart';
import 'package:knotes/Screens/NoteDetails.dart';

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Knotes'),
      ),
      body: getNoteListView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Add Notes',
        onPressed: () {
          debugPrint('FAB clicked!!');
          navigateToNoteDetails('Add Note');
        },
      ),
    );
  }

  ListView getNoteListView() {
    TextStyle textStyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            onTap: () {
              debugPrint('note isclicked!!');
              navigateToNoteDetails('Edit Note');
            },
            leading: CircleAvatar(
              backgroundColor: Colors.yellowAccent,
              child: Icon(Icons.face),
            ),
            title: Text('Dummy title',style: textStyle,),
            subtitle: Text('Date should go here '),
            trailing: Icon(Icons.delete),
          ),
        );
      },
    );
  }

  void navigateToNoteDetails(String title) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NoteDetails(title);
    }));
  }
}
