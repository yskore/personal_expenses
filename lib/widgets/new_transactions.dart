import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;

  TextEditingController TitleInput = TextEditingController();
  TextEditingController AmountInput = TextEditingController();

  NewTransaction(this.addTx);

  void submitData() {
    final textEntered = TitleInput.text;
    final amountEntered = double.parse(AmountInput.text);

    if (textEntered.isEmpty || amountEntered <= 0) {
      return;
    }

    addTx(textEntered, amountEntered);
    //Navigator.of(context2).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        constraints: BoxConstraints.tight(Size(200, 200)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: TitleInput,
            onSubmitted: (_) => submitData(),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: AmountInput,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitData(),
          ),
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            child: SizedBox(
              height: 30,
              width: 150,
              child: FloatingActionButton(
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5))),
                child: Text('Add Transaction'),
                onPressed: (submitData)
                // I added this here instead of in the submitData because it wasnt working as a result of no context variable being defined there
                ,
                backgroundColor: Colors.purple,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
