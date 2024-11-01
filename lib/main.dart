import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // klik kolom dan tekan gambar lampu di kiri dan tambahkan widget SingleChildScrollView agar webnya bisa di scroll
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Gambar Header aplikasi
                Image.asset('images/naruto.png'),
                
                // Judul
                // ada garis biru karena dia merupakan tipe constanta dan perlu ditambah const
                Container(
                  // menambah jarak dari segala arah sebesar 8.0 DP
                  margin: const EdgeInsets.all(8.0),
                  child: const Text(
                    "Naruto Shippuden",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // Bintang 5
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, color: Colors.yellow),
                    Icon(Icons.star, color: Colors.yellow),
                    Icon(Icons.star, color: Colors.yellow),
                    Icon(Icons.star, color: Colors.yellow),
                    Icon(Icons.star, color: Colors.yellow),
                  ],
                ),

                // Deskripsi
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    "Naruto Uzumaki ingin menjadi ninja terbaik di negeri ini. Dia melakukannya dengan baik sejauh ini, tetapi dengan bahaya yang ditimbulkan oleh organisasi Akatsuki yang misterius, Naruto tahu dia harus berlatih lebih keras dari sebelumnya dan meninggalkan desanya untuk latihan intens yang akan mendorongnya hingga batas kemampuannya.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),

                // gambar scroll horizontal
                Container(
                    margin: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        height: 150,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              // Gambar 1
                              Container(
                                //agar sudut gambar tidak tajam
                                padding: const EdgeInsets.all(4.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4.0),
                                  child: Image.network(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQo17YxQmnbaGq5ChYahVlepTXFyhzCmRzG6A&s"),
                                ),
                              ),
                              // Gambar 2
                              Container(
                                //agar sudut gambar tidak tajam
                                padding: const EdgeInsets.all(4.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4.0),
                                  child: Image.network(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKN7p5BTSKyEzguoWJiFyhWmpnAO-SQj9F_g&s"),
                                ),
                              ),
                              // Gambar 3
                              Container(
                                //agar sudut gambar tidak tajam
                                padding: const EdgeInsets.all(4.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4.0),
                                  child: Image.network(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTamVDF05654ZtT0lNkHB8r3G5hg7meY3r5Tw&s"),
                                ),
                              ),
                              // Gambar 4
                              Container(
                                //agar sudut gambar tidak tajam
                                padding: const EdgeInsets.all(4.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4.0),
                                  child: Image.network(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmg0UxPaXvyBRL5XqDkwoqa6e1bZ9z1322Pg&s"),
                                ),
                              ),
                            ]))),

                // Tombol Lihat Lokasi
                Container(
                  padding: EdgeInsets.fromLTRB(12, 0, 12, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 8, 8),
                        child: OutlinedButton(
                          child: const Text("Lihat Lokasi"),
                          onPressed: () async {
                            const url =
                                'https://maps.app.goo.gl/77iafdQBwpKEx4hZ9';
                            final uri = Uri.parse(url);

                            if (await canLaunchUrl(uri)) {
                              await launchUrl(uri);
                            } else {
                              const snackBar = SnackBar(
                                content: Text('Gagal Menampilkan Lokasi!'),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 8, 8),
                        child: OutlinedButton(
                          child: const Text("Telepon"),
                          onPressed: () async {
                            const url = 'tel:+62-711-376-400';
                            final uri = Uri.parse(url);

                            if (await canLaunchUrl(uri)) {
                              await launchUrl(uri);
                            } else {
                              const snackBar = SnackBar(
                                content: Text('Gagal Menampilkan Lokasi!'),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
