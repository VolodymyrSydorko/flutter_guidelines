import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_guidelines/router/index.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        DashboardRoute(),
        TasksRoute(),
        ConfigRoute(),
        ProfileRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return SalomonBottomBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            SalomonBottomBarItem(
              selectedColor: Colors.blueAccent,
              icon: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
            ),
            SalomonBottomBarItem(
              selectedColor: Colors.blueAccent,
              icon: const Icon(Icons.task_sharp),
              title: const Text('Tasks'),
            ),
            SalomonBottomBarItem(
              selectedColor: Colors.blueAccent,
              icon: const Icon(Icons.confirmation_num),
              title: const Text('Config'),
            ),
            SalomonBottomBarItem(
              selectedColor: Colors.blueAccent,
              icon: const Icon(Icons.verified_user),
              title: const Text('Config'),
            ),
          ],
        );
      },
    );
  }
}
