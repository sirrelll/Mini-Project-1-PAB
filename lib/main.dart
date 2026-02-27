import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


class Film {
  String judul;
  String genre;
  String sutradara;

  Film({
    required this.judul,
    required this.genre,
    required this.sutradara,
  });
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Film Favorit',
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Film> daftarFilm = [];

  // Hapus film
  void hapusFilm(int index) {
    setState(() {
      daftarFilm.removeAt(index);
    });
  }

  void keTambah() async {
    final Film? filmBaru = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FormFilmScreen()),
    );
    if (filmBaru != null) {
      setState(() {
        daftarFilm.add(filmBaru);
      });
    }
  }

  void keEdit(int index) async {
    final Film? filmEdited = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FormFilmScreen(
          filmEdit: daftarFilm[index], // kirim data film lama
          index: index,                // kirim posisinya
        ),
      ),
    );
    if (filmEdited != null) {
      setState(() {
        daftarFilm[index] = filmEdited; // ganti film lama dengan yang baru
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Film Favorit'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: daftarFilm.isEmpty
          ? const Center(
              child: Text(
                'Belum ada film.\nTekan tombol + untuk menambah.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: daftarFilm.length,
              itemBuilder: (context, index) {
                final film = daftarFilm[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 6),
                  child: ListTile(
                    leading: const Icon(Icons.movie, color: Colors.red),
                    title: Text(film.judul),
                    subtitle: Text('${film.genre} • ${film.sutradara}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min, 
                      children: [

                        // Tombol Edit
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () => keEdit(index),
                        ),

                        // Tombol Hapus
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => hapusFilm(index),
                        ),

                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: keTambah,
        backgroundColor: Colors.red,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}


class FormFilmScreen extends StatefulWidget {
  final Film? filmEdit; // data film lama (null kalau mode tambah)
  final int? index;     // posisi film di list (null kalau mode tambah)

  const FormFilmScreen({
    super.key,
    this.filmEdit,
    this.index,
  });

  @override
  State<FormFilmScreen> createState() => _FormFilmScreenState();
}

class _FormFilmScreenState extends State<FormFilmScreen> {
  final TextEditingController judulController = TextEditingController();
  final TextEditingController genreController = TextEditingController();
  final TextEditingController sutradaraController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.filmEdit != null) {
      judulController.text = widget.filmEdit!.judul;
      genreController.text = widget.filmEdit!.genre;
      sutradaraController.text = widget.filmEdit!.sutradara;
    }
  }

  void simpan() {
    String judul = judulController.text.toString().trim();
    String genre = genreController.text.toString().trim();
    String sutradara = sutradaraController.text.toString().trim();

    if (judul == '' || genre == '' || sutradara == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Semua field harus diisi!')),
      );
      return;
    }

    final Film film = Film(
      judul: judul,
      genre: genre,
      sutradara: sutradara,
    );

    Navigator.pop(context, film);
  }

  @override
  Widget build(BuildContext context) {
    bool isEdit = widget.filmEdit != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Edit Film' : 'Tambah Film'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // TextField 1 — Judul
            TextField(
              controller: judulController,
              decoration: const InputDecoration(
                labelText: 'Judul Film',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // TextField 2 — Genre
            TextField(
              controller: genreController,
              decoration: const InputDecoration(
                labelText: 'Genre',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // TextField 3 — Sutradara
            TextField(
              controller: sutradaraController,
              decoration: const InputDecoration(
                labelText: 'Sutradara',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),

            // Tombol Simpan
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: simpan,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: Text(
                  isEdit ? 'Simpan Perubahan' : 'Simpan',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}