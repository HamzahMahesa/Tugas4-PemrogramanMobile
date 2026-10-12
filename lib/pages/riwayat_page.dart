import 'package:flutter/material.dart';

class RiwayatPage extends StatelessWidget {
  const RiwayatPage({super.key});

  static const List<Map<String, String>> _riwayat = [
    {
      'judul': 'Pemrograman Flutter untuk Pemula',
      'penulis': 'John Doe',
      'pinjam': '01 Jan 2024',
      'kembali': '15 Jan 2024',
      'status': 'Dikembalikan',
    },
    {
      'judul': 'Belajar Dart dengan Cepat',
      'penulis': 'Jane Smith',
      'pinjam': '05 Feb 2024',
      'kembali': '20 Feb 2024',
      'status': 'Dipinjam',
    },
    {
      'judul': 'Desain UI/UX untuk Aplikasi Mobile',
      'penulis': 'Alice Johnson',
      'pinjam': '10 Mar 2024',
      'kembali': '25 Mar 2024',
      'status': 'Terlambat',
    },
  ];

  Color _statusColor(String status) {
    switch (status) {
      case 'Dikembalikan':
        return Colors.green;
      case 'Dipinjam':
        return Colors.orange;
      case 'Terlambat':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF007BFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF007BFF),
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Riwayat Peminjaman',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: _riwayat.length,
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final item = _riwayat[index];
            final color = _statusColor(item['status']!);

            return Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFEBF3FE),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.menu_book, color: Colors.blue),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['judul']!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          item['penulis']!,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${item['pinjam']} - ${item['kembali']}',
                          style: const TextStyle(
                            fontSize: 10.5,
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      item['status']!,
                      style: TextStyle(
                        color: color,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
