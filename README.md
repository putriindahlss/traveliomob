<<<<<<< HEAD
# traveliomob

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
=======
<details>
<summary>Tugas 7</summary>

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

<details>
<summary>Tugas 8</summary>
<h1>1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!</h1>

Navigator.push() dan Navigator.pushReplacement() adalah  metode dalam Flutter untuk navigasi antar halaman (route) di aplikasi. Perbedaannya adalah:

- Navigator.push(): untuk menavigasi ke halaman baru tanpa menggantikan halaman saat ini di tumpukan navigasi. Ketika pengguna menekan tombol kembali, aplikasi akan kembali ke halaman sebelumnya. Navigator.push() berfungsi ketika ingin menunjukkan halaman tambahan. 

- Navigator.pushReplacement(): untuk menavigasi ke halaman baru dan menggantikan halaman saat ini. Jadi, halaman saat ini akan dihapus dari tumpukan navigasi. Ketika pengguna menekan tombol kembali, aplikasi tidak akan kembali ke halaman sebelumnya, tetapi ke halaman sebelum halaman tersebut. 

Misalnya, kalau memiliki tiga halaman (X, Y, dan Z). Kita ada di halaman X dan menggunakan Navigator.push() untuk menuju halaman Y, lalu dengan Navigator.pushReplacement() menuju Z. Kalau tekan tombol kembali, kita akan kembali ke halaman X, bukan halaman Y, karena halaman Y telah digantikan oleh halaman Z.

<h1>2. Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!</h1>

Flutter menyediakan berbagai widget layout untuk mengatur tata letak interface pengguna. Contohnya:

- Container: menggabungkan penempatan dan widget lain dalam satu kotak.
- Row dan Column: menyusun widget atau komponen-komponen UI, baik secara horizontal (Row) maupun vertikal (Column).
- ListView: Widget scrolling yang paling umum digunakan. Menampilkan elemen yang dapat di-scroll.
- Stack: menumpuk beberapa elemen satu sama lain.
- GridView: mengimplementasikan komponen daftar grid. 
- Padding: Widget yang memberikan padding pada elemennya.
- Expanded: Widget yang memperluas elemen Row, Column, atau Flex.

<h1>3. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!</h1>

Ada dua elemen input pada form, yaitu:

- TextFormField: untuk input teks. Elemen ini digunakan untuk memasukkan "Nama Produk" dan "Amount". TextFormField di sini dilengkapi dengan validator untuk memastikan bahwa field tidak boleh kosong dan untuk field "Amount", nilai yang dimasukkan harus angka. TextFormField digunakan karena aplikasi membutuhkan input berupa teks dari pengguna

- ElevatedButton: sebagai tombol submit. Ketika tombol ini ditekan, maka akan memeriksa apakah semua field telah diisi dengan benar melalui _formKey.currentState!.validate(). Jika validasi berhasil, maka akan menampilkan dialog bahwa produk berhasil tersimpan. ElevatedButton digunakan untuk melakukan aksi (dalam hal ini, validasi dan penyimpanan data) ketika ditekan.

<h1>4. Bagaimana penerapan clean architecture pada aplikasi Flutter?</h1>

Clean Architecture pada aplikasi Flutter adalah pola arsitektur yang membantu dalam menyusun kode yang terstruktur. Berikut langkah untuk menerapkannya:

- Membuat lapisan domain sebagai inti dari aplikasi yang berisi logika bisnis dan model data.
- Menerapkan lapisan aplikasi yang mengimplementasikan kasus penggunaan aplikasi dan menjembatani lapisan infrastruktur dan presentasi.
- Mengatur lapisan infrastruktur yang berurusan dengan interaksi dengan dunia luar termasuk database, server web, interface pengguna.
- Membuat lapisan presentasi yang berisi kode yang merender interface pengguna di mana permintaan dibuat dan respons dikembalikan.

<h1>5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)</h1>

