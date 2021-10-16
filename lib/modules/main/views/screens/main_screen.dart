import 'package:act_task/modules/main/view_models/users_bloc/users_bloc.dart';
import 'package:act_task/modules/main/views/screens/posts_screen.dart';
import 'package:act_task/modules/main/views/screens/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: SafeArea(
          child: DefaultTabController(
            length: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 28),
                Container(
                  width: deviceSize.width,
                  height: 55,
                  padding: const EdgeInsets.all(6),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                      color: const Color(0xFFF2F2F2), borderRadius: BorderRadius.circular(18)),
                  child: TabBar(
                    unselectedLabelStyle: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 14, color: Color(0xFF686868)),
                    labelStyle: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 14, color: Color(0xFF643FDB)),
                    labelPadding: const EdgeInsets.symmetric(vertical: 8),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator:
                    BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14)),
                    labelColor: const Color(0xFF643FDB),
                    unselectedLabelColor: const Color(0xffC4C4C4),
                    tabs: [
                      BlocBuilder<UsersBloc, UsersState>(
                        builder: (context, state) {
                          if(state is UsersLoaded) {
                            return Tab(
                            text: 'Users (${state.users.length})',
                          );
                          }
                          return const Tab(
                            text: 'Users',
                          );
                        },
                      ),
                      const Tab(text: 'Posts'),
                    ],
                  ),
                ),
                const Expanded(
                  child: TabBarView(children: [
                    UsersScreen(),
                    PostsScreen(),
                  ]),
                ),

              ],
            ),
          )),
    );
  }
}
