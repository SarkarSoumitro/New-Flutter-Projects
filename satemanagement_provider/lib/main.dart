import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:satemanagement_provider/CounterProvider.dart';
import 'package:satemanagement_provider/listmapprovider.dart';
import 'package:satemanagement_provider/listpage.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ListMapProvider()),
        ChangeNotifierProvider(create: (context) => CounterProvider()),
      ],
      child: const Myapp(),
    ),
  );
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter provider',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Listpage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Consumer<CounterProvider>(
          builder: (ctx, counterProvider, child) {
            return Text(
              '${counterProvider.getCount()}',
              style: const TextStyle(fontSize: 25),
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'increment',
            onPressed: () {
              context.read<CounterProvider>().incrementCount();
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'decrement',
            onPressed: () {
              context.read<CounterProvider>().DecrementCount(); // Fixed naming
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
