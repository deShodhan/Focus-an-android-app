

import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

/*final String tablename = "todo";
final String columnID = "id";
final String columnNmane = "name";


class TaskModel {
  final String name;
  int id;

  TaskModel({this.name, this.id});

  Map<String, dynamic> toMap() {
    return {
      columnNmane: this.name
    };
  }
}

class ToDoHelper {
  Database db;

  ToDoHelper() {
    initDb();
    /*static ToDoHelper _helper;
    static Database db;

    ToDoHelper._createInstance();

    factory ToDoHelper(){
      if(_helper==null){
        _helper=ToDoHelper._createInstance();
      }
      return _helper;
    }*/

  }
  
  Future<void> initDb() async{
  db=await openDatabase(
  join(await getDatabasesPath(),"mydb.db"),
  onCreate: (db,version){
  return db.execute("CREATE TABLE $tablename($columnID INTEGER PRIMARY KEY AUTOINCREMENT, $columnNmane TEXT)");
  },
  version: 1
  );
  }
  Future<void> initTask(TaskModel task) async{
  try{
  db.insert(tablename, task.toMap(),conflictAlgorithm: ConflictAlgorithm.replace);
  }catch(_){
  print(_);
  }
  }
  Future<List<TaskModel>> getAllTask() async{
  final List<Map<String, dynamic>> tasks = await db.query(tablename);
  return List.generate(tasks.length, (i) {
  return TaskModel(name: tasks[i][columnNmane], id: tasks[i][columnID]);
  });
  }
}*/

final String tablename = "todo";
final String columnID = "id";
final String columnNmane = "name";
final String columnNmane1 = "name1";
final String columnNmane2 = "name2";
final String columnNmane3 = "name3";
final String columnNmane4 = "name4";


final String tablenameTJ = "todoTJ";
final String columnIDTJ = "id";
final String columnNmaneTJ = "name";
final String columnRname = "resultname";
final String columnTime = "time";
final String columnDate = "date";

final String tablenamePQ = "todoPositiveQuotes";
final String columnIDPQ = "id";
final String columnDURPQ = "duration";
final String columnNmanePQ = "name";
final String columnNmanePQMain = "namemain";

final String tablenameAD = "todoAnxietyData";
final String columnIDAD = "id";
final String columnNmaneAD = "points";
final String columnNmaneDateAD = "date";

/*-----------------------------------------maping styles--------------------------*/
class TaskModel {
  final String name;
  final String name1;
  final String name2;
  final String name3;
  final String name4;
  int id;

  TaskModel({this.name,this.name1,this.name2,this.name3,this.name4, this.id});

  Map<String, dynamic> toMap() {
    return {columnNmane: this.name,columnNmane1: this.name1,columnNmane2: this.name2,columnNmane3: this.name3,columnNmane4: this.name4,};
  }
}
class TaskModel2 {
  final String value;
  final String resultvalue;
  final String currtime;
  final String cdate;
  int id;

  TaskModel2({this.value,this.resultvalue,this.currtime,this.cdate, this.id});

  Map<String, dynamic> toMap() {
    return {columnNmaneTJ: this.value,columnRname: this.resultvalue,columnTime: this.currtime,columnDate: this.cdate,columnIDTJ:this.id};
  }
}

class TaskModel3 {
  final String quote;
  final int duration;
  final String namemain;
  int id;

  TaskModel3({this.quote,this.id,this.duration,this.namemain});

  Map<String, dynamic> toMap() {
    return {columnNmanePQ: this.quote,columnIDPQ:this.id,columnDURPQ:this.duration,columnNmanePQMain: this.namemain};
  }
}

class TaskModelAD {
  final String date;
  final int points;
  int id;

  TaskModelAD({this.date,this.points,this.id});

  Map<String, dynamic> toMap() {
    return {columnNmaneAD: this.points,columnNmaneDateAD:this.date,columnIDAD:this.id};
  }
}

/*-----------------------------------------maping styles--------------------------*/

class ToDoHelper {
  static ToDoHelper _helper;
  static Database _database;

  ToDoHelper._createInstance();

  factory ToDoHelper() {
    if (_helper == null) {
      _helper = ToDoHelper._createInstance();
    }
    return _helper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    String path = join(await getDatabasesPath(), "mydb.db");
    var mydata = await openDatabase(path, version: 1, onCreate: _createDb);
    return mydata;
  }

