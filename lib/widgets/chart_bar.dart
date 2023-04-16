import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingamount;
  final double percentagespend;

  ChartBar(this.label, this.percentagespend, this.spendingamount);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(child: Text('\$${spendingamount.toStringAsFixed(0)}')),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(220, 220, 220, 1),
                    border: Border.all(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(10)),
              ),
              FractionallySizedBox(
                heightFactor: percentagespend,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label)
      ],
    );
  }
}
