import 'package:flutter/material.dart';

class PemasukanPage extends StatefulWidget {
  @override
  _PemasukanPageState createState() => _PemasukanPageState();
}

class _PemasukanPageState extends State<PemasukanPage> {
  final TextEditingController _namaBarangController = TextEditingController();
  final TextEditingController _jumlahController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();
  List<Map<String, dynamic>> pembelianList = [];

  @override
  void dispose() {
    _namaBarangController.dispose();
    _jumlahController.dispose();
    _hargaController.dispose();
    super.dispose();
  }

  void _simpanPembelian() {
    String namaBarang = _namaBarangController.text;
    String jumlah = _jumlahController.text;
    String harga = _hargaController.text;

    if (namaBarang.isNotEmpty && jumlah.isNotEmpty && harga.isNotEmpty) {
      Map<String, dynamic> pembelian = {
        'Nama Barang': namaBarang,
        'Jumlah': jumlah,
        'Harga': harga,
      };

      setState(() {
        pembelianList.add(pembelian);
      });

      _namaBarangController.clear();
      _jumlahController.clear();
      _hargaController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pemasukan'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _namaBarangController,
                  decoration: InputDecoration(
                    labelText: 'Nama Barang',
                    prefixIcon: Icon(Icons.shopping_bag),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _jumlahController,
                  decoration: InputDecoration(
                    labelText: 'Jumlah',
                    prefixIcon: Icon(Icons.add_shopping_cart),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _hargaController,
                  decoration: InputDecoration(
                    labelText: 'Harga',
                    prefixIcon: Icon(Icons.attach_money),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _simpanPembelian,
                  child: Text('Simpan'),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: pembelianList.length,
              itemBuilder: (BuildContext context, int index) {
                final pembelian = pembelianList[index];
                return ListTile(
                  title: Text('Nama Barang: ${pembelian['Nama Barang']}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Jumlah: ${pembelian['Jumlah']}'),
                      Text('Harga: ${pembelian['Harga']}'),
                    ],
                  ),
                  leading: Icon(Icons.shopping_cart),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