a. Menambah drawer menu dengan membuat berkas baru bernama left_drawer.dart dalam direktori widgets, lalu tambahkan kode untuk membuat drawer menu dengan navigasi ke halaman-halaman tertentu, seperti MyHomePage dan ShopFormPage.

```dart
//Implement this library.
import 'package:flutter/material.dart';
import 'package:traveliomob/screens/menu.dart';

//Impor halaman ShopFormPage jika sudah dibuat
import 'package:traveliomob/screens/shoplist_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            //Bagian drawer header
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Column(
              children: [
                Text(
                  'Travelio Mobile',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text("Catat seluruh keperluan belanjamu di sini!",
                    //Tambahkan gaya teks dengan center alignment, font ukuran 15, warna putih, dan weight biasa
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                ),
              ],
            ),
          ),
          //Bagian routing
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Tambah Produk'),
            // Bagian redirection ke ShopFormPage
            onTap: () {
              /*
              Buatlah routing ke ShopFormPage di sini,
              setelah halaman ShopFormPage sudah dibuat.
              */
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ShopFormPage(),
                )
              );
            },
          ),
        ],
      ),
    );
  }
}
```

b. Menambah Form dan Elemen Input dengan membuat berkas baru bernama shoplist_form.dart, lalu tambahkan variabel _formKey sebagai GlobalKey untuk mengelola state form, implementasikan TextFormField untuk menerima input nama produk, jumlah, dan deskripsi. Lalu gunakan Padding dan Column untuk mengatur tata letak elemen.

```dart
import 'package:flutter/material.dart';
// Impor drawer yang sudah dibuat sebelumnya
import 'package:traveliomob/widgets/left_drawer.dart';

class ShopFormPage extends StatefulWidget {
  const ShopFormPage({super.key});

  @override
  State<ShopFormPage> createState() => _ShopFormPageState();
}

class _ShopFormPageState extends State<ShopFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _price = 0;
  String _description = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Form Tambah Produk',
          ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      //Tambahkan drawer yang sudah dibuat di sini
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Nama Produk",
                    labelText: "Nama Produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _name = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Nama tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Harga",
                    labelText: "Harga",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  // OK TODO: Tambahkan variabel yang sesuai
                  onChanged: (String? value) {
                    setState(() {
                      _price = int.parse(value!);
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Harga tidak boleh kosong!";
                    }
                    if (int.tryParse(value) == null) {
                      return "Harga harus berupa angka!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Deskripsi",
                    labelText: "Deskripsi",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      // OK TODO: Tambahkan variabel yang sesuai
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Deskripsi tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.indigo),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Produk berhasil tersimpan'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text('Nama: $_name'),
                                    // OK TODO: Munculkan value-value lainnya
                                    Text('Harga: $_price'),
                                    Text('Deskripsi: $_description'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                        _formKey.currentState!.reset();
                      }

                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ]
          ),  
        ),
      ),
    );
  }
}
```

c. Memunculkan data dengan showDialog() untuk menampilkan AlertDialog ketika tombol "Save" ditekan.

```dart
 if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Produk berhasil tersimpan'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text('Nama: $_name'),
                                    
                                    Text('Harga: $_price'),
                                    Text('Deskripsi: $_description'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                        _formKey.currentState!.reset();
                      }
```

d. Menambah fitur navigasi (Navigator.push()) pada widget ShopItem di berkas menu.dart. Sesuaikan navigasi ke halaman ShopFormPage.

