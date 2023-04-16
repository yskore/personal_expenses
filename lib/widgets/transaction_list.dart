import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../main.dart';
import '../models/Transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text('No new transactions'),
                SizedBox(height: 25),
                Container(
                  height: 300,
                  child: Image.asset(
                    './assets/images/waiting.png',
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                    child: Row(
                  children: <Widget>[
                    Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black38,
                                style: BorderStyle.solid,
                                width: 2.0)),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '\$: ${transactions[index].cost.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Theme.of(context).primaryColor),
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transactions[index].title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        Text(
                            DateFormat.yMMMd().format(transactions[index].date),
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.grey, fontSize: 12))
                      ],
                    )
                  ],
                ));
              },
              itemCount: transactions.length,
            ),
    );
  }
}
