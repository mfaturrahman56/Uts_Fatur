import 'package:flutter/material.dart';

class PengeluaranPage extends StatefulWidget {
  @override
  _PengeluaranPageState createState() => _PengeluaranPageState();
}

class _PengeluaranPageState extends State<PengeluaranPage> {
  final TextEditingController _namaBarangController = TextEditingController();
  final TextEditingController _hargaBarangController = TextEditingController();
  final TextEditingController _keperluanBengkelController =
      TextEditingController();
  final TextEditingController _hargaKeperluanController =
      TextEditingController();
  List<Map<String, dynamic>> pengeluaranList = [];

  @override
  void dispose() {
    _namaBarangController.dispose();
    _hargaBarangController.dispose();
    _keperluanBengkelController.dispose();
    _hargaKeperluanController.dispose();
    super.dispose();
  }

  void _simpanPengeluaran() {
    String namaBarang = _namaBarangController.text;
    String hargaBarang = _hargaBarangController.text;
    String keperluanBengkel = _keperluanBengkelController.text;
    String hargaKeperluan = _hargaKeperluanController.text;

    if (namaBarang.isNotEmpty &&
        hargaBarang.isNotEmpty &&
        keperluanBengkel.isNotEmpty &&
        hargaKeperluan.isNotEmpty) {
      Map<String, dynamic> pengeluaran = {
        'Nama Barang': namaBarang,
        'Harga Barang': hargaBarang,
        'Keperluan Bengkel': keperluanBengkel,
        'Harga Keperluan': hargaKeperluan,
      };

      setState(() {
        pengeluaranList.add(pengeluaran);
      });

      _namaBarangController.clear();
      _hargaBarangController.clear();
      _keperluanBengkelController.clear();
      _hargaKeperluanController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengeluaran Bengkel'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _namaBarangController,
                  decoration: InputDecoration(
                    labelText: 'Nama Barang',
                    prefixIcon: Icon(Icons.shopping_cart),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _hargaBarangController,
                  decoration: InputDecoration(
                    labelText: 'Harga Barang',
                    prefixIcon: Icon(Icons.attach_money),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _keperluanBengkelController,
                  decoration: InputDecoration(
                    labelText: 'Keperluan Bengkel',
                    prefixIcon: Icon(Icons.build),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                controller: _hargaKeperluanController,
                 decoration: InputDecoration(
                    labelText: 'Harga Keperluan',
                    prefixIcon: Icon(Icons.attach_money),
                 ),
                keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10),
                ElevatedButton(
                onPressed: _simpanPengeluaran,
                child: Text('Simpan'),
                ),
                ],
                ),
                ),
                SizedBox(height: 20),
                Expanded(
                child: ListView.builder(
                itemCount: pengeluaranList.length,
                itemBuilder: (BuildContext context, int index) {
                final pengeluaran = pengeluaranList[index];
                return ListTile(
                title: Text('Nama Barang: ${pengeluaran['Nama Barang']}'),
                subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text('Harga Barang: ${pengeluaran['Harga Barang']}'),
                Text('Keperluan Bengkel: ${pengeluaran['Keperluan Bengkel']}'),
                Text('Harga Keperluan: ${pengeluaran['Harga Keperluan']}'),
                ],
                ),
                );
                },
                ),
                ),
                ],
                ),
                );
                }
                }
               
