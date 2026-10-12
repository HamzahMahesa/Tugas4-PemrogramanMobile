import 'package:flutter/material.dart';

// =========================================================
// HOME PAGE - Dashboard Perpustakaan Kampus
// =========================================================
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF007BFF),
      body: SafeArea(
        child: Column(
          children: [
            // Header Section
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Halo, Mahesa!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Perpustakaan Kampus',
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, color: Colors.blue, size: 20),
                  ),
                ],
              ),
            ),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 4.0,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 38,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.search,
                            color: Colors.grey,
                            size: 18,
                          ),
                          hintText: 'Cari buku, penulis, atau kategori...',
                          hintStyle: TextStyle(
                            fontSize: 11,
                            color: Colors.grey,
                          ),
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.tune, color: Colors.blue, size: 20),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // Area Grid Menu
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1.25,
                  physics: const BouncingScrollPhysics(),
                  children: const [
                    GridMenuItem(
                      title: 'Daftar Buku',
                      subtitle: 'Lihat koleksi buku yang tersedia',
                      icon: Icons.menu_book,
                      iconColor: Colors.blue,
                      bgColor: Color(0xFFEBF3FE),
                    ),
                    GridMenuItem(
                      title: 'Tambah Buku',
                      subtitle: 'Tampilkan data buku baru',
                      icon: Icons.add_circle,
                      iconColor: Colors.green,
                      bgColor: Color(0xFFE8F8F0),
                    ),
                    GridMenuItem(
                      title: 'Riwayat Peminjaman',
                      subtitle: 'Lihat buku yang dipinjam',
                      icon: Icons.history,
                      iconColor: Colors.orange,
                      bgColor: Color(0xFFFFF4E5),
                    ),
                    GridMenuItem(
                      title: 'Kategori Buku',
                      subtitle: 'Jelajahi kategori buku',
                      icon: Icons.grid_view,
                      iconColor: Colors.purple,
                      bgColor: Color(0xFFF3E8FF),
                    ),
                    GridMenuItem(
                      title: 'Buku Favorit',
                      subtitle: 'Lihat buku yang disimpan',
                      icon: Icons.favorite,
                      iconColor: Colors.pink,
                      bgColor: Color(0xFFFFEBF0),
                    ),
                    GridMenuItem(
                      title: 'Profil Saya',
                      subtitle: 'Lihat & kelola akun',
                      icon: Icons.person_pin,
                      iconColor: Colors.blueAccent,
                      bgColor: Color(0xFFE3F2FD),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GridMenuItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  final VoidCallback? onTap;

  const GridMenuItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    required this.bgColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: bgColor,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(padding: const EdgeInsets.all(8), child: _content()),
      ),
    );
  }

  Widget _content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor, size: 18),
            ),
            const Icon(Icons.chevron_right, color: Colors.grey, size: 16),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 9.5, color: Colors.black54),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ],
    );
  }
}
