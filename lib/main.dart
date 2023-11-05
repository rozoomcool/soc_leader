import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soc_leader/presentation/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'application/application.dart';
import 'firebase_options.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}