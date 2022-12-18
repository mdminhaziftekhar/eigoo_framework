import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_diary/model/data_model.dart';
import 'package:my_diary/widgets/basic_appbar.dart';
import 'package:spannable_grid/spannable_grid.dart';

class AnswerTwoScreen extends StatefulWidget {
  const AnswerTwoScreen({super.key});

  @override
  State<AnswerTwoScreen> createState() => _AnswerTwoScreen();
}

class _AnswerTwoScreen extends State<AnswerTwoScreen> {
  List<DataModel> tableData = [];
  int totalDcQty = 0;
  double totalDcPay = 0;
  int totalStopsQty = 0;
  double totalStopsPay = 0;
  int totalMilesQty = 0;
  double totalmilesPay = 0.0;
  int totalBckQty = 0;
  double totalBckPay = 0.0;
  double totalPreTrip = 0.0;
  double totalPostTrip = 0.0;
  double totalloPre = 0.0;
  double totalLoPost = 0.0;
  double gTotal = 0.0;

  getDataTableData() {
    tableData.clear();
    List<dynamic> dataList = jsonDecode(jsonData)['results'];

    tableData = dataList.map((e) => DataModel.fromJson(e)).toList();
  }

  @override
  void initState() {
    // TODO: implement initState
    getDataTableData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(title: 'Ans Question Two'),
      body: Container(
          padding: const EdgeInsets.all(25),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    width: 1200,
                    child: SpannableGrid(
                      columns: 16,
                      rows: tableData.length + 4,
                      cells: _getCells(),
                      style: SpannableGridStyle(),
                      onCellChanged: (cell) {
                        print('Cell ${cell!.id} changed');
                      },
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  List<SpannableGridCellData> _getCells() {
    var result = <SpannableGridCellData>[];

    result.add(SpannableGridCellData(
      column: 1,
      row: 2,
      columnSpan: 1,
      rowSpan: 1,
      id: "Date",
      child: cellContainer("Date"),
    ));
    result.add(SpannableGridCellData(
      column: 2,
      row: 2,
      columnSpan: 1,
      rowSpan: 1,
      id: "Route",
      child: cellContainer("Route#", isTitle: true),
    ));

    result.add(SpannableGridCellData(
      column: 3,
      row: 2,
      columnSpan: 1,
      rowSpan: 1,
      id: "Pro",
      child: cellContainer("Pro#", isTitle: true),
    ));

    result.add(SpannableGridCellData(
      column: 4,
      row: 1,
      columnSpan: 2,
      rowSpan: 1,
      id: "Delivery Case",
      child: cellContainer("Delivery Case", isTitle: true),
    ));
    result.add(SpannableGridCellData(
      column: 6,
      row: 1,
      columnSpan: 2,
      rowSpan: 1,
      id: "Stops",
      child: cellContainer("Stops", isTitle: true),
    ));
    result.add(SpannableGridCellData(
      column: 8,
      row: 1,
      columnSpan: 2,
      rowSpan: 1,
      id: "Miles",
      child: cellContainer("Miles", isTitle: true),
    ));
    result.add(SpannableGridCellData(
      column: 10,
      row: 1,
      columnSpan: 2,
      rowSpan: 1,
      id: "Bckhauls",
      child: cellContainer("Bckhauls", isTitle: true),
    ));
    result.add(SpannableGridCellData(
      column: 12,
      row: 1,
      columnSpan: 1,
      rowSpan: 2,
      id: "Pre Trip",
      child: cellContainer("Pre Trip", isTitle: true),
    ));
    result.add(SpannableGridCellData(
      column: 13,
      row: 1,
      columnSpan: 1,
      rowSpan: 2,
      id: "Post Trip",
      child: cellContainer("Post Trip", isTitle: true),
    ));
    result.add(SpannableGridCellData(
      column: 14,
      row: 1,
      columnSpan: 1,
      rowSpan: 2,
      id: "LO Pre",
      child: cellContainer("LO Pre", isTitle: true),
    ));
    result.add(SpannableGridCellData(
      column: 15,
      row: 1,
      columnSpan: 1,
      rowSpan: 2,
      id: "LO Post",
      child: cellContainer("LO Post", isTitle: true),
    ));
    result.add(SpannableGridCellData(
      column: 16,
      row: 1,
      columnSpan: 1,
      rowSpan: 2,
      id: "Total",
      child: cellContainer("Total", isTitle: true),
    ));

    result.add(SpannableGridCellData(
      column: 4,
      row: 2,
      columnSpan: 1,
      rowSpan: 1,
      id: "dc_qty",
      child: cellContainer("Qty", isTitle: true),
    ));
    result.add(SpannableGridCellData(
      column: 5,
      row: 2,
      columnSpan: 1,
      rowSpan: 1,
      id: "dc_pay",
      child: cellContainer("Pay", isTitle: true),
    ));
    result.add(SpannableGridCellData(
      column: 6,
      row: 2,
      columnSpan: 1,
      rowSpan: 1,
      id: "stops_qty",
      child: cellContainer("Qty", isTitle: true),
    ));
    result.add(SpannableGridCellData(
      column: 7,
      row: 2,
      columnSpan: 1,
      rowSpan: 1,
      id: "stops_pay",
      child: cellContainer("Pay", isTitle: true),
    ));
    result.add(SpannableGridCellData(
      column: 8,
      row: 2,
      columnSpan: 1,
      rowSpan: 1,
      id: "miles_qty",
      child: cellContainer("Qty", isTitle: true),
    ));
    result.add(SpannableGridCellData(
      column: 9,
      row: 2,
      columnSpan: 1,
      rowSpan: 1,
      id: "miles_pay",
      child: cellContainer("Pay", isTitle: true),
    ));
    result.add(SpannableGridCellData(
      column: 10,
      row: 2,
      columnSpan: 1,
      rowSpan: 1,
      id: "bck_qty",
      child: cellContainer("Qty", isTitle: true),
    ));
    result.add(SpannableGridCellData(
      column: 11,
      row: 2,
      columnSpan: 1,
      rowSpan: 1,
      id: "bck_pay",
      child: cellContainer("Pay", isTitle: true),
    ));

    for (var i = 0; i < tableData.length; i++) {
      DataModel item = tableData[i];
      totalDcQty += tableData[i].dcQty!;
      totalDcPay += tableData[i].dcPay!;
      totalStopsQty += tableData[i].stopsQty!;
      totalStopsPay += tableData[i].stopsPay!;
      totalMilesQty += tableData[i].milesQty!;
      totalmilesPay += tableData[i].milesPay!;
      totalBckQty += tableData[i].bckQty!;
      totalBckPay += tableData[i].bckPay!;
      totalPreTrip += tableData[i].preTrip!;
      totalPostTrip += tableData[i].postTrip!;
      totalloPre += tableData[i].loPre!;
      totalLoPost += tableData[i].loPost!;
      gTotal += tableData[i].total!;
      int _row = 3 + i;
      result.add(SpannableGridCellData(
        column: 1,
        row: _row,
        columnSpan: 1,
        rowSpan: 1,
        id: "date_1_$_row",
        child: cellContainer(item.date),
      ));
      result.add(SpannableGridCellData(
        column: 2,
        row: _row,
        columnSpan: 1,
        rowSpan: 1,
        id: "route_2_$_row",
        child: cellContainer(item.route),
      ));
      result.add(SpannableGridCellData(
        column: 3,
        row: _row,
        columnSpan: 1,
        rowSpan: 1,
        id: "pro_3_$_row",
        child: cellContainer(item.pro),
      ));
      result.add(SpannableGridCellData(
        column: 4,
        row: _row,
        columnSpan: 1,
        rowSpan: 1,
        id: "dcQty_4_$_row",
        child: cellContainer(item.dcQty),
      ));

      result.add(SpannableGridCellData(
        column: 5,
        row: _row,
        columnSpan: 1,
        rowSpan: 1,
        id: "dcPay_5_$_row",
        child: cellContainer(item.dcPay),
      ));
      result.add(SpannableGridCellData(
        column: 6,
        row: 3 + i,
        columnSpan: 1,
        rowSpan: 1,
        id: "stopsQty_6_$_row",
        child: cellContainer(item.stopsQty),
      ));
      result.add(SpannableGridCellData(
        column: 7,
        row: 3 + i,
        columnSpan: 1,
        rowSpan: 1,
        id: "stopsPay_7_$_row",
        child: cellContainer(item.stopsPay),
      ));
      result.add(SpannableGridCellData(
        column: 8,
        row: 3 + i,
        columnSpan: 1,
        rowSpan: 1,
        id: "milesQty_8_$_row",
        child: cellContainer(item.milesQty),
      ));
      result.add(SpannableGridCellData(
        column: 9,
        row: 3 + i,
        columnSpan: 1,
        rowSpan: 1,
        id: "milesPay_9_$_row",
        child: cellContainer(item.milesPay),
      ));
      result.add(SpannableGridCellData(
        column: 10,
        row: 3 + i,
        columnSpan: 1,
        rowSpan: 1,
        id: "bckQty_10_$_row",
        child: cellContainer(item.bckQty),
      ));
      result.add(SpannableGridCellData(
        column: 11,
        row: 3 + i,
        columnSpan: 1,
        rowSpan: 1,
        id: "bckPay_11_$_row",
        child: cellContainer(item.bckPay),
      ));
      result.add(SpannableGridCellData(
        column: 12,
        row: 3 + i,
        columnSpan: 1,
        rowSpan: 1,
        id: "preTrip_12_$_row",
        child: cellContainer(item.preTrip),
      ));
      result.add(SpannableGridCellData(
        column: 13,
        row: 3 + i,
        columnSpan: 1,
        rowSpan: 1,
        id: "postTrip_13_$_row",
        child: cellContainer(item.postTrip),
      ));
      result.add(SpannableGridCellData(
        column: 14,
        row: 3 + i,
        columnSpan: 1,
        rowSpan: 1,
        id: "loPre_14_$_row",
        child: cellContainer(item.loPre),
      ));
      result.add(SpannableGridCellData(
        column: 15,
        row: 3 + i,
        columnSpan: 1,
        rowSpan: 1,
        id: "loPost_15_$_row",
        child: cellContainer(item.loPost),
      ));
      result.add(SpannableGridCellData(
        column: 16,
        row: 3 + i,
        columnSpan: 1,
        rowSpan: 1,
        id: "total_16_$_row",
        child: cellContainer(item.total),
      ));

      // Map<String, dynamic> itemMap = item.toJson();
      // for (var j = 0; j < itemMap.length; j++) {
      //   int _column = 3 + i;
      //   int _row = 1 + j;
      //   final key = itemMap.keys.elementAt(j);
      //   final value = itemMap[key];
      //   result.add(SpannableGridCellData(
      //     column: _column,
      //     row: _row,
      //     columnSpan: 1,
      //     rowSpan: 1,
      //     id: "$_column-$_row-",
      //     child: cellContainer(value),
      //   ));
      // }
      if (i == 7) {
        int wTotalRow = 2 + 7;
        final wtotalcell = _getTotalCell(
            totalRow: wTotalRow,
            title: "Week One Total",
            isGtotal: false,
            isWtotal: true);
        result.addAll(wtotalcell);
      }
    }

    int gTotalRow = 3 + tableData.length;

    final gtotalcell = _getTotalCell(
        totalRow: gTotalRow,
        title: "Grand Total",
        isGtotal: true,
        isWtotal: false);

    result.addAll(gtotalcell);

    return result;
  }

  List<SpannableGridCellData> _getTotalCell(
      {required int totalRow,
      required String title,
      required bool isGtotal,
      required bool isWtotal}) {
    var result = <SpannableGridCellData>[];
    result.add(SpannableGridCellData(
      column: 1,
      row: totalRow,
      columnSpan: 3,
      rowSpan: 1,
      id: "totalTitle_1_$totalRow",
      child: cellContainer(title, isGtotal: isGtotal, isWeek: isWtotal),
    ));
    result.add(SpannableGridCellData(
      column: 4,
      row: totalRow,
      columnSpan: 1,
      rowSpan: 1,
      id: "totalDcQty_2_$totalRow",
      child: cellContainer(totalDcQty, isGtotal: isGtotal, isWeek: isWtotal),
    ));

    result.add(SpannableGridCellData(
      column: 5,
      row: totalRow,
      columnSpan: 1,
      rowSpan: 1,
      id: "totalDcPay_5_$totalRow",
      child: cellContainer(totalDcPay.toStringAsFixed(2),
          isGtotal: isGtotal, isWeek: isWtotal),
    ));

    result.add(SpannableGridCellData(
      column: 6,
      row: totalRow,
      columnSpan: 1,
      rowSpan: 1,
      id: "totalStopsQty_6_$totalRow",
      child: cellContainer(totalStopsQty, isGtotal: isGtotal, isWeek: isWtotal),
    ));
    result.add(SpannableGridCellData(
      column: 7,
      row: totalRow,
      columnSpan: 1,
      rowSpan: 1,
      id: "totalStopsPay_7_$totalRow",
      child: cellContainer(totalStopsPay.toStringAsFixed(2),
          isGtotal: isGtotal, isWeek: isWtotal),
    ));
    result.add(SpannableGridCellData(
      column: 8,
      row: totalRow,
      columnSpan: 1,
      rowSpan: 1,
      id: "totalMilesQty_8_$totalRow",
      child: cellContainer(totalMilesQty, isGtotal: isGtotal, isWeek: isWtotal),
    ));
    result.add(SpannableGridCellData(
      column: 9,
      row: totalRow,
      columnSpan: 1,
      rowSpan: 1,
      id: "totalmilesPay_9_$totalRow",
      child: cellContainer(totalmilesPay.toStringAsFixed(2),
          isGtotal: isGtotal, isWeek: isWtotal),
    ));
    result.add(SpannableGridCellData(
      column: 10,
      row: totalRow,
      columnSpan: 1,
      rowSpan: 1,
      id: "totalBckQty_10_$totalRow",
      child: cellContainer(totalBckQty, isGtotal: isGtotal, isWeek: isWtotal),
    ));
    result.add(SpannableGridCellData(
      column: 11,
      row: totalRow,
      columnSpan: 1,
      rowSpan: 1,
      id: "totalBckPay_11_$totalRow",
      child: cellContainer(totalBckPay.toStringAsFixed(2),
          isGtotal: isGtotal, isWeek: isWtotal),
    ));
    result.add(SpannableGridCellData(
      column: 12,
      row: totalRow,
      columnSpan: 1,
      rowSpan: 1,
      id: "totalPreTrip_12_$totalRow",
      child: cellContainer(totalPreTrip.toStringAsFixed(2),
          isGtotal: isGtotal, isWeek: isWtotal),
    ));
    result.add(SpannableGridCellData(
      column: 13,
      row: totalRow,
      columnSpan: 1,
      rowSpan: 1,
      id: "totalPostTrip_13_$totalRow",
      child: cellContainer(totalPostTrip.toStringAsFixed(2),
          isGtotal: isGtotal, isWeek: isWtotal),
    ));
    result.add(SpannableGridCellData(
      column: 14,
      row: totalRow,
      columnSpan: 1,
      rowSpan: 1,
      id: "totalloPre_14_$totalRow",
      child: cellContainer(totalloPre.toStringAsFixed(2),
          isGtotal: isGtotal, isWeek: isWtotal),
    ));
    result.add(SpannableGridCellData(
      column: 15,
      row: totalRow,
      columnSpan: 1,
      rowSpan: 1,
      id: "totalLoPost_15_$totalRow",
      child: cellContainer(totalLoPost.toStringAsFixed(2),
          isGtotal: isGtotal, isWeek: isWtotal),
    ));
    result.add(SpannableGridCellData(
      column: 16,
      row: totalRow,
      columnSpan: 1,
      rowSpan: 1,
      id: "gTotal_16_$totalRow",
      child: cellContainer(gTotal.toStringAsFixed(2),
          isGtotal: isGtotal, isWeek: isWtotal),
    ));

    return result;
  }

  Widget cellContainer(
    dynamic text, {
    bool isGtotal = false,
    bool isTitle = false,
    bool isWeek = false,
  }) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: isGtotal
              ? Colors.green
              : isWeek
                  ? Colors.grey
                  : Colors.white,
          border: Border.all(color: Colors.grey)),
      child: Center(
        child: Text(
          '$text',
          style: isTitle
              ? Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontWeight: FontWeight.bold)
              : Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}
