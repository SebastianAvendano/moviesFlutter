import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/ui/blocs/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:movies/ui/widgets/bottom_bar.dart';

import 'main_store.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, int>(
      builder: (context, currentPage) => Scaffold(
        body: IndexedStack(
          index: currentPage,
          children: List.generate(
            MainStore.pages.length,
            (index) => MainStore.pages[index].widget,
          ),
        ),
        bottomNavigationBar: BottomNavigation(
          currentPage: currentPage,
          pages: MainStore.pages,
          onChangeTab: (int index) => onChangePage(context, index),
        ),
      ),
    );
  }

  void onChangePage(BuildContext context, int index) {
    context.read<BottomNavigationBloc>().add(TabChangeEvent(index));
  }
}
