import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:quent/Features/home/presentation/view/home_view.dart';
import 'package:quent/Features/profile/profile_view.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  int currentIndex = 0;

  List<Widget> screens = [
    const HomeView(),
    const ProfileView(),
    const HomeView(),
    const HomeView(),
    const ProfileView(),
  ];
  final List<IconData> bottomNavIcons = const [
    CupertinoIcons.house,
    CupertinoIcons.search,
    CupertinoIcons.mail,
    CupertinoIcons.bell,
    CupertinoIcons.person,
  ];

  Widget get currentScreen => screens[currentIndex];
  IconData get currentIcon => bottomNavIcons[currentIndex];

  void resetLayout() {
    currentIndex = 0;
    emit(LayoutChanged(currentIndex));
  }

  void changeIndex(int index) {
    if (index == currentIndex) return;
    currentIndex = index;
    emit(LayoutChanged(index));
  }
}
