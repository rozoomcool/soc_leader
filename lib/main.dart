import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soc_leader/presentation/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'application/application.dart';
import 'domain/event_cubit/event_cubit.dart';
import 'firebase_options.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  List<Map<String, dynamic>> tmp = json.decode(await rootBundle.loadString('assets/data.json'))['result'];
  List<EventModel> events = [];
  tmp.forEach((el) {
    EventModel event = EventModel(title: el['title'], location: el['location'], imageUrl: el['imageUrl'], link: el['link']);
    events.add(event);

  });


  final getIt = GetIt.instance;
  getIt.registerSingleton<SharedPreferences>(await SharedPreferences.getInstance());
  getIt.registerSingleton<List<EventModel>>(events);
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}