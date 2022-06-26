import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  NewTransaction({Key? key, required this.addTransaction}) : super(key: key);
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function addTransaction;

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = int.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    addTransaction(
      enteredTitle,
      enteredAmount,
    );
  }

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
          onSubmitted: (_) => submitData(),
        ),
        TextField(
          decoration: const InputDecoration(
            label: Text('金額'),
          ),
          controller: amountController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          onSubmitted: (_) => submitData(),
        ),
        TextButton(
          onPressed: submitData,
          child: const Text('登録'),
        )
      ],
    );
  }
}
