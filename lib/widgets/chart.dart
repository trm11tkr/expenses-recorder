import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  const Chart({Key? key, required this.recentTransactions}) : super(key: key);
  final List<Transaction> recentTransactions;

  // 1週間分の出費を計算
  List<Map<String, dynamic>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      int totalSum = 0;

      // Listの生成順に1週間を遡り、トラザクションと日付を比較
      for (var transaction in recentTransactions) {
        // 日付が一致すれば料金を加算
        if (transaction.date.day == weekDay.day &&
            transaction.date.month == weekDay.month &&
            transaction.date.year == weekDay.year) {
          totalSum += transaction.amount;
        }
      }
      return {'day': DateFormat.E('ja').format(weekDay), 'amount': totalSum};
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map(
            (data) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                    label: data['day'],
                    spendingAmount: data['amount'],
                    spendingPctOfTotal: totalSpending == 0.0
                        ? 0.0
                        : data['amount'] / totalSpending),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
