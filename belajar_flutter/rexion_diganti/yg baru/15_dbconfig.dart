import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';

//kelass DbConfig
class DbConfig {
  static DbConfig _dbConfig;
  static Database _database;

  final tableConfig = 'dbconfig';
  final String _id = 'id';
  final String _code = 'code';
  final String _name = 'name';
  final String _descr = 'descr';
  final String _descr01 = 'descr01';
  final String _descr02 = 'descr02';
  final String _descr03 = 'descr03';

  DbConfig._createObject();

  factory DbConfig() {
    if (_dbConfig == null) {
      _dbConfig = DbConfig._createObject();
    }
    return _dbConfig;
  }

  Future<Database> initDb() async {
    //untuk menentukan nama database dan lokasi yg dibuat
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'dbconfig.db';

    //create, read databases
    var configDatabase = openDatabase(path, version: 1, onCreate: _createDb);
    return configDatabase;
  }

  //buat tabel baru dengan nama contact
  void _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE dbconfig (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        code TEXT,
        name TEXT,
        descr TEXT,
        descr01 TEXT,
        descr02 TEXT,
        descr03 TEXT,
        descr04 TEXT,
        descr05 TEXT,
        descr06 TEXT
      )
    ''');
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database;
  }

  Future<List<Map<String, dynamic>>> select() async {
    Database db = await this.database;
    var mapList = await db.query('dbconfig', orderBy: 'code');
    return mapList;
  }

  Future<int> insertConfig(ModelConfig object) async {
    Database db = await this.database;
    var result = await db.insert(tableConfig, object.toMap());
    return result;
  }

  Future<int> updateConfig(ModelConfig object) async {
    Database db = await this.database;
    int result = await db.update(tableConfig, object.toMap(),
        where: 'id=?', whereArgs: [object.id]);
    return result;
  }

  Future<int> deleteConfig(int id) async {
    Database db = await this.database;
    int result = await db.delete(tableConfig, where: 'id=?', whereArgs: [id]);
    return result;
  }

  Future<int> getCount() async {
    Database db = await this.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $tableConfig'));
  }

  Future<int> getCountID() async {
    Database db = await this.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $tableConfig WHERE id = 1'));
  }

  Future<List> getAllConfig() async {
    Database db = await this.database;
    var result =
        await db.query(tableConfig, columns: [_id, _code, _name, _descr]);
    return result;
  }

  Future<ModelConfig> getConfig(int id) async {
    Database db = await this.database;
    List<Map> result = await db.query(tableConfig,
        columns: [_id, _code, _name, _descr, _descr01, _descr02, _descr03],
        where: '$id = ?',
        whereArgs: [id]);
    if (result.length > 0) {
      return new ModelConfig.fromMap(result.first);
    }
    return null;
  }

  Future<String> getConfigName(String code) async {
    Database db = await this.database;
    List<Map> result = await db.query(tableConfig,
        columns: [_name], where: 'code = ?', whereArgs: [code], orderBy: 'id');
    if (result.length > 0) {
      var modalConfig = result.first;
      var cName = modalConfig['name'] as String;
      return cName;
    }
    return '';
  }

  Future closeConfig() async {
    Database db = await this.database;
    return db.close();
  }
/*
  List dataJSON;
  Future<String> getrestapi_mobileid() async {
    http.Response result = await http.get(
        Uri.encodeFull(
            'https://rexion.my.id/apps/index.php/restapi_system/get_mobileid'),
        headers: {"Accept": "'application/json"});

    dataJSON = jsonDecode(result.body);
    var cResult = dataJSON[1]['code'];
    return cResult;
  }
*/
}

class ModelConfig {
  int _id;
  String _code;
  String _name;
  String _descr;

  ModelConfig(this._code, this._name, this._descr);

  ModelConfig.map(dynamic obj) {
    this._id = obj['id'];
    this._code = obj['code'];
    this._name = obj['name'];
    this._descr = obj['descr'];
  }

  int get id => _id;
  String get code => _code;
  String get name => _name;
  String get descr => _descr;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_id != null) {
      map['id'] = this._id;
    }
    map['code'] = code;
    map['name'] = name;
    map['descr'] = descr;
    return map;
  }

  ModelConfig.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._code = map['code'];
    this._name = map['name'];
    this._descr = map['descr'];
  }
}
