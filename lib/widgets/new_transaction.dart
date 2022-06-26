import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  NewTransaction({Key? key, required this.addTransaction}) : super(key: key);
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function addTransaction;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextField(
          decoration: const InputDecoration(
            label: Text('使用目的'),
          ),
          controller: titleController,
        ),
        TextField(
          decoration: const InputDecoration(
            label: Text('金額'),
          ),
          controller: amountController,
        ),
        TextButton(
          onPressed: () {
            addTransaction(
              titleController.text,
              int.parse(amountController.text),
            );
          },
          child: const Text('登録'),
        )
      ],
    );
  }
}
