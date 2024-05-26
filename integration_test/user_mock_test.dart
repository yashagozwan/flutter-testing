import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/domain/models/filter_model.dart';
import 'package:flutter_testing/domain/models/result.dart';
import 'package:flutter_testing/domain/models/user_model.dart';
import 'package:flutter_testing/domain/repository/user_repository.dart';
import 'package:flutter_testing/presentation/screens/user/index.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:provider/provider.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('User Mock', () {
    late final MockUserRepository repository;

    setUpAll(() {
      repository = MockUserRepository();
    });

    testWidgets('Get Users Mock Positive Case', (tester) async {
      when(() => repository.getUsers(const FilterModel())).thenAnswer(
        (_) async => Future.delayed(
          const Duration(milliseconds: 500),
          () => Right(ResultSuccess(data: getUsers())),
        ),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider(
            create: (context) => UserViewModel(repository),
            child: const UserScreen(),
          ),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.text('Yasha Gozwan'), findsOneWidget);
      expect(find.text('Maria Mamiya'), findsOneWidget);
      expect(find.text('Marie Mamiya'), findsOneWidget);
      expect(find.text('Katagiri Aira'), findsOneWidget);
    });
  });
}

List<UserModel> getUsers() {
  const avatar =
      'https://sohanews.sohacdn.com/160588918557773824/2020/7/15/photo-1-15947499193292091378387.jpg';

  return const [
    UserModel(
      id: 1,
      email: 'yasha@gmail.com',
      firstName: 'Yasha',
      lastName: 'Gozwan',
      avatar: avatar,
    ),
    UserModel(
      id: 1,
      email: 'marie@empress.com',
      firstName: 'Marie',
      lastName: 'Mamiya',
      avatar: avatar,
    ),
    UserModel(
      id: 1,
      email: 'maria@empress.com',
      firstName: 'Maria',
      lastName: 'Mamiya',
      avatar: avatar,
    ),
    UserModel(
      id: 1,
      email: 'katagiri@empress.com',
      firstName: 'Katagiri',
      lastName: 'Aira',
      avatar: avatar,
    ),
  ];
}