```dart
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

          // Navigate ke route yang sesuai (tergantung jenis tombol)
          if (item.name == "Tambah Item") {
            //Gunakan Navigator.push untuk melakukan navigasi ke MaterialPageRoute yang mencakup ShopFormPage.
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ShopFormPage()),
            );
          }
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
</details>
<<<<<<< HEAD


<details>
<summary>Tugas 9</summary>

<h1>1. Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?</h1>

Ya, kita bisa melakukan pengambilan data JSON tanpa membuat model terlebih dahulu dengan langsung memparsing data JSON ke dalam struktur data (dictionary atau array) tergantung struktur data JSONnya. Namun, membuat model terlebih dahulu akan memudahkan kita dalam membaca dan mengidentifikasi bug karena model dapat memberikan struktur yang jelas pada data JSON, sehingga memudahkan kita dalam memahami data tersebut. Selain itu, model juga dapat membantu kita dalam melakukan validasi data JSON, sehingga meminimalkan kemungkinan terjadinya kesalahan saat melakukan pengambilan data

<h1>2. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.</h1>

CookieRequest digunakan untuk mengelola cookies dalam aplikasi Flutter. CookieRequest berfungsi untuk menyimpan dan mengambil cookies yang digunakan saat berinteraksi dengan server web. Instance CookieRequest perlu dibagikan ke semua komponen di aplikasi Flutter karena cookies sering digunakan untuk otentikasi pengguna, pelacakan session, dan menyimpan preferensi pengguna. Dengan membagikan instance yang sama, kita memastikan bahwa semua komponen aplikasi memiliki akses ke informasi yang sama dan konsisten.

<h1>3. Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.</h1>

Mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter:

- Ambil data JSON, biasanya dari API web menggunakan HTTP GET atau POST.
- Data JSON yang diterima kemudian diuraikan/diparsing menjadi struktur data yang dapat digunakan oleh Flutter (biasanya dilakukan dengan menggunakan fungsi jsonDecode() dari paket dart:convert).
- Struktur data ini kemudian digunakan untuk membangun widget Flutter, seperti ListView atau Card yang ditampilkan ke pengguna.

<h1>4. Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.</h1>

Mekanisme autentikasi dari input data akun pada Flutter ke Django:

- Pengguna memasukkan data akun melalui form di aplikasi Flutter.
- Data ini dikirim ke server Django, biasanya melalui HTTP POST.
- Django memverifikasi data ini dengan data yang ada di database. Kalau datanya cocok, Django akan mengirimkan balasan yang mengkonfirmasi bahwa autentikasi berhasil.
- Aplikasi Flutter menerima balasan ini. Kalau autentikasi berhasil, menu ditampilkan kepada pengguna. Kalau autentikasi gagal, pesan kesalahan ditampilkan.

<h1>5. Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.</h1>

- Column: Widget untuk menampilkan anak-anaknya dalam tata letak vertikal.
- Text: Widget untuk menampilkan teks.
- SizedBox: Widget untuk memberikan ruang kosong dengan ukuran tertentu.
- FloatingActionButton: Sebuah tombol floating action yang biasanya ditempatkan di atas konten.
- Icon: Widget untuk menampilkan ikon.
- LeftDrawer: Widget untuk menampilkan drawer di sebelah kiri.
- FutureBuilder: Widget untuk membuat widget berdasarkan hasil Future.
- Center: Widget untuk memusatkan widget anaknya.
- CircularProgressIndicator: Widget untuk menampilkan indikator progres yang berputar.
- ListView.builder: Widget untuk membuat daftar yang dapat digulir.
- Scaffold: Widget utama yang biasanya digunakan sebagai kerangka dasar tata letak material design.
- AppBar: Widget yang biasanya digunakan sebagai bagian atas Scaffold yang berisi judul dan beberapa tindakan.
- Padding: Widget untuk memberikan padding ke widget anaknya.
- GestureDetector: Widget untuk mendeteksi gestur seperti ketukan, gesekan, dan lainnya.
- MaterialApp: Widget yang menyediakan fitur-fitur dasar dari Material Design (tema, navigasi, dan gesture).
- Container: Widget yang menyediakan kotak untuk menampung widget lainnya dengan berbagai atribut, seperti padding, margin, alignment, dan decoration.
- MaterialPageRoute: Widget yang menyediakan transisi material design antara halaman.
- Navigator: Widget yang menyediakan mekanisme untuk mengelola tumpukan widget yang dapat dinavigasi, seperti halaman atau layar.
- ListTile: Widget yang menyediakan sebuah item yang dapat diklik pada daftar, biasanya digunakan untuk menampilkan ikon, teks, dan tindakan.
- DrawerHeader: Widget yang menyediakan sebuah header untuk drawer, biasanya digunakan untuk menampilkan informasi atau gambar.
- Drawer: Widget yang menyediakan sebuah panel yang dapat ditarik dari tepi layar, biasanya digunakan untuk menampilkan menu navigasi.
- MyApp: Widget yang merupakan subclass dari StatelessWidget. Widget ini merupakan widget utama yang digunakan untuk menjalankan aplikasi Flutter.
- StatelessWidget: Widget superclass dari MyApp. Widget ini merupakan widget yang tidak memiliki state atau kondisi yang berubah-ubah.
- Provider: Widget untuk menyediakan sebuah objek yang dapat diakses oleh widget-widget lainnya melalui context. Widget ini digunakan untuk menyediakan objek CookieRequest yang digunakan untuk melakukan request ke server menggunakan cookie.
- MaterialApp: Widget yang menyediakan fitur-fitur dasar dari Material Design, seperti tema, navigasi, dan gesture. Widget ini digunakan untuk menentukan judul, tema, dan halaman utama aplikasi.
- ThemeData: Widget untuk menentukan tema aplikasi, seperti warna, font, dan ikon. Widget ini digunakan untuk menentukan skema warna dan versi Material Design yang digunakan.
- LoginPage: Widget untuk menampilkan halaman login aplikasi. Widget ini merupakan subclass dari StatefulWidget yang memiliki state atau kondisi yang berubah-ubah.

<h1>6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).</h1>
a. Integrasi Autentikasi Django-Flutter

- Django Setup:

1. Membuat django-app bernama "authentication" pada proyek Django.
2. Menambahkan "authentication" ke INSTALLED_APPS di settings.py.
3. Menginstall library django-cors-headers dengan perintah pip install django-cors-headers.
4. Menambahkan corsheaders ke INSTALLED_APPS dan middleware pada settings.py.
5. Mengatur variabel CORS dan keamanan pada settings.py.
6. Membuat metode view untuk login di authentication/views.py.
7. Membuat file urls.py di folder authentication dan tambahkan URL routing.
8. Membuat path 'auth/' pada urls.py di proyek utama.

- Flutter Setup:

1. Menginstall package Flutter yang disediakan oleh tim asisten dosen.
2. Memodifikasi root widget untuk menyediakan CookieRequest ke semua child widgets dengan menggunakan Provider.
3. Membuat file login.dart di folder screens dan isi dengan kode untuk halaman login.

b. Pembuatan Model Kustom
- Dengan menggunakan website Quicktype untuk membuat model Dart dari data JSON. Pertama membuat file product.dart di folder lib/models dan tempel kode dari Quicktype, lalu menerapkan Fetch Data dari Django ke Flutter dengan menambahkan dependency HTTP dengan perintah flutter pub add http.

- Kemudian menambahkan izin internet pada file AndroidManifest.xml., lalu membuat file list_product.dart di folder lib/screens untuk menampilkan produk dari Django.

- Menghubungkan halaman list_product.dart dengan CookieRequest.

c. Integrasi Form Flutter dengan Layanan Django
- Menambahkan fungsi view di Django untuk membuat produk baru, lalu tambahkan path baru di urls.py untuk fungsi view tersebut.
- Menghubungkan halaman shoplist_form.dart dengan CookieRequest, lalu mengubah perintah onPressed untuk menambahkan produk baru.
- Menjalankan aplikasi 

d. Implementasi Fitur Logout
- Membuat metode view untuk logout di authentication/views.py, lalu tambahkan path baru di authentication/urls.py untuk fungsi logout.
- Pada Flutter, tambahkan fungsi logout pada file shop_card.dart.
- Menjalankan aplikasi

</details>
=======
>>>>>>> d02c8812c994559236f7898a94c19bc4efb8be36
>>>>>>> 98c1001dcc8fe94e4a1ee2d0b0aa7a6cf5ae59e1
