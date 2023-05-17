import 'package:flutter/material.dart';
class LaporanPage extends StatefulWidget {
  @override
  _LaporanPageState createState() => _LaporanPageState();
}

class _LaporanPageState extends State<LaporanPage> {
  int currentPageIndex = 0;
  List<List<InputItem>> laporanInputData = [
    [
      InputItem(label: 'Pengeluaran 1', type: 'Pengeluaran selama 1 bulan'),
      InputItem(label: 'Pemasukan 1', type: 'Pemasukan selama 1 bulan'),
    ],
    [
      InputItem(label: 'Pengeluaran 2', type: 'Pengeluaran selama 2 bulan'),
      InputItem(label: 'Pemasukan 2', type: 'Pemasukan selama 2 bulan'),
      
    ],
    [
      InputItem(label: 'Pengeluaran 3', type: 'Pengeluaran selama 3 bulan'),
      InputItem(label: 'Pemasukan 3', type: 'Pemasukan selama 3 bulan'),
  
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laporan'),
      ),
      body: LaporanInputPage(
        inputItems: laporanInputData[currentPageIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPageIndex,
        onTap: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Laporan 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Laporan 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Laporan 3',
          ),
        ],
      ),
    );
  }
}

class LaporanInputPage extends StatelessWidget {
  final List<InputItem> inputItems;

  LaporanInputPage({required this.inputItems});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: inputItems.length,
      itemBuilder: (context, index) {
        final inputItem = inputItems[index];
        return ListTile(
          title: Text(inputItem.label),
          subtitle: Text(inputItem.type),
        );
      },
    );
  }
}

class InputItem {
  final String label;
  final String type;

  InputItem({required this.label, required this.type});
}

