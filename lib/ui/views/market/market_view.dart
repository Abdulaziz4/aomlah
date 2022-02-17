import 'package:aomlah/core/models/coin.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'package:aomlah/ui/views/market/viewmodels/market_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class MarketView extends StatelessWidget {
  const MarketView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MarketViewmodel>.reactive(
        viewModelBuilder: () => MarketViewmodel(),
        onModelReady: (model) => model.connectSocket(),
        builder: (context, viewmodel, _) {
          return Scaffold(
            appBar: AppBar(
              title: Text("سوق العملات"),
            ),

            // body: SfDataGrid(
            //   // source: ,
            //   columns: [
            //     GridColumn(
            //         columnName: 'Name',
            //         label: Container(
            //             padding: EdgeInsets.symmetric(horizontal: 16.0),
            //             alignment: Alignment.centerRight,
            //             child: Text(
            //               'ID',
            //               overflow: TextOverflow.ellipsis,
            //             ))),
            //     GridColumn(
            //         columnName: 'Full Name',
            //         label: Container(
            //             padding: EdgeInsets.symmetric(horizontal: 16.0),
            //             alignment: Alignment.centerLeft,
            //             child: Text(
            //               'Name',
            //               overflow: TextOverflow.ellipsis,
            //             ))),
            //   ],
            // ),
          );
        });
  }
}

class CoinDataSource extends DataGridSource {
  CoinDataSource(List<Coin> coins) {
    dataGridRows = coins
        .map<DataGridRow>(
          (coin) => DataGridRow(
            cells: [
              DataGridCell<String>(columnName: 'Name', value: coin.name),
              DataGridCell<String>(
                  columnName: 'Full Name', value: coin.fullName),
            ],
          ),
        )
        .toList();
  }

  List<DataGridRow> dataGridRows = [];

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    // TODO: implement buildRow
    throw UnimplementedError();
  }
}
