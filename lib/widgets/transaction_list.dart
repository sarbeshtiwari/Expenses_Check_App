import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transasction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      //child: SingleChildScrollView(
      //to make it scroll able  //listview can also be use
      //child: Column(
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: 200,
                    child: Image.asset('assets/images/wait.jpg',
                        fit: BoxFit.cover))
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  color: Colors.greenAccent,
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                            color: Colors.purple,
                            width: 2,
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '₹' + transactions[index].amount.toStringAsFixed(2),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start, //let to right and mainaxis for top to bottom
                        children: [
                          Text(
                            transactions[index].title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            DateFormat('EEE, dd/MM/yy')
                                .format(transactions[index].date),
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            child: IconButton(
                                padding: EdgeInsets.only(left: 50),
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                iconSize: 24.0,
                                onPressed: () =>
                                    deleteTx(transactions[index].id)),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: transactions.length,
              // children: [
              //   ...transactions.map((tx) {
              //   }).toList(),
              // ],
            ),
    );
  }
}
