import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shmaxlee/components/shmaxlee_colors.dart';
import 'package:shmaxlee/pages/add_medicine/add_medicine_page.dart';
import 'package:shmaxlee/pages/history/history_page.dart';
import 'package:shmaxlee/pages/today/today_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final _pages = [
    const TodayPage(),
    const HistoryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        top: false,
        child: Scaffold(
          appBar: AppBar(),
          body: _pages[_currentIndex],
          floatingActionButton: FloatingActionButton(
            onPressed: _onAddMedicine,
            child: const Icon(CupertinoIcons.add),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: _buildBottomAppBar(),
        ),
      ),
    );
  }

  BottomAppBar _buildBottomAppBar() {
    return BottomAppBar(
        elevation: 0,
        child: Container(
          height: kBottomNavigationBarHeight,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CupertinoButton(
                onPressed: () {
                  _onCurrentPage(0);
                },
                child: Icon(
                  CupertinoIcons.check_mark,
                  color: _currentIndex == 0
                      ? ShmaxleeColors.primaryColor
                      : Colors.grey,
                ),
              ),
              CupertinoButton(
                onPressed: () => _onCurrentPage(1),
                child: Icon(
                  CupertinoIcons.text_badge_checkmark,
                  color: _currentIndex == 1
                      ? ShmaxleeColors.primaryColor
                      : Colors.grey,
                ),
              ),
            ],
          ),
        ));
  }

  void _onCurrentPage(int pageIndex) {
    setState(() {
      _currentIndex = pageIndex;
    });
  }

  void _onAddMedicine() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const AddMedicinePage()));
  }
}
