# Course Explorer v2 - Architecture Documentation

**Nama:** Achmad Dhanil Ahkam  
**NIM:** 2415051049  

---

## Folder Structure & Responsibility Audit

* **`lib/models/`**: Mendefinisikan struktur data entitas (`Course`) dan konversi JSON (`fromJson`/`toJson`).
* **`lib/services/`**: Menangani pembacaan data mentah dari `rootBundle` JSON.
* **`lib/repositories/`**: Abstraksi data perantara antara Service dan Provider.
* **`lib/providers/`**: Mengelola state aplikasi (`ChangeNotifier`), statistik, dan list favorit.
* **`lib/screens/`**: Menampilkan UI utama aplikasi secara responsif.
* **`lib/widgets/`**: Komponen UI yang dapat digunakan kembali (*reusable*).