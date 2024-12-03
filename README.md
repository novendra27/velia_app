# Velia App - Aplikasi Penyewaan Hotel

**Velia App** adalah aplikasi berbasis Flutter yang memungkinkan pengguna untuk mencari dan memesan hotel dengan mudah. Aplikasi ini mengintegrasikan data hotel melalui API eksternal dan memberikan pengalaman pengguna yang intuitif dan responsif.

## Cara Menjalankan Aplikasi pada Device Pengguna

1. **Persyaratan Sistem**
   - Pastikan perangkat Anda sudah terinstal **Flutter SDK** dan **Android Studio** atau **Xcode** (untuk pengguna macOS).
   - Pastikan perangkat Android/iOS sudah terhubung ke komputer atau emulator diaktifkan.

2. **Instalasi**
   - Clone repositori ini ke perangkat lokal Anda menggunakan perintah:
     ```bash
     git clone https://github.com/novendra27/velia_app.git
     ```
   
   - Navigasi ke direktori proyek:
     ```bash
     cd velia_app
     ```

   - Instal semua dependensi yang dibutuhkan:
     ```bash
     flutter pub get
     ```

3. **Menjalankan Aplikasi**
   - Untuk menjalankan aplikasi di perangkat Android atau iOS, gunakan perintah:
     ```bash
     flutter run
     ```

   - Pastikan emulator Android/iOS atau perangkat fisik Anda terhubung sebelum menjalankan perintah ini.

## Konfigurasi API (API Key dan Host)

Aplikasi ini mengakses data hotel menggunakan API eksternal melalui **RapidAPI**. Anda perlu mengonfigurasi API key dan host yang digunakan oleh aplikasi.

1. Daftar dan buat akun di **[RapidAPI](https://rapidapi.com/)**.
2. Cari **Booking.com API** dan ambil **API Key** dari dashboard RapidAPI.
3. Setelah mendapatkan API Key, buka file **HotelApiService.dart** dan perbarui bagian **headers** di dalam permintaan API:

   ```dart
   final response = await _dio.get('/v1/static/hotels',
       queryParameters: {'page': 0},
       options: Options(headers: {
         'x-rapidapi-key': 'YOUR_API_KEY',
         'x-rapidapi-host': 'booking-com.p.rapidapi.com',
       }));
