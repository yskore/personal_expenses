import 'package:flutter/material.dart';
import 'models/Transaction.dart';
import 'package:intl/intl.dart';
import 'widgets/transaction_list.dart';
import 'widgets/new_transactions.dart';
import 'widgets/transaction_list.dart';
import './widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        hoverColor: Colors.purpleAccent,
        fontFamily: 'QuickSand',
        //appBarTheme: AppBarTheme(
        //  titleTextStyle: ThemeData.light().textTheme.copyWith(titleLarge: TextStyle(
        //   fontFamily: 'QuickSand',
        //    fontSize: 20,
        // ))
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transactions = [];

  final List<Transaction> usertransactions = [
    // Transaction(id: '123', title: 'Test', cost: 10, date: DateTime.now()),
  ];

  void add_transaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      cost: txAmount,
      date: DateTime.now(),
    );

    setState(() {
      usertransactions.add(newTx);
    });
  }

  List<Transaction> get recentTransactions {
    return usertransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
              onTap: () {},
              behavior: HitTestBehavior.opaque,
              child: NewTransaction(add_transaction));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personal Expenses'), actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            startAddNewTransaction(context);
          },
          color: Theme.of(context).primaryColor,
        )
      ]),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: Theme.of(context).primaryColorDark,
              alignment: Alignment.center,
              child: Card(
                //color: Theme.of(context).primaryColorLight,
                elevation: 0,
                color: Theme.of(context).primaryColorLight,
                child: Chart(recentTransactions),
              ),
            ),
            TransactionList(usertransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            startAddNewTransaction(context);
          }),
    );
  }
}
