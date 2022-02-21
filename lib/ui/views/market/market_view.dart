import 'package:aomlah/core/app/utils/constants.dart';
import 'package:aomlah/core/models/coin.dart';
import 'package:aomlah/ui/shared/busy_overlay.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'package:aomlah/ui/views/market/viewmodels/market_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class MarketView extends StatefulWidget {
  const MarketView({Key? key}) : super(key: key);

  @override
  State<MarketView> createState() => _MarketViewState();
}

class _MarketViewState extends State<MarketView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MarketViewmodel>.reactive(
        viewModelBuilder: () => MarketViewmodel(),
        onModelReady: (model) => model.connectSocket(),
        builder: (context, viewmodel, _) {
          return Directionality(
            textDirection: TextDirection.ltr,
            child: BusyOverlay(
              isBusy: viewmodel.isBusy,
              child: Scaffold(
                appBar: AppBar(
                  title: Text("سوق العملات"),
                  automaticallyImplyLeading: false,
                ),
                body: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: SfDataGridTheme(
                    data:
                        SfDataGridThemeData(selectionColor: Colors.transparent),
                    child: SfDataGrid(
                      source: viewmodel.dataSource,
                      onQueryRowHeight: (details) {
                        return details.rowIndex == 0 ? 0 : 70;
                      },
                      // Old items are the old selected list of row
                      onSelectionChanged: (newItems, oldItems) {
                        final index = viewmodel.dataSource.dataGridRows
                            .indexOf(newItems.first);
                        viewmodel.navigateToDetails(index);
                      },

                      selectionMode: SelectionMode.single,
                      columnWidthMode: ColumnWidthMode.fill,
                      columns: [
                        GridColumn(
                          columnName: 'Logo',
                          width: 60,
                          label: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Coin',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        GridColumn(
                          columnName: 'Name',
                          label: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            alignment: Alignment.centerRight,
                            child: Text(
                              '',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        GridColumn(
                          columnName: 'Spark Chart',
                          label: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            alignment: Alignment.center,
                            child: Text(
                              'Spark Chart',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        GridColumn(
                          columnName: 'Price',
                          label: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            alignment: Alignment.center,
                            child: Text(
                              'Price',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class CoinDataSource extends DataGridSource {
  CoinDataSource() {
    builDataGrid([]);
  }

  void builDataGrid(List<Coin> coins) {
    dataGridRows = coins
        .map<DataGridRow>(
          (coin) => DataGridRow(
            cells: [
              DataGridCell<String>(
                columnName: 'Logo',
                value: coin.getFullLogoUrl(),
              ),
              DataGridCell<Map<String, String>>(
                columnName: 'Name',
                value: {
                  "name": coin.name,
                  "fullName": coin.fullName,
                },
              ),
              DataGridCell<String>(
                columnName: 'Spark Chart',
                value: coin.getPreviewChart(),
              ),
              DataGridCell<Map<String, String>>(
                columnName: 'Price',
                value: {
                  "price": coin.price,
                  "change": coin.change24hr,
                },
              ),
            ],
          ),
        )
        .toList();
  }

  List<DataGridRow> dataGridRows = [];

  void updateDataGridSource(List<Coin> coins) {
    builDataGrid(coins);
    notifyListeners();
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    // How Each Cell in a Row Should be Displayed
    final List<DataGridCell<dynamic>> cells = row.getCells();
    return DataGridRowAdapter(
      cells: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(
            cells[0].value.toString(),
            height: 20,
            width: 20,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              (cells[1].value as Map<String, String>)["fullName"].toString(),
              style: Constants.smallText.copyWith(fontWeight: FontWeight.w600),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
            ),
            Text(
              (cells[1].value as Map<String, String>)["name"].toString(),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Image.network(
            cells[2].value,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              (cells[3].value as Map<String, String>)["price"].toString(),
              style: Constants.smallText.copyWith(fontWeight: FontWeight.w600),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
            Text(
              (cells[3].value as Map<String, String>)["change"].toString() +
                  "%",
              style: Constants.smallText.copyWith(
                fontWeight: FontWeight.w500,
                color: (cells[3].value as Map<String, String>)["change"]
                        .toString()
                        .startsWith("-")
                    ? Colors.red
                    : Constants.primaryColor,
              ),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }
}
