library event_cubit;

import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'event_state.dart';

part 'event_model.dart';

class EventCubit extends Cubit<EventState> {
  EventCubit() : super(EventStateInitial()) {
    initCollectionRef();
  }

  void initCollectionRef() => events = firestore.collection('events');

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference events;

  Future<QuerySnapshot<Object?>> eventsGetAll() async => await events.get();

  void eventsAdd() async {
    try {
      String jsonString = await rootBundle.loadString('assets/data.json');

      List jsonData = json.decode(jsonString)['result'];

      jsonData.forEach((element) async {
        element = (element as Map<String, dynamic>);
        print("//////////////////////////////");
        await events.add(element);
        print("//////////////////////////////");


        // (element as Map<String, dynamic>).forEach((key, value) {
        //   print("$key: $value");
        // });
      });

    } catch (e) {
      print("________________________________");
      print(e.toString());
      print("________________________________");
    }
  }

}
