import 'package:flutter/material.dart';

double finalResult = 0;

List<Makanan> pokok = const [
  Makanan(
    nama: 'Nasi Putih',
    image: 'assets/images/food_assets/Nasi_putih.png',
    kalori: 242,
    keterangan: 'Nasi putih 100gr',
    category: '1',
  ),
  Makanan(
    nama: 'Nasi Merah',
    image: 'assets/images/food_assets/Nasi_merah.png',
    kalori: 215,
    keterangan: 'Nasi putih 100gr',
    category: '1',
  ),
  Makanan(
    nama: 'Kentang Rebus',
    image: 'assets/images/food_assets/Kentang_rebus.png',
    kalori: 87,
    keterangan: 'Kentang rebus 100gr',
    category: '1',
  ),
  Makanan(
    nama: 'Roti',
    image: 'assets/images/food_assets/Roti.png',
    kalori: 106,
    keterangan: 'Roti satu lembar',
    category: '1',
  ),
  Makanan(
    nama: 'Ubi Rebus',
    image: 'assets/images/food_assets/Ubi.png',
    kalori: 86.0,
    keterangan: 'Ubi rebus 100gr',
    category: '1',
  ),
  Makanan(
    nama: 'Singkong Rebus',
    image: 'assets/images/food_assets/Singkong.png',
    kalori: 112,
    keterangan: 'Singkong rebus 100gr',
    category: '1',
  ),
  Makanan(
    nama: 'Nasi goreng',
    image: 'assets/images/food_assets/Nasi_goreng.png',
    kalori: 168,
    keterangan: 'Nasi Goreng 100gr',
    category: '1',
  ),
  Makanan(
    nama: 'Mie',
    image: 'assets/images/food_assets/Mie.png',
    kalori: 240,
    keterangan: 'Satu Porsi Mie Instan 240gr',
    category: '1',
  ),
];
List<Makanan> lauk = const [
  Makanan(
    nama: 'Ayam Bakar',
    image: 'assets/images/food_assets/Ayam_bakar.png',
    kalori: 167,
    keterangan: 'Ayam bakar 100gr',
    category: '2',
  ),
  Makanan(
    nama: 'Ayam Goreng',
    image: 'assets/images/food_assets/Ayam_goreng.png',
    kalori: 260,
    keterangan: 'Ayam goreng 100gr',
    category: '2',
  ),
  Makanan(
    nama: 'Ayam Krispi',
    image: 'assets/images/food_assets/Ayam_krispi.png',
    kalori: 170,
    keterangan: 'Ayam krispi 1 potong',
    category: '2',
  ),
  Makanan(
    nama: 'Ikan Goreng',
    image: 'assets/images/food_assets/Ikan_goreng.png',
    kalori: 204,
    keterangan: 'Ikan goreng 1 porsi',
    category: '2',
  ),
  Makanan(
    nama: 'Lele Goreng',
    image: 'assets/images/food_assets/Lele_goreng.png',
    kalori: 204,
    keterangan: 'Lele goreng 1 porsi',
    category: '2',
  ),
  Makanan(
    nama: 'Nugget Ayam',
    image: 'assets/images/food_assets/Nugget.png',
    kalori: 260,
    keterangan: 'Nugget ayam 100gr',
    category: '2',
  ),
  Makanan(
    nama: 'Rendang daging',
    image: 'assets/images/food_assets/Rendang.png',
    kalori: 195,
    keterangan: 'Rendang daging 100gr',
    category: '2',
  ),
  Makanan(
    nama: 'Sate Ayam',
    image: 'assets/images/food_assets/Sate_ayam.png',
    kalori: 170,
    keterangan: '5 tusuk sate ayam',
    category: '2',
  ),
  Makanan(
    nama: 'Sosis Goreng',
    image: 'assets/images/food_assets/Sosis.png',
    kalori: 45,
    keterangan: 'Sosis goreng 1 buah',
    category: '2',
  ),
  Makanan(
    nama: 'Tahu Goreng',
    image: 'assets/images/food_assets/Tahu_goreng.png',
    kalori: 78,
    keterangan: 'Tahu goreng 100gr',
    category: '2',
  ),
  Makanan(
    nama: 'Telur Goreng',
    image: 'assets/images/food_assets/Telur_goreng.png',
    kalori: 89,
    keterangan: 'Telur goreng 1 butir',
    category: '2',
  ),
  Makanan(
    nama: 'Telur Rebus',
    image: 'assets/images/food_assets/Telur_rebus.png',
    kalori: 68,
    keterangan: 'Telur rebus 1 butir',
    category: '2',
  ),
  Makanan(
    nama: 'Tempe Goreng',
    image: 'assets/images/food_assets/Tempe_goreng.png',
    kalori: 162,
    keterangan: 'Tempe goreng 100gr',
    category: '2',
  ),
];
List<Makanan> sayur = const [
  Makanan(
    nama: 'Bayam',
    image: 'assets/images/food_assets/Bayam.png',
    kalori: 23,
    keterangan: 'Bayam rebus 100gr',
    category: '3',
  ),
  Makanan(
    nama: 'Brokoli',
    image: 'assets/images/food_assets/Brokoli.png',
    kalori: 34,
    keterangan: 'Brokoli rebus 100gr',
    category: '3',
  ),
  Makanan(
    nama: 'Jagung',
    image: 'assets/images/food_assets/Jagung.png',
    kalori: 59,
    keterangan: 'Jagung rebus 1 buah',
    category: '3',
  ),
  Makanan(
    nama: 'Kangkung',
    image: 'assets/images/food_assets/Kangkung.png',
    kalori: 20,
    keterangan: 'Kangkung rebus 100gr',
    category: '3',
  ),
  Makanan(
    nama: 'Salad',
    image: 'assets/images/food_assets/Salad.png',
    kalori: 12,
    keterangan: '1 mangkuk salad',
    category: '3',
  ),
  Makanan(
    nama: 'Sayur Sop',
    image: 'assets/images/food_assets/Sayur_sop.png',
    kalori: 75,
    keterangan: '1 mangkuk Sayur sop',
    category: '3',
  ),
  Makanan(
    nama: 'Terong',
    image: 'assets/images/food_assets/Terong_rebus.png',
    kalori: 66,
    keterangan: 'Terong rebus 100gr',
    category: '3',
  ),
  Makanan(
    nama: 'Wortel',
    image: 'assets/images/food_assets/Wortel.png',
    kalori: 20,
    keterangan: 'Wortel rebus 100gr',
    category: '3',
  ),
];
List<Makanan> buah = const [
  Makanan(
    nama: 'Alpukat',
    image: 'assets/images/food_assets/Alpukat.png',
    kalori: 322,
    keterangan: '1 buah alpukat',
    category: '4',
  ),
  Makanan(
    nama: 'Anggur',
    image: 'assets/images/food_assets/Anggur.png',
    kalori: 67,
    keterangan: 'Anggur 100gr',
    category: '4',
  ),
  Makanan(
    nama: 'Apel',
    image: 'assets/images/food_assets/Apel.png',
    kalori: 72,
    keterangan: '1 buah apel',
    category: '4',
  ),
  Makanan(
    nama: 'Buah Naga',
    image: 'assets/images/food_assets/Buah_naga.png',
    kalori: 50,
    keterangan: '1 buah buah naga',
    category: '4',
  ),
  Makanan(
    nama: 'Jambu Batu',
    image: 'assets/images/food_assets/Jambu_batu.png',
    kalori: 68,
    keterangan: 'Jambu batu 100gr',
    category: '4',
  ),
  Makanan(
    nama: 'Jeruk',
    image: 'assets/images/food_assets/Jeruk.png',
    kalori: 62,
    keterangan: '1 buah jeruk',
    category: '4',
  ),
  Makanan(
    nama: 'Mangga',
    image: 'assets/images/food_assets/Mangga.png',
    kalori: 107,
    keterangan: '1 buah mangga',
    category: '4',
  ),
  Makanan(
    nama: 'Melon',
    image: 'assets/images/food_assets/Melon.png',
    kalori: 34,
    keterangan: 'Melon 100gr',
    category: '4',
  ),
  Makanan(
    nama: 'Pepaya',
    image: 'assets/images/food_assets/Pepaya.png',
    kalori: 55,
    keterangan: '1 potong pepaya',
    category: '4',
  ),
  Makanan(
    nama: 'Pisang',
    image: 'assets/images/food_assets/Pisang.png',
    kalori: 105,
    keterangan: '1 sisir pisang',
    category: '4',
  ),
  Makanan(
    nama: 'Semangka',
    image: 'assets/images/food_assets/Semangka.png',
    kalori: 30,
    keterangan: 'semangka 100gr',
    category: '4',
  ),
  Makanan(
    nama: 'Strawberry',
    image: 'assets/images/food_assets/Strawberry.png',
    kalori: 32,
    keterangan: 'Strawberry 100gr',
    category: '4',
  ),
];