  void _createDb(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $tablename($columnID INTEGER PRIMARY KEY AUTOINCREMENT, $columnNmane TEXT, $columnNmane1 TEXT,$columnNmane2 TEXT,$columnNmane3 TEXT,$columnNmane4 TEXT)");
    await db.execute(
        "CREATE TABLE $tablenameTJ($columnIDTJ INTEGER PRIMARY KEY AUTOINCREMENT, $columnNmaneTJ TEXT, $columnRname TEXT, $columnTime TEXT, $columnDate TEXT)");
    await db.execute(
        "CREATE TABLE $tablenamePQ($columnIDPQ INTEGER PRIMARY KEY AUTOINCREMENT, $columnNmanePQ TEXT, $columnDURPQ INTEGER, $columnNmanePQMain TEXT)");
    await db.execute(
        "CREATE TABLE $tablenameAD($columnIDAD INTEGER PRIMARY KEY AUTOINCREMENT, $columnNmaneAD INTEGER, $columnNmaneDateAD TEXT)");
    debugPrint("create table");
  }
/*-----------------------------------------Init task--------------------------*/
  Future<void> initTask(TaskModel task,String str) async {
    try {
      Database db=await this.database;
      db.insert(tablename, task.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (_) {
      print(_);
    }
  }
  Future<void> initTaskTJ(TaskModel2 task) async {
   try{
      Database db=await this.database;
      db.insert(tablenameTJ, task.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
      debugPrint("init data");
   } catch (_) {
     print(_);
   }
  }

  Future<void> initTaskPQ(TaskModel3 task) async {
    try{
      Database db=await this.database;
      db.insert(tablenamePQ, task.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
      debugPrint("init data");
    } catch (_) {
      print(_);
    }
  }

  Future<void> initTaskAD(TaskModelAD task) async {
    try{
      Database db=await this.database;
      db.insert(tablenameAD, task.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
      debugPrint("init data");
    } catch (_) {
      print(_);
    }
  }
/*-----------------------------------------init task--------------------------*/
  Future<List<TaskModel>> getAllTask() async {
    Database db=await this.database;
    final List<Map<String, dynamic>> tasks = await db.query(tablename);
    return List.generate(tasks.length, (i) {
      return TaskModel(name: tasks[i][columnNmane],name1: tasks[i][columnNmane1],name2: tasks[i][columnNmane2],name3: tasks[i][columnNmane3],name4: tasks[i][columnNmane4], id: tasks[i][columnID]);
    });
  }

  Future<List<TaskModel2>> getAllTaskTJ() async {
    Database db=await this.database;
    final List<Map<String, dynamic>> tasks = await db.query(tablenameTJ);
    return List.generate(tasks.length, (i) {
      return TaskModel2(value: tasks[i][columnNmaneTJ],resultvalue: tasks[i][columnRname],currtime: tasks[i][columnTime],cdate: tasks[i][columnDate], id: tasks[i][columnIDTJ]);
    });
  }

  Future<List<TaskModel3>> getAllTaskPQ() async {
    Database db=await this.database;
      final List<Map<String, dynamic>> tasks = await db.query(tablenamePQ);
      return List.generate(tasks.length, (i) {
        return TaskModel3(quote: tasks[i][columnNmanePQ], id: tasks[i][columnIDPQ],duration: tasks[i][columnDURPQ],namemain: tasks[i][columnNmanePQMain]);
      });
  }

  Future<List<TaskModelAD>> getAllTaskAD() async {
    Database db=await this.database;
    final List<Map<String, dynamic>> tasks = await db.query(tablenameAD);
    return List.generate(tasks.length, (i) {
      return TaskModelAD(points: tasks[i][columnNmaneAD], date: tasks[i][columnNmaneDateAD]);
    });
  }
/*----------------------------------------get task--------------------------*/
  Future<List<TaskModel>> getRow(int id) async {
    Database db=await this.database;
    final List<Map<String, dynamic>> tasks = await db.rawQuery("SELECT *FROM todo WHERE id=$id");
    return List.generate(1, (i) {
      return TaskModel(name: tasks[i][columnNmane],name1: tasks[i][columnNmane1],name2: tasks[i][columnNmane2],name3: tasks[i][columnNmane3],name4: tasks[i][columnNmane4], id: tasks[i][columnID]);
    });
  }

  Future<List<TaskModel2>> getRowTJ(int id) async {
    Database db=await this.database;
    if(db!=null){
      debugPrint("yes\n\n\n\n\nyes");
    }
      final List<Map<String, dynamic>> tasks = await db.rawQuery("SELECT *FROM todoTJ WHERE id=$id");
      return List.generate(1, (i) {
        return TaskModel2(value: tasks[i][columnNmaneTJ],resultvalue: tasks[i][columnRname],currtime: tasks[i][columnTime],cdate: tasks[i][columnDate], id: tasks[i][columnIDTJ]);
      });
  }

  Future<int> getRowCount() async {
    Database db=await this.database;
    int task;
    return task = Sqflite.firstIntValue(await db.rawQuery("SELECT COUNT(*) FROM todoTJ"));
  }

/*----------------------------------------get task--------------------------*/

/*-----------------------------------------------delete rows-------------------------------*/
  deleteRow(int id) async {
    Database db=await this.database;
    int tasks;
    tasks = await db.rawDelete("DELETE FROM todo WHERE id=$id");
  }
  deleteRowTJ(int id) async {
    Database db=await this.database;
    int tasks;
    tasks = await db.rawDelete("DELETE FROM todoTJ WHERE id=$id");
  }

  deleteRowPQ(int id) async {
    Database db=await this.database;
    int tasks;
    tasks = await db.rawDelete("DELETE FROM todoPositiveQuotes WHERE id=$id");
  }
/*-----------------------------------------------delete rows-------------------------------*/
}
