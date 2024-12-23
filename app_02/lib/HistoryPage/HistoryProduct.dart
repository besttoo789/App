import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<Transaction> transactionHistory = getTransactionHistory();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ประวัติการนำเข้า-นำออก'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: transactionHistory.length,
          itemBuilder: (context, index) {
            return _buildTransactionCard(context, transactionHistory[index]);
          },
        ),
      ),
    );
  }

  Widget _buildTransactionCard(BuildContext context, Transaction transaction) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(
          transaction.type == TransactionType.incoming
              ? Icons.add_box
              : Icons.remove_circle_outline,
          color: Colors.red,
        ),
        title: Text(transaction.product.name),
        subtitle: Text(
            '${transaction.type == TransactionType.incoming ? 'นำเข้า' : 'นำออก'} - จำนวน: ${transaction.quantity} ชิ้น'),
        trailing: Text(
          transaction.date,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ),
    );
  }
}

class Transaction {
  final Product product;
  final int quantity;
  final TransactionType type;
  final String date;

  Transaction({
    required this.product,
    required this.quantity,
    required this.type,
    required this.date,
  });
}

enum TransactionType {
  incoming,
  outgoing,
}

class Product {
  final String name;

  Product({required this.name});
}

List<Transaction> getTransactionHistory() {
  // รายการการนำเข้า-นำออกสินค้าสำหรับการทดสอบ
  return [
    Transaction(
      product: Product(name: 'สินค้า A'),
      quantity: 50,
      type: TransactionType.incoming,
      date: '2024-12-01',
    ),
    Transaction(
      product: Product(name: 'สินค้า B'),
      quantity: 20,
      type: TransactionType.outgoing,
      date: '2024-12-02',
    ),
    Transaction(
      product: Product(name: 'สินค้า C'),
      quantity: 100,
      type: TransactionType.incoming,
      date: '2024-12-05',
    ),
    Transaction(
      product: Product(name: 'สินค้า A'),
      quantity: 30,
      type: TransactionType.outgoing,
      date: '2024-12-10',
    ),
  ];
}