List<Makanan> minuman = const [
  Makanan(
    nama: 'Air Putih',
    image: 'assets/images/food_assets/Air_putih.png',
    kalori: 0,
    keterangan: '1 gelas air putih',
    category: '5',
  ),
  Makanan(
    nama: 'Boba',
    image: 'assets/images/food_assets/Boba.png',
    kalori: 374,
    keterangan: '500ml minuman boba',
    category: '5',
  ),
  Makanan(
    nama: 'Cola',
    image: 'assets/images/food_assets/Cola.png',
    kalori: 170,
    keterangan: '425ml minuman cola',
    category: '5',
  ),
  Makanan(
    nama: 'Es Kopi Latte',
    image: 'assets/images/food_assets/Es_kopi_latte.png',
    kalori: 142,
    keterangan: '500ml kopi latte',
    category: '5',
  ),
  Makanan(
    nama: 'Es Teh Manis',
    image: 'assets/images/food_assets/Es_teh_manis.png',
    kalori: 90,
    keterangan: '1 gelas es teh manis',
    category: '5',
  ),
  Makanan(
    nama: 'Susu',
    image: 'assets/images/food_assets/Susu.png',
    kalori: 122,
    keterangan: '1 gelas susu',
    category: '5',
  ),
];

final List<Piring> piring = [
  Piring(
    nama: 'Pokok',
    image: 'assets/images/pokok.png',
    category: '1',
  ),
  Piring(
    nama: 'Lauk',
    image: 'assets/images/lauk.png',
    category: '2',
  ),
  Piring(
    nama: 'Sayur',
    image: 'assets/images/sayur.png',
    category: '3',
  ),
  Piring(
    nama: 'buah',
    image: 'assets/images/buah.png',
    category: '4',
  ),
];

@immutable
class Makanan {
  const Makanan({
    required this.kalori,
    required this.nama,
    required this.category,
    required this.image,
    required this.keterangan,
  });
  final double kalori;
  final String nama;
  final String category;
  final String image;
  final String keterangan;
  // String get formattedTotalMakananPrice =>
  //     '\$${(totalPriceCents / 100.0).toStringAsFixed(2)}';
}

class Piring {
  Piring({
    required this.nama,
    required this.image,
    required this.category,
    List<Makanan>? makanan,
  }) : makanan = makanan ?? [];

  final String nama;
  final String image;
  final String category;
  final List<Makanan> makanan;

  // String get formattedTotalMakananPrice {
  //   final totalPriceCents =
  //       items.fold<int>(0, (prev, item) => prev + item.totalPriceCents);
  //   return '\$${(totalPriceCents / 100.0).toStringAsFixed(2)}';
  // }
}
