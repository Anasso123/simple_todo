import 'package:flutter/material.dart';
import 'package:fortune_wheel/core/domain/dependency_injection/dependency_injection.dart';
import 'package:fortune_wheel/fortune_wheel/domain/entities/person.dart';
import 'package:hive_flutter/adapters.dart';

class Config {
  static Future mainConfig()async{
    WidgetsFlutterBinding.ensureInitialized();
    DependencyInjection().init();
    await Hive.initFlutter();
    Hive.registerAdapter<Person>(PersonAdapter());
    await Hive.openBox<Person>('person');
  }
}