import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kakeibo/core/database/connect_database.dart';
import 'package:kakeibo/my_app.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final Directory appDocumentsDir = await getApplicationDocumentsDirectory();

  String dbPath = join(appDocumentsDir.path, 'databases', 'myDb.db');
  final db = await connectDatabase(dbPath);

  runApp(
    MyApp(
      db: db,
    ),
  );
}
