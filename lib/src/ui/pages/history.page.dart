import 'package:flutter/material.dart';
import 'package:frontend_engineer_test/src/core/data/history_model.data.dart';
import 'package:frontend_engineer_test/src/core/models/history.model.dart';

class HistoryPage extends StatelessWidget {
  static final String route = 'history';
  final listHistory = historyData;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('History'),
          centerTitle: true,
        ),
        body: Container(
          constraints: BoxConstraints.expand(),
          child: ListView.builder(
              itemCount: listHistory.length,
              itemBuilder: (context, index) {
                HistoryModel _history = listHistory[index];

                return ListTile(
                  title: Text(_history.place),
                  subtitle: Row(children: [
                    Text('At:  ${_history.day}'),
                    Spacer(),
                    Text('Total:  ${_history.amount}'),
                  ]),
                );
              }),
        ),
      ),
    );
  }
}
