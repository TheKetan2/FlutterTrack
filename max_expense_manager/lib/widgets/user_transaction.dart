import 'package:flutter/material.dart';
import 'package:max_expense_manager/widgets/new_transaction.dart';
import 'package:max_expense_manager/widgets/transaction_list.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(
          // addTx: _addNewTransaction,
        ),
        TransactionList(
          // transactions: _userTransactions,
        ),
      ],
    );
  }
}
