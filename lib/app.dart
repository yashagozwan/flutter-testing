import 'package:flutter/material.dart';
import 'package:flutter_testing/data/repository/user_repository_impl.dart';
import 'package:flutter_testing/presentation/screens/user/user_screen.dart';
import 'package:flutter_testing/presentation/screens/user/user_view_model.dart';
import 'package:provider/provider.dart';
import 'presentation/screens/home/index.dart';

class App extends StatelessWidget {
  const App({super.key});

  ChangeNotifierProvider<T> _provider<T extends ChangeNotifier>(T provider) {
    return ChangeNotifierProvider(create: (_) => provider);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        _provider(HomeViewModel()),
        _provider(UserViewModel(
          UserRepositoryImpl(),
        )),
      ],
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
          ).copyWith(),
          appBarTheme: const AppBarTheme(),
        ),
        home: const UserScreen(),
      ),
    );
  }
}
