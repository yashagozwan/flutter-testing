import 'package:flutter/material.dart';
import 'package:flutter_testing/presentation/screens/user/user_view_model.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<UserViewModel>(context, listen: false);
    Future(() => viewModel.initial());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),
      body: Consumer<UserViewModel>(
        builder: (context, value, child) {
          if (value.isUsersLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final users = value.users;
          return ListView.separated(
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    user.avatar,
                  ),
                ),
                title: Text('${user.firstName} ${user.lastName}'),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: users.length,
          );
        },
      ),
    );
  }
}
