import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/domain/blocs/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:movies/ui/views/main_view/main_view_controller.dart';
import 'package:movies/ui/widgets/bottom_bar.dart';

import 'main_store.dart';

final injector = GetIt.instance;

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final MainController controller = injector.get<MainController>();

  @override
  void initState() {
    super.initState();
    Future.microtask(() => controller.validateSession(context));
  }

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
