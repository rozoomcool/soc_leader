library event_cubit;

import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'event_state.dart';

part 'event_model.dart';

class EventCubit extends Cubit<EventState> {
  EventCubit() : super(EventStateInitial()) {
    initCollectionRef();
  }

  void initCollectionRef() => events = GetIt.I<List<EventModel>>();

  List<EventModel> events = [];

   void eventsGetAll() async {
    emit(EventStateLoaded(events: events));
  }

  void eventsAdd(EventModel event) async {
     events.add(event);
     emit(EventStateLoaded(events: events));
  }

}
