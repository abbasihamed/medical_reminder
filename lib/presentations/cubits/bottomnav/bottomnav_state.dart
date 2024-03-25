part of 'bottomnav_cubit.dart';

sealed class BottomnavState {
  final String screenName;
  const BottomnavState(this.screenName);
}

class BottomnavInitial extends BottomnavState {
  final Widget scrren;

  const BottomnavInitial(this.scrren, super.screenName);
}
