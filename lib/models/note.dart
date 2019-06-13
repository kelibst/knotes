class Note{
//writing the models for the database

  int _id;
  int _priorities;
  String _title;
  String _description;
  String _date;

//initializing the variable for the database

  Note(this._title, this._date, this._id, this._priorities, [this._description]);

  Note.withId(this._id, this._title, this._date, this._priorities, this._description);

//setting getter for all the private variables

  int get id => _id;

  String get title => _title;

  String get description => _description;

  int get priority => _priorities;

  String get date => _date;

  // setting the setter for all the variables except the id. cos the id in the database will be generated automatically

  set title(String newTitle){
    if(newTitle == null){
      //we should reming the user to insert some values for title or the note will not be created

    }else{
      
        this._title = newTitle;
      
    }
  }
  set description(String newDescription){
    this._description = newDescription; 
  }
  set priorities(int newPriority){
    if(newPriority >= 1 && newPriority <= 2){
      this._priorities = newPriority; 
  }
    }
    set date (String newDate){
      this._date= newDate;
    }

    //function to convert a note object to map object

   Map<String, dynamic> toMap(){
      var map = Map<String, dynamic>();
      if (id !=null){
        map['id'] = _id;
      }
      map['title'] = _title;
      map['description'] = _description;
      map['priority'] = _priorities;
      map['date'] = _date;

      return map;
   }

   //extract a note object from a map object
   Note.fromMapObject(Map<String, dynamic> map){
     this._id = map['id'];
     this._date = map['date'];
     this._description = map['description'];
     this._priorities = map['priority'];

   }
} 