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
                  onTap: () => _settingModalBottomSheet(context, _history),
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

  void _settingModalBottomSheet(context, HistoryModel history) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: Column(
              children: <Widget>[
                Text(
                  history.place,
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  '${history.day}',
                  // style: Theme.of(context).textTheme.headline6,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: history.items.length,
                      itemBuilder: (context, index) {
                        Item _item = history.items[index];

                        return ListTile(
                          title: Row(children: [
                            Text('${_item.name}'),
                            Spacer(),
                            Text('${_item.price}'),
                          ]),
                        );
                      }),
                ),
                Text(
                  'Total ${history.amount}',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          );
        });
  }
}
