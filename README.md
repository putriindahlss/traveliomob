<details>
<summary>Tugas 1</summary>

<h1>1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?</h1>
StatelessWidget dan StatefulWidget memiliki perbedaan utama dalam hal manajemen state atau kondisi dari widget tersebut:

a. Stateless Widget: 
- Stateless widget merupakan widget yang statis.
- Widget yang dibuat tidak dapat berubah sepanjang waktu.
- Konfigurasi yang dimuat didalamnya telah diinisiasi di awal.
- Stateless widget digunakan ketika menampilkan data yang tidak perlu adanya perubahan nilai.

b. Stateful Widget: 
- Stateful widget merupakan widget yang dinamis.
- Widget yang dibuat dapat diperbaharui kapanpun.
- Stateful widget dapat mengubah atau mengupdate tampilan, menambah widget lainnya, mengubah nilai variabel, icon, warna, dan lain-lain.

<h1>2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.</h1>
Berikut adalah widget-widget yang saya gunakan:

- MyApp: Widget root dari aplikasi Flutter yang mengembalikan sebuah MaterialApp yang menyediakan fitur-fitur dasar dari Material Design, seperti tema, navigasi, dan gesture.
- MyHomePage: Widget halaman utama dari aplikasi yang mengembalikan sebuah Scaffold yang menyediakan struktur layout dasar untuk aplikasi, seperti app bar, body, dan floating action button.
- SingleChildScrollView: Widget yang menyediakan kemampuan untuk melakukan scroll pada konten yang melebihi ukuran layar.
- Column: Widget yang menampilkan widget-widget lainnya secara vertikal. Widget ini digunakan untuk menampilkan judul dan grid layout.
- Padding: Widget yang memberikan jarak antara widget dengan widget lainnya. Widget ini digunakan untuk memberikan jarak antara tepi layar dengan konten dan antara judul dengan grid layout.
- Text: Widget yang menampilkan teks dengan atribut seperti alignment, style, dan font. Widget ini digunakan untuk menampilkan judul.
- GridView.count: Widget yang menampilkan widget-widget lainnya dalam bentuk grid dengan jumlah kolom yang ditentukan. Widget ini digunakan untuk menampilkan tiga tombol sederhana dengan ikon dan teks.
- ShopCard: Widget yang menampilkan sebuah Material dengan InkWell dan Container. Widget ini digunakan untuk menampilkan setiap item pada grid layout dengan warna, ikon, dan teks yang sesuai.
- Material: Widget yang memberikan efek visual Material Design pada widget lainnya, seperti elevasi, warna, dan bentuk. Widget ini digunakan untuk memberikan warna pada setiap item pada grid layout.
- InkWell: Widget yang memberikan efek visual dan gesture pada widget lainnya, seperti splash dan highlight untuk memberikan respons ketika setiap item pada grid layout ditekan.
- Container: Widget yang menyediakan berbagai kemampuan untuk mengatur widget lainnya, seperti padding, alignment, dan decoration. Widget ini digunakan untuk menampilkan ikon dan teks pada setiap item pada grid layout.
- Center: Widget yang menempatkan widget lainnya di tengah-tengah. Widget ini digunakan untuk menempatkan Column yang berisi ikon dan teks pada setiap item pada grid layout.
- Icon: Widget yang menampilkan ikon dengan berbagai atribut, seperti warna, ukuran, dan jenis. Widget ini digunakan untuk menampilkan ikon pada setiap item pada grid layout.

<h1>3. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)</h1>

- Membuat direktori traveliomob untuk menyimpan proyek flutter yang akan saya buat. Setelah itu mengenerate proyek flutter baru dengan nama traveliomob dengan command flutter create traveliomob

- Membuat file baru bernama menu.dart pada traveliomob/lib dan melakukan import package import 'package:flutter/material.dart';

- Dari file main.dart, pindahkan class MyHomePage dan class _MyHomePageState ke file menu.dart. Lalu pada file menu.dart saya melakukan import import 'package:traveliomob/menu.dart';

- Setelah itu pada menu.dart saya mengubah sifat widget halaman dari stateful menjadi stateless dan menambahkan widget-widget seperti teks dan card sebagai berikut:
```dart
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
    MyHomePage({Key? key}) : super(key: key);

    final List<ShopItem> items = [
        ShopItem("Lihat Item", Icons.checklist, Colors.cyan),
        ShopItem("Tambah Item", Icons.add_shopping_cart, Colors.blueGrey),
        ShopItem("Logout", Icons.logout, Colors.cyan),
    ];

    @override
    Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Traveliomob',
            ),
          ),
          body: SingleChildScrollView(
            // Widget wrapper yang dapat discroll
            child: Padding(
              padding: const EdgeInsets.all(10.0), // Set padding dari halaman
              child: Column(
                // Widget untuk menampilkan children secara vertikal
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                    child: Text(
                      'Traveliomob', // Text yang menandakan toko
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Grid layout
                  GridView.count(
                    // Container pada card kita.
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    children: items.map((ShopItem item) {
                      // Iterasi untuk setiap item
                      return ShopCard(item);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        );
    }
}

class ShopItem {
  final String name;
  final IconData icon;
  final Color color;
  ShopItem(this.name, this.icon, this.color);
}

class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

<h1>BONUS</h1>
Implementasi warna untuk tiap tombol

[![message-Image-1699409851069.jpg](https://i.ibb.co/hDbP8Zk/message-Image-1699409851069.jpg)](https://ibb.co/MMrYNGb)

</details>