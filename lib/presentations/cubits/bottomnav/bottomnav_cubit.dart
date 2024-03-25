import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_reminder/presentations/screens/add_event_screen.dart';
import 'package:medical_reminder/presentations/screens/events_screen.dart';
import 'package:medical_reminder/presentations/screens/home_scrren.dart';

part 'bottomnav_state.dart';

class BottomnavCubit extends Cubit<BottomnavState> {
  BottomnavCubit() : super(const BottomnavInitial(HomeScreen(), 'home'));
  final List<String> _screenList = [];

  void go(String screenName) {
    if (_screenList.isNotEmpty) {
      if (_screenList.last != screenName) {
        _screenList.add(screenName);
      } else {
        return;
      }
    } else {
      _screenList.add(screenName);
    }
    _updateScreen();
  }

  void pop() {
    if (_screenList.isNotEmpty) {
      _screenList.remove(_screenList.last);
    }
    _updateScreen();
  }

  _updateScreen() {
    switch (_screenList.last) {
      case 'home':
        emit(BottomnavInitial(const HomeScreen(), _screenList.last));
        break;
      case 'addEvent':
        emit(BottomnavInitial(const AddEventScrren(), _screenList.last));
        break;
      case 'events':
        emit(BottomnavInitial(const EventsScreen(), _screenList.last));
        break;
      default:
        emit(BottomnavInitial(const HomeScreen(), _screenList.last));
    }
  }
}
