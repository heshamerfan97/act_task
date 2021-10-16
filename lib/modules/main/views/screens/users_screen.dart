import 'package:act_task/app_bloc.dart';
import 'package:act_task/modules/main/view_models/users_bloc/users_bloc.dart';
import 'package:act_task/modules/main/views/widgets/loading_widget.dart';
import 'package:act_task/modules/main/views/widgets/user_widget.dart';
import 'package:act_task/shared/service/my_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersBloc, UsersState>(
      builder: (context, state) {
        if (state is UsersLoading) {
          return const LoadingWidget();
        }
        if (state is UsersLoaded) {
          return Scaffold(
            body: state.users.isEmpty? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    const Text('No user founds try searching again or clear search to get all results', textAlign: TextAlign.center, style: TextStyle(fontSize: 18),),
                    const SizedBox(height: 8),
                    InkWell(
                      onTap: () => AppBloc.usersBloc.add(OnSearchForUser('')),
                      child: Container(
                        height: 48,
                        width: 160,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0), color: Colors.lightBlue),
                        alignment: Alignment.center,
                        child: const Text('Clear Search', style: TextStyle(color: Colors.white, fontSize: 18),),
                      ),
                    )
                  ],
                ),
              )
            :ListView.builder(
              itemBuilder: (ctx, index) => UserWidget(state.users[index]),
              itemCount: state.users.length,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => _showSearchDialog(context),
              child: const Icon(Icons.search),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  _showSearchDialog(BuildContext context) =>
      showDialog(context: context, builder: (ctx) {
        final TextEditingController _searchController = TextEditingController();
        return  AlertDialog(
          actionsPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
          actions:  [
            InkWell(
            onTap: () {
              AppBloc.usersBloc.add(OnSearchForUser(_searchController.text));
              MyNavigator.back();
            },
              child: const Text('Search',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightBlue),),
            ),
            InkWell(
              onTap: () => MyNavigator.back(),
                child: const Text('Cancel')),
          ],
          title: Column(
            children:  [
              const Text('You can search a user by his/her name', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),),
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search',
                    filled: true,
                    fillColor: Color(0xFFF3F6F8),
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 15, color: Color(0xFFA29EB6)),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(0xFFA29EB6),
                    ),
                  ),
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.top,
                  textInputAction: TextInputAction.search,
                  maxLines: 1,
                  onSubmitted: (text) {
                    AppBloc.usersBloc.add(OnSearchForUser(_searchController.text));
                    MyNavigator.back();
                  },
                ),
              ),
            ],
          ),
        );
      });

}



