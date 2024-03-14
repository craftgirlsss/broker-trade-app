import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mockup_one/src/components/textstyle.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../helpers/format_currencies.dart';
import 'main_variable.dart';

class CardPortofolio extends StatefulWidget {
  const CardPortofolio({super.key});

  @override
  State<CardPortofolio> createState() => _CardPortofolioState();
}

class _CardPortofolioState extends State<CardPortofolio> {
  bool? isView = false;
  late List<ChartSampleData> _chartData;
  late TrackballBehavior _trackballBehavior;
  late ZoomPanBehavior _zoomPanBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _zoomPanBehavior = ZoomPanBehavior(
      enableMouseWheelZooming : true, 
      maximumZoomLevel: 0.3,
      enablePinching: true,
      zoomMode: ZoomMode.x,
      enablePanning: true,);
    _trackballBehavior = TrackballBehavior(
        enable: true, activationMode: ActivationMode.singleTap);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0),
      color: Colors.transparent,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Balance", style: kDefaultTextStyleTitleAppBar(fontSize: 16)),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 100,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 26),
                  Text(isView == true ? "****" : formatCurrencyUs.format(293), style: kDefaultTextStyleTitleAppBarBold(fontSize: 40,)),
                  IconButton(
                    onPressed: (){
                      setState(() {
                        isView = !isView!;
                      });
                    }, 
                    icon: isView == true ? const Icon(CupertinoIcons.eye, size: 20) : const Icon(CupertinoIcons.eye_slash_fill, size: 20),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.transparent,
            margin: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 7, right: 7, top: 3, bottom: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: GlobalVariablesType.buttonTextColor![1].withOpacity(0.3),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.arrow_upward_rounded, size: 15),
                      SizedBox(width: 5),
                      Text("3.90%")
                    ],
                  ),
                ),
                const SizedBox(width: 5),
                Container(
                  padding: const EdgeInsets.only(left: 7, right: 7, top: 3, bottom: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black45),
                    color: Colors.transparent,
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.arrow_upward_rounded, size: 15),
                      SizedBox(width: 5),
                      Text("USD 12.23")
                    ],
                  ),
                )
              ],
            ),
          ),
          Text("Favorit : EURUSD", style: kDefaultTextStyleTitleAppBar(fontSize: 15),),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 250,
            color: Colors.transparent,
            child: SfCartesianChart(
              zoomPanBehavior: _zoomPanBehavior,
              plotAreaBorderWidth: 0,
              crosshairBehavior: CrosshairBehavior(enable: false, ),
              trackballBehavior: _trackballBehavior,
              indicators: [
                SmaIndicator<dynamic, dynamic>(
                  seriesName: 'HiloOpenClose',
                  period: 4,
                  signalLineWidth: 0.9, 
                  valueField: 'close'),
                SmaIndicator<dynamic, dynamic>(
                  seriesName: 'HiloOpenClose',
                  period: 9,
                  signalLineColor: Colors.red,
                  signalLineWidth: 0.9, 
                  valueField: 'close'),
              ],
              series: <CandleSeries>[
                CandleSeries<ChartSampleData, DateTime>(
                    dataSource: _chartData,
                    name: 'HiloOpenClose',
                    enableSolidCandles: false,
                    xValueMapper: (ChartSampleData sales, _) => sales.x,
                    lowValueMapper: (ChartSampleData sales, _) => sales.low,
                    highValueMapper: (ChartSampleData sales, _) => sales.high,
                    openValueMapper: (ChartSampleData sales, _) => sales.open,
                    closeValueMapper: (ChartSampleData sales, _) => sales.close)
                ],
                primaryXAxis: DateTimeAxis(
                  enableAutoIntervalOnZooming: false,
                  dateFormat: DateFormat.yMMMd(),
                  majorGridLines: const MajorGridLines(width: 0)),
                enableAxisAnimation: true,
                borderColor: Colors.white,
                borderWidth: 0,
                primaryYAxis:  NumericAxis(
                  numberFormat: NumberFormat.simpleCurrency(),
                  opposedPosition: true,
                  edgeLabelPlacement: EdgeLabelPlacement.shift,
                  minimum: 80,
                  maximum: 130,
                  interval: 10,
                  majorGridLines: const MajorGridLines(
                   dashArray: <double>[7,7], 
                    width: 0.8)
                // numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0),
                ),
            ),
          ),
          Container(
            color: Colors.transparent,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: (){},
                  child: Container(
                    height: 70,
                    width: 150,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: GlobalVariablesType.buttonTextColor![3],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          color: Colors.transparent,
                          child: Row(
                            children: [
                              const Text("BUY", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19)),
                              const SizedBox(width: 3),
                              Text("119.83", style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 15))
                            ],
                          ),
                        ),
                        const Icon(CupertinoIcons.arrow_up_right, color: Colors.white)
                      ],
                    ),
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: (){},
                  child: Container(
                    height: 70,
                    width: 150,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.red,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          color: Colors.transparent,
                          child:  Row(
                            children: [
                              const Text("SELL", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19)),
                              const SizedBox(width: 3),
                              Text("119.83", style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 15))
                            ],
                          ),
                        ),
                        const Icon(CupertinoIcons.arrow_down_right, color: Colors.white)
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  List<ChartSampleData> getChartData() {
    return <ChartSampleData>[
      ChartSampleData(
          x: DateTime(2016, 01, 11),
          open: 98.97,
          high: 101.19,
          low: 95.36,
          close: 97.13),
      ChartSampleData(
          x: DateTime(2016, 01, 18),
          open: 98.41,
          high: 101.46,
          low: 93.42,
          close: 101.42),
      ChartSampleData(
          x: DateTime(2016, 01, 25),
          open: 101.52,
          high: 101.53,
          low: 92.39,
          close: 97.34),
      ChartSampleData(
          x: DateTime(2016, 02, 01),
          open: 96.47,
          high: 97.33,
          low: 93.69,
          close: 94.02),
      ChartSampleData(
          x: DateTime(2016, 02, 08),
          open: 93.13,
          high: 96.35,
          low: 92.59,
          close: 93.99),
      ChartSampleData(
          x: DateTime(2016, 02, 15),
          open: 91.02,
          high: 94.89,
          low: 90.61,
          close: 92.04),
      ChartSampleData(
          x: DateTime(2016, 02, 22),
          open: 96.31,
          high: 87.0237,
          low: 98.0237,
          close: 96.31),
      ChartSampleData(
          x: DateTime(2016, 02, 29),
          open: 99.86,
          high: 106.75,
          low: 99.65,
          close: 106.01),
      ChartSampleData(
          x: DateTime(2016, 03, 07),
          open: 102.39,
          high: 102.83,
          low: 100.15,
          close: 102.26),
      ChartSampleData(
          x: DateTime(2016, 03, 14),
          open: 101.91,
          high: 106.5,
          low: 101.78,
          close: 105.92),
      ChartSampleData(
          x: DateTime(2016, 03, 21),
          open: 105.93,
          high: 107.65,
          low: 104.89,
          close: 105.67),
      ChartSampleData(
          x: DateTime(2016, 03, 28),
          open: 106,
          high: 110.42,
          low: 104.88,
          close: 109.99),
      ChartSampleData(
          x: DateTime(2016, 04, 04),
          open: 110.42,
          high: 112.19,
          low: 108.121,
          close: 108.66),
      ChartSampleData(
          x: DateTime(2016, 04, 11),
          open: 108.97,
          high: 112.39,
          low: 108.66,
          close: 109.85),
      ChartSampleData(
          x: DateTime(2016, 04, 18),
          open: 108.89,
          high: 108.95,
          low: 104.62,
          close: 105.68),
      ChartSampleData(
          x: DateTime(2016, 04, 25),
          open: 105,
          high: 105.65,
          low: 92.51,
          close: 93.74),
      ChartSampleData(
          x: DateTime(2016, 05, 02),
          open: 93.965,
          high: 95.9,
          low: 91.85,
          close: 92.72),
      ChartSampleData(
          x: DateTime(2016, 05, 09),
          open: 93,
          high: 93.77,
          low: 89.47,
          close: 90.52),
      ChartSampleData(
          x: DateTime(2016, 05, 16),
          open: 92.39,
          high: 95.43,
          low: 91.65,
          close: 95.22),
      ChartSampleData(
          x: DateTime(2016, 05, 23),
          open: 95.87,
          high: 100.73,
          low: 95.67,
          close: 100.35),
      ChartSampleData(
          x: DateTime(2016, 05, 30),
          open: 99.6,
          high: 100.4,
          low: 96.63,
          close: 97.92),
      ChartSampleData(
          x: DateTime(2016, 06, 06),
          open: 97.99,
          high: 101.89,
          low: 97.55,
          close: 98.83),
      ChartSampleData(
          x: DateTime(2016, 06, 13),
          open: 98.69,
          high: 99.12,
          low: 95.3,
          close: 95.33),
      ChartSampleData(
          x: DateTime(2016, 06, 20),
          open: 96,
          high: 96.89,
          low: 92.65,
          close: 93.4),
      ChartSampleData(
          x: DateTime(2016, 06, 27),
          open: 93,
          high: 96.465,
          low: 91.5,
          close: 95.89),
      ChartSampleData(
          x: DateTime(2016, 07, 04),
          open: 95.39,
          high: 96.89,
          low: 94.37,
          close: 96.68),
      ChartSampleData(
          x: DateTime(2016, 07, 11),
          open: 96.75,
          high: 99.3,
          low: 96.73,
          close: 98.78),
      ChartSampleData(
          x: DateTime(2016, 07, 18),
          open: 98.7,
          high: 101,
          low: 98.31,
          close: 98.66),
      ChartSampleData(
          x: DateTime(2016, 07, 25),
          open: 98.25,
          high: 104.55,
          low: 96.42,
          close: 104.21),
      ChartSampleData(
          x: DateTime(2016, 08, 01),
          open: 104.41,
          high: 107.65,
          low: 104,
          close: 107.48),
      ChartSampleData(
          x: DateTime(2016, 08, 08),
          open: 107.52,
          high: 108.94,
          low: 107.16,
          close: 108.18),
      ChartSampleData(
          x: DateTime(2016, 08, 15),
          open: 108.14,
          high: 110.23,
          low: 108.08,
          close: 109.36),
      ChartSampleData(
          x: DateTime(2016, 08, 22),
          open: 108.86,
          high: 109.32,
          low: 106.31,
          close: 106.94),
      ChartSampleData(
          x: DateTime(2016, 08, 29),
          open: 106.62,
          high: 108,
          low: 105.5,
          close: 107.73),
      ChartSampleData(
          x: DateTime(2016, 09, 05),
          open: 107.9,
          high: 108.76,
          low: 103.13,
          close: 103.13),
      ChartSampleData(
          x: DateTime(2016, 09, 12),
          open: 102.65,
          high: 116.13,
          low: 102.53,
          close: 114.92),
      ChartSampleData(
          x: DateTime(2016, 09, 19),
          open: 115.19,
          high: 116.18,
          low: 111.55,
          close: 112.71),
      ChartSampleData(
          x: DateTime(2016, 09, 26),
          open: 111.64,
          high: 114.64,
          low: 111.55,
          close: 113.05),
      ChartSampleData(
          x: DateTime(2016, 10, 03),
          open: 112.71,
          high: 114.56,
          low: 112.28,
          close: 114.06),
      ChartSampleData(
          x: DateTime(2016, 10, 10),
          open: 115.02,
          high: 118.69,
          low: 114.72,
          close: 117.63),
      ChartSampleData(
          x: DateTime(2016, 10, 17),
          open: 117.33,
          high: 118.21,
          low: 113.8,
          close: 116.6),
      ChartSampleData(
          x: DateTime(2016, 10, 24),
          open: 117.1,
          high: 118.36,
          low: 113.31,
          close: 113.72),
      ChartSampleData(
          x: DateTime(2016, 10, 31),
          open: 113.65,
          high: 114.23,
          low: 108.11,
          close: 108.84),
      ChartSampleData(
          x: DateTime(2016, 11, 07),
          open: 110.08,
          high: 111.72,
          low: 105.83,
          close: 108.43),
      ChartSampleData(
          x: DateTime(2016, 11, 14),
          open: 107.71,
          high: 110.54,
          low: 104.08,
          close: 110.06),
      ChartSampleData(
          x: DateTime(2016, 11, 21),
          open: 114.12,
          high: 115.42,
          low: 115.42,
          close: 114.12),
      ChartSampleData(
          x: DateTime(2016, 11, 28),
          open: 111.43,
          high: 112.465,
          low: 108.85,
          close: 109.9),
      ChartSampleData(
          x: DateTime(2016, 12, 05),
          open: 110,
          high: 114.7,
          low: 108.25,
          close: 113.95),
      ChartSampleData(
          x: DateTime(2016, 12, 12),
          open: 113.29,
          high: 116.73,
          low: 112.49,
          close: 115.97),
      ChartSampleData(
          x: DateTime(2016, 12, 19),
          open: 115.8,
          high: 117.5,
          low: 115.59,
          close: 116.52),
      ChartSampleData(
          x: DateTime(2016, 12, 26),
          open: 116.52,
          high: 118.0166,
          low: 115.43,
          close: 115.82),
      ChartSampleData(
          x: DateTime(2016, 12, 05),
          open: 110,
          high: 114.7,
          low: 108.25,
          close: 113.95),
      ChartSampleData(
          x: DateTime(2016, 12, 12),
          open: 113.29,
          high: 116.73,
          low: 112.49,
          close: 115.97),
      ChartSampleData(
          x: DateTime(2016, 12, 19),
          open: 115.8,
          high: 117.5,
          low: 115.59,
          close: 116.52),
      ChartSampleData(
          x: DateTime(2016, 12, 26),
          open: 116.52,
          high: 118.0166,
          low: 115.43,
          close: 115.82),
    ];
  }
}

class ChartSampleData{
  final DateTime? x;
  final num? open;
  final num? close;
  final num? low;
  final num? high;

  ChartSampleData({
    this.x,
    this.close,
    this.high,
    this.low,
    this.open
  });
}