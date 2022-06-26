class Transaction {
  final String id;
  final String title;
  final int amount;
  final DateTime date;

  const Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
  });
}
