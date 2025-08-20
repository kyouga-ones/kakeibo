import 'package:flutter/material.dart';
import 'package:kakeibo/core/models/screen.dart';
import 'package:kakeibo/core/models/transaction_model.dart';
import 'package:kakeibo/features/form/viewmodel/form_view_model.dart';
import 'package:kakeibo/features/graph/viewmodel/graph_viewmodel.dart';
import 'package:kakeibo/features/history/viewmodel/history_viewmodel.dart';
import 'package:kakeibo/features/home/viewmodel/home_view_model.dart';
import 'package:sqflite/sqflite.dart';

class MyHomePage extends StatefulWidget {
  final Database db;
  final List<TransactionModel> transactionModelList;

  const MyHomePage({
    super.key,
    required this.db,
    required this.transactionModelList,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var screenIndex = 0;
  var groupIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      Screen(
        title: 'ホーム',
        icon: const Icon(Icons.home_outlined),
        selectedIcon: const Icon(Icons.home),
        screen: HomeViewModel(
          db: widget.db,
          transactionModelList: widget.transactionModelList,
        ),
      ),
      Screen(
        title: '履歴',
        icon: const Icon(Icons.toc),
        selectedIcon: const Icon(Icons.toc),
        screen: HistoryViewmodel(
          db: widget.db,
          transactionModelList: widget.transactionModelList,
        ),
      ),
      Screen(
        title: 'グラフ',
        icon: const Icon(Icons.data_usage_outlined),
        selectedIcon: const Icon(Icons.data_usage),
        screen: GraphViewmodel(
          db: widget.db,
          transactionModelList: widget.transactionModelList,
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(screens[screenIndex].title),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FormViewModel(db: widget.db),
                ),
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Center(child: screens[screenIndex].screen),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            screenIndex = index;
            groupIndex = 0;
          });
        },
        selectedIndex: screenIndex,
        destinations: screens.map((Screen screen) {
          return screen.destination;
        }).toList(),
      ),
    );
  }
}
