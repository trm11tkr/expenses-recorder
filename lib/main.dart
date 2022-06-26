import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import './widgets/user_transactions.dart';

void main() async {
  await initializeDateFormatting('ja_JP');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses Record'),
        actions: [
          IconButton(
            icon:const Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
      body: const Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: UserTransactions(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
