import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kartu Profil Responsif',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const ProfileCardPage(),
    );
  }
}

class ProfileCardPage extends StatelessWidget {
  const ProfileCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Poin 5: Menggunakan LayoutBuilder untuk responsivitas (lebar layar)
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Kartu Profil'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              bool isWideScreen = constraints.maxWidth > 600;

              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  padding: const EdgeInsets.all(24.0),
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: isWideScreen
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _buildAvatarSection(),
                            const SizedBox(width: 32),
                            Expanded(child: _buildInfoSection()),
                          ],
                        )
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _buildAvatarSection(),
                            const SizedBox(height: 24),
                            _buildInfoSection(),
                          ],
                        ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  // Poin 1 & 3: Foto Profil Emoji dengan Badge "Available" menggunakan Stack + Positioned
  Widget _buildAvatarSection() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: 60,
          backgroundColor: Colors.amber[100],
          child: const Text(
            '👨‍💻',
            style: TextStyle(
              fontSize: 65,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: const Text(
              'Available',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Poin 1, 2, & 4: Nama, Prodi, Deskripsi, Row Kontak, dan Wrap Skill
  Widget _buildInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Poin 1: Nama Lengkap
        const Text(
          'BIMO ADI NUGROHO',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),

        // Poin 1: Prodi / Jabatan
        Text(
          'Sistem Informasi',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[700],
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 12),

        // Poin 1: Deskripsi Singkat
        Text(
          'Mahasiswa Sistem Informasi yang tertarik pada pengembangan aplikasi mobile, analisis sistem, serta manajemen basis data.',
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 16),

        // Poin 2: Row untuk 3 ikon sosial media / kontak
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(Icons.email, color: Colors.blue),
              onPressed: () {},
              tooltip: 'Email',
            ),
            IconButton(
              icon: const Icon(Icons.phone, color: Colors.green),
              onPressed: () {},
              tooltip: 'Telepon',
            ),
            IconButton(
              icon: const Icon(Icons.code, color: Colors.purple),
              onPressed: () {},
              tooltip: 'GitHub',
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Poin 4: Wrap dengan Chip untuk minimal 3 skill/keahlian
        const Text(
          'Skills:',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children: const [
            Chip(label: Text('Flutter')),
            Chip(label: Text('Dart')),
            Chip(label: Text('System Analysis')),
            Chip(label: Text('SQL')),
            Chip(label: Text('Git')),
          ],
        ),
      ],
    );
  }
}
