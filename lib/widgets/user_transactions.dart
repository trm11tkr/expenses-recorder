import 'package:flutter/material.dart';

import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'new Books',
      amount: 500,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'new Shoes',
      amount: 8560,
      date: DateTime.now(),
    )
  ];

  void _addNewTransaction(String title, int amount) {
    final newTransaction = Transaction(
      title: title,
      amount: amount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(addTransaction: _addNewTransaction),
        TransactionList(transactions: _userTransactions),
      ],
    );
  }
}
