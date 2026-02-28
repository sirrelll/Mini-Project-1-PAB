# Film Favorit

Aplikasi mobile manajemen data film favorit berbasis Flutter.

---

## Deskripsi Aplikasi

Film Favorit adalah aplikasi mobile berbasis Flutter yang dirancang untuk membantu pengguna mencatat dan mengelola koleksi film favorit mereka. Pengguna dapat menyimpan informasi film berupa judul, genre, dan sutradara, kemudian menampilkan, mengedit, maupun menghapus data tersebut kapan saja. Aplikasi ini menggunakan konsep multi-halaman dengan sistem navigasi bawaan Flutter.
---

## Fitur Aplikasi

| Fitur | Keterangan |
|-------|------------|
| Tambah Film (Create) | Menambahkan data film baru melalui form input yang terdiri dari 3 TextField |
| Lihat Daftar Film (Read) | Menampilkan seluruh data film yang telah disimpan dalam bentuk list |
| Edit Film (Update) | Mengubah data film yang sudah ada, form akan terisi otomatis dengan data lama |
| Hapus Film (Delete) | Menghapus data film dari daftar |
| Validasi Form | Memastikan semua field terisi sebelum data disimpan |
| Multi-Page Navigation | Berpindah antar halaman menggunakan Navigator bawaan Flutter |

---

## Widget yang Digunakan

### StatelessWidget
StatelessWidget adalah widget yang tidak memiliki state atau kondisi yang berubah-ubah. Widget ini cocok digunakan untuk tampilan yang bersifat statis dan tidak memerlukan perubahan data secara dinamis.

| Widget | Digunakan Pada |
|--------|---------------|
| `MyApp` | Konfigurasi utama aplikasi, hanya dijalankan sekali |

### StatefulWidget
StatefulWidget adalah widget yang memiliki state yang dapat berubah sewaktu-waktu. Setiap kali state berubah melalui fungsi setState(), tampilan akan diperbarui secara otomatis oleh Flutter.

| Widget | Digunakan Pada |
|--------|---------------|
| `HomeScreen` | Halaman utama, state berubah saat film ditambah, diedit, atau dihapus |
| `FormFilmScreen` | Halaman form, state digunakan untuk menyimpan isi TextField |

---

## Dokumentasi Project
## Tampilan Awal
<img width="640" height="1025" alt="Screenshot 2026-02-27 212346" src="https://github.com/user-attachments/assets/f0b7eb6a-959f-4334-bdc0-a94cd360760b" />

---
## Tampilan Menambahkan Film Favorit
<img width="640" height="1025" alt="Screenshot 2026-02-27 212355" src="https://github.com/user-attachments/assets/22b4095c-f300-4b00-8669-53990c9e4095" />

---
## Mengisi Form dan Menambahkan sebagai film favorit
<img width="640" height="1025" alt="Screenshot 2026-02-27 212505" src="https://github.com/user-attachments/assets/543f3979-22db-4588-a5bc-dadd67523c8c" />

---
## Tampilan setelah menambahkan film favorit
<img width="640" height="1025" alt="Screenshot 2026-02-27 212511" src="https://github.com/user-attachments/assets/f4c00f96-ccbf-4e0c-ae7d-659c2ef8bbe8" />

---
## Tampilan mengedit film 
<img width="640" height="1025" alt="Screenshot 2026-02-27 212521" src="https://github.com/user-attachments/assets/4f4ffeeb-7946-440c-b131-2f9291e81ec1" />

---
## Tampilan setelah film diedit
<img width="640" height="1025" alt="Screenshot 2026-02-27 212527" src="https://github.com/user-attachments/assets/0599ebf6-02dc-43f5-b65a-2a0a1a3eb00b" />

---
## Film tidak bisa ditambahkan jika ada textfield yang masih kosong
<img width="640" height="1025" alt="Screenshot 2026-02-27 212615" src="https://github.com/user-attachments/assets/cc402c4d-2808-4296-af5d-53bd341ec3ba" />

---
## Menghapus film dengan menekan tombol sampah
<img width="640" height="1025" alt="Screenshot 2026-02-27 212545" src="https://github.com/user-attachments/assets/7ff971c7-723c-421a-b16f-9a54513bc133" />

---
## Tampilan setelah menghapus sebuah film
<img width="640" height="1025" alt="Screenshot 2026-02-27 212557" src="https://github.com/user-attachments/assets/5ef5a7c1-62dc-4171-a977-0757f21bd185" />


---
Darel Prasetya Fawwaz
2409116064
Sistem Informasi B 24
