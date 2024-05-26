import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'index.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Consumer<HomeViewModel>(
              builder: (_, value, __) {
                return Text(
                  '${value.count}',
                  key: const Key('home.text.count'),
                  style: Theme.of(context).textTheme.displayMedium,
                );
              },
            ),
            FilledButton(
              key: const Key('home.btn.increment'),
              onPressed: viewModel.increment,
              child: const Text('Increment'),
            ),
            FilledButton(
              key: const Key('home.btn.decrement'),
              onPressed: viewModel.decrement,
              child: const Text('Decrement'),
            ),
          ],
        ),
      ),
    );
  }
}
