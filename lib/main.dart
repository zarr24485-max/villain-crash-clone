import 'package:flutter/material.dart';

void main() => runApp(const VillainCloneApp());

const navy = Color(0xFF081321);
const panel = Color(0xFF10223B);
const blue = Color(0xFF63A4FF);
const cyan = Color(0xFF48D7FF);
const muted = Color(0xFF8799B3);

class VillainCloneApp extends StatelessWidget {
  const VillainCloneApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Villain Crash",
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: navy,
        colorScheme: ColorScheme.fromSeed(seedColor: blue, brightness: Brightness.dark),
        fontFamily: 'ShareTechMono',
        useMaterial3: true,
      ),
      home: const MainShell(),
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});
  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int tab = 0;
  final titles = ['Home', 'WhatsApp Tools', 'Information', 'Tools'];
  @override
  Widget build(BuildContext context) {
    final pages = [
      const HomePage(),
      const SenderPage(),
      const InfoPage(),
      const ToolsPage(),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF10213B),
        elevation: 0,
        titleSpacing: 8,
        leading: IconButton(icon: const Icon(Icons.menu), onPressed: () => Scaffold.of(context).openDrawer()),
        title: Row(children: [
          Container(width: 3, height: 22, decoration: BoxDecoration(color: cyan, borderRadius: BorderRadius.circular(4))),
          const SizedBox(width: 12),
          const Text('Hello, Ghoul', style: TextStyle(fontFamily: 'Orbitron', fontSize: 15)),
        ]),
        actions: const [
          Icon(Icons.headset_mic_outlined, color: blue),
          SizedBox(width: 18),
          CircleAvatar(radius: 17, backgroundImage: AssetImage('assets/images/poto.jpg')),
          SizedBox(width: 16),
        ],
      ),
      drawer: const VillainDrawer(),
      body: pages[tab],
      bottomNavigationBar: NavigationBar(
        backgroundColor: const Color(0xFF1B3859),
        indicatorColor: blue.withOpacity(.35),
        selectedIndex: tab,
        onDestinationSelected: (v) => setState(() => tab = v),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.chat_bubble_outline), label: 'WhatsApp'),
          NavigationDestination(icon: Icon(Icons.code), label: 'Information'),
          NavigationDestination(icon: Icon(Icons.handyman_outlined), label: 'Tools'),
        ],
      ),
    );
  }
}

class VillainDrawer extends StatelessWidget {
  const VillainDrawer({super.key});
  @override
  Widget build(BuildContext context) => Drawer(
    backgroundColor: panel,
    child: SafeArea(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(height: 190, width: double.infinity,
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/side.jpg'), fit: BoxFit.cover)),
        alignment: Alignment.bottomCenter,
        child: Container(width: double.infinity, padding: const EdgeInsets.all(16),
          color: navy.withOpacity(.65),
          child: const Text('GHOUL  ·  FULLUP', style: TextStyle(fontFamily: 'Orbitron')))),
      const Padding(padding: EdgeInsets.fromLTRB(20,22,20,8), child: Text('MORE TOOLS', style: TextStyle(color: muted))),
      const DrawerTile(icon: Icons.handyman, title: 'All Tools'),
      const DrawerTile(icon: Icons.forum, title: 'Public Chat'),
      const DrawerTile(icon: Icons.send, title: 'Community'),
      const Divider(height: 32, color: Colors.white12),
      const Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Text('HELP & DEVELOPER', style: TextStyle(color: muted))),
      const DrawerTile(icon: Icons.code, title: 'About this clone'),
      const DrawerTile(icon: Icons.help_outline, title: 'Help'),
    ])),
  );
}

class DrawerTile extends StatelessWidget {
  final IconData icon; final String title;
  const DrawerTile({super.key, required this.icon, required this.title});
  @override
  Widget build(BuildContext context) => ListTile(
    leading: Icon(icon, color: cyan), title: Text(title),
    onTap: () => Navigator.pop(context),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) => ListView(padding: const EdgeInsets.all(16), children: [
    Container(
      padding: const EdgeInsets.all(20), height: 190,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(colors: [Color(0xFF244D79), Color(0xFF111C3B)], begin: Alignment.topLeft, end: Alignment.bottomRight),
        border: Border.all(color: blue.withOpacity(.35)),
      ),
      child: Stack(children: [
        const Positioned(right: 4, top: 24, child: Icon(Icons.timer_outlined, size: 64, color: Colors.white24)),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('VILLAIN CRASH', style: TextStyle(color: Colors.white70, letterSpacing: 2)),
          const Spacer(),
          const Text('Selamat Datang,\\nGHOUL', style: TextStyle(fontFamily: 'Orbitron', fontSize: 20)),
          const SizedBox(height: 12),
          const Wrap(spacing: 8, children: [SmallPill(text: '2054-03-19'), SmallPill(text: 'FULLUP')]),
        ])
      ]),
    ),
    const SizedBox(height: 18),
    const Row(children: [
      Expanded(child: SmallPill(text: 'Public Chat')),
      SizedBox(width: 8), Expanded(child: SmallPill(text: 'Al-Qur’an')),
      SizedBox(width: 8), Expanded(child: SmallPill(text: 'Games')),
    ]),
    const SizedBox(height: 24),
    const SectionTitle('Berita Terkini'),
    const SizedBox(height: 12),
    ClipRRect(borderRadius: BorderRadius.circular(20), child: Image.asset('assets/images/side.jpg', height: 160, fit: BoxFit.cover)),
    const SizedBox(height: 24),
    const SectionTitle('Statistik Akun'),
    const SizedBox(height: 12),
    const Row(children: [
      Expanded(child: StatCard(icon: Icons.event_available, label: 'EXPIRED', value: '2054-03-19')),
      SizedBox(width: 8), Expanded(child: StatCard(icon: Icons.person, label: 'ROLE', value: 'FULLUP')),
      SizedBox(width: 8), Expanded(child: StatCard(icon: Icons.access_time, label: 'RUNTIME', value: '00:00')),
    ]),
    const SizedBox(height: 24),
    const SectionTitle('Tools'),
    const SizedBox(height: 12),
    GridView.count(shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), crossAxisCount: 4, mainAxisSpacing: 10, crossAxisSpacing: 10, childAspectRatio: .78,
      children: const [
        HomeTool(icon: Icons.cast_for_education, title: 'Ceramah'),
        HomeTool(icon: Icons.menu_book, title: 'Al-Qur’an'),
        HomeTool(icon: Icons.sports_esports, title: 'Games'),
        HomeTool(icon: Icons.book, title: 'Buku'),
        HomeTool(icon: Icons.auto_stories, title: 'Komik'),
        HomeTool(icon: Icons.forum, title: 'Chat'),
        HomeTool(icon: Icons.smart_toy, title: 'Bot Demo'),
        HomeTool(icon: Icons.assistant, title: 'AI Chat'),
      ]),
    const SizedBox(height: 20),
    const SectionTitle('Quick Actions'),
    const SizedBox(height: 12),
    const ActionCard(icon: Icons.send, title: 'Join Community', subtitle: 'Info dan diskusi komunitas'),
    const SizedBox(height: 10),
    const ActionCard(icon: Icons.phone_android, title: 'Device Safety', subtitle: 'Panduan keamanan perangkat'),
  ]);
}

class SenderPage extends StatefulWidget {
  const SenderPage({super.key});
  @override
  State<SenderPage> createState() => _SenderPageState();
}
class _SenderPageState extends State<SenderPage> {
  final List<String> senders = [];
  @override
  Widget build(BuildContext context) => Stack(children: [
    Positioned(top: 20, left: 18, child: Text('My Senders (${senders.length})', style: const TextStyle(fontFamily: 'Orbitron', fontSize: 18, color: Color(0xFFB9D6FF)))),
    if (senders.isEmpty) Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
      const CircleAvatar(radius: 48, backgroundColor: panel, child: Icon(Icons.phone_disabled, size: 44, color: blue)),
      const SizedBox(height: 24),
      const Text('No Senders Found', style: TextStyle(fontFamily: 'Orbitron', color: Color(0xFFB9D6FF), fontSize: 17)),
      const SizedBox(height: 20),
      FilledButton.icon(onPressed: _add, icon: const Icon(Icons.add), label: const Text('Add Sender')),
    ])) else ListView(padding: const EdgeInsets.fromLTRB(16,70,16,90), children: senders.map((s) => Card(color: panel, child: ListTile(leading: const Icon(Icons.person, color: cyan), title: Text(s), trailing: IconButton(icon: const Icon(Icons.delete_outline), onPressed: () => setState(() => senders.remove(s)))))).toList()),
    Positioned(right: 20, bottom: 24, child: FloatingActionButton(onPressed: _add, child: const Icon(Icons.add))),
  ]);
  void _add() {
    final c = TextEditingController();
    showDialog(context: context, builder: (_) => AlertDialog(
      title: const Text('Add local contact label'),
      content: TextField(controller: c, decoration: const InputDecoration(hintText: 'e.g. My test device')),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
        FilledButton(onPressed: () { if (c.text.trim().isNotEmpty) setState(() => senders.add(c.text.trim())); Navigator.pop(context); }, child: const Text('Save')),
      ],
    ));
  }
}

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});
  final rules = const [
    ['Larangan Barter Akun', 'Akun tidak boleh ditukar dengan barang, jasa, atau akun lain.'],
    ['Larangan Membagikan Akun', 'Setiap akun bersifat pribadi dan hanya boleh digunakan pemiliknya.'],
    ['Larangan Menjual Akun', 'Penjualan akun hanya boleh dilakukan oleh role yang diizinkan.'],
    ['Lindungi Data Pribadi', 'Jangan membagikan kata sandi, OTP, atau data sensitif.'],
    ['Gunakan Secara Bertanggung Jawab', 'Hormati privasi dan keamanan pengguna lain.'],
  ];
  @override
  Widget build(BuildContext context) => ListView(padding: const EdgeInsets.all(16), children: [
    Center(child: Container(padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12), decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(28)), child: const Text('RULES & INFO', style: TextStyle(fontFamily: 'Orbitron')))),
    const SizedBox(height: 22),
    Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(18), border: Border.all(color: Colors.white12)), child: const Row(children: [Icon(Icons.circle, color: Colors.amber, size: 12), SizedBox(width: 12), Expanded(child: Text('System Status: DEMO MODE')), SmallPill(text: 'ACTIVE')])),
    const SizedBox(height: 24),
    const SectionTitle('USER RULES'),
    const SizedBox(height: 14),
    ...rules.asMap().entries.map((e) => Container(margin: const EdgeInsets.only(bottom: 12), padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.white12)), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CircleAvatar(radius: 17, backgroundColor: const Color(0xFF087FAE), child: Text('${e.key+1}')),
      const SizedBox(width: 14), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(e.value[0], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)), const SizedBox(height: 8), Text(e.value[1], style: const TextStyle(color: muted, height: 1.4))]))
    ]))),
    Container(padding: const EdgeInsets.all(22), decoration: BoxDecoration(color: const Color(0xFF321C2B), borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.redAccent.withOpacity(.3))), child: const Column(children: [Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 42), SizedBox(height: 10), Text('SANCTIONS', style: TextStyle(color: Colors.redAccent, fontFamily: 'Orbitron', letterSpacing: 3)), SizedBox(height: 8), Text('Pelanggaran aturan dapat menyebabkan pembatasan akses demo.', textAlign: TextAlign.center, style: TextStyle(color: Colors.white70))])),
  ]);
}

class ToolsPage extends StatelessWidget {
  const ToolsPage({super.key});
  final tools = const [
    [Icons.cloud_outlined, 'Manage Server', 'Server Control'],
    [Icons.wifi, 'Network', 'WiFi Arsenal'],
    [Icons.search, 'OSINT', 'Public-source learning'],
    [Icons.download, 'Downloader', 'Media Saver'],
    [Icons.build, 'Utilities', 'Extra Tools'],
    [Icons.play_circle_outline, 'Ceramah', 'Islamic Talks'],
    [Icons.security, 'Device Safety', 'Local safety guide'],
    [Icons.lock_outline, 'Private Space', 'Privacy education'],
  ];
  @override
  Widget build(BuildContext context) => ListView(padding: const EdgeInsets.all(18), children: [
    Row(children: [const CircleAvatar(radius: 34, backgroundColor: panel, child: Icon(Icons.shield, color: Colors.white, size: 32)), const SizedBox(width: 14), const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Villain Tools', style: TextStyle(fontFamily: 'ShareTechMono', fontSize: 25, letterSpacing: 2)), Text('Gateway Tools', style: TextStyle(color: muted))])), const SmallPill(text: '● FULLUP')]),
    const SizedBox(height: 32),
    const Row(children: [SectionTitle('Tools Villain’s'), Spacer(), Text('8 item', style: TextStyle(color: muted))]),
    const SizedBox(height: 16),
    GridView.builder(shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), itemCount: tools.length, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: .88), itemBuilder: (context, i) {
      final t = tools[i];
      return InkWell(onTap: () => showDialog(context: context, builder: (_) => AlertDialog(title: Text(t[1] as String), content: Text('${t[2]}\\n\\nFitur demo lokal. Tidak menjalankan akses jarak jauh, eksploit, atau pengiriman pesan otomatis.'), actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))]), child: Container(decoration: BoxDecoration(color: panel, borderRadius: BorderRadius.circular(24), border: Border.all(color: Colors.white.withOpacity(.04))), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [CircleAvatar(radius: 30, backgroundColor: const Color(0xFF172D49), child: Icon(t[0] as IconData, color: cyan, size: 29)), const SizedBox(height: 18), Text(t[1] as String, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)), const SizedBox(height: 6), Text(t[2] as String, textAlign: TextAlign.center, style: const TextStyle(color: muted, fontSize: 11))])));
    }),
  ]);
}

class SmallPill extends StatelessWidget {
  final String text; const SmallPill({super.key, required this.text});
  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), decoration: BoxDecoration(color: Colors.white.withOpacity(.08), borderRadius: BorderRadius.circular(22), border: Border.all(color: Colors.white12)), child: Text(text, textAlign: TextAlign.center, style: const TextStyle(fontSize: 11, color: Color(0xFFD5E6FF))));
}
class SectionTitle extends StatelessWidget {
  final String text; const SectionTitle(this.text, {super.key});
  @override
  Widget build(BuildContext context) => Row(children: [Container(width: 4, height: 20, decoration: BoxDecoration(color: cyan, borderRadius: BorderRadius.circular(4))), const SizedBox(width: 10), Text(text, style: const TextStyle(fontFamily: 'Orbitron', fontSize: 16))]);
}
class StatCard extends StatelessWidget {
  final IconData icon; final String label, value;
  const StatCard({super.key, required this.icon, required this.label, required this.value});
  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: const Color(0xFF17143B), borderRadius: BorderRadius.circular(18), border: Border.all(color: blue.withOpacity(.25))), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Icon(icon, color: cyan), const SizedBox(height: 10), Text(label, style: const TextStyle(color: muted, fontSize: 9)), const SizedBox(height: 5), FittedBox(fit: BoxFit.scaleDown, child: Text(value, style: const TextStyle(fontSize: 12)))]));
}
class HomeTool extends StatelessWidget {
  final IconData icon; final String title;
  const HomeTool({super.key, required this.icon, required this.title});
  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: const Color(0xFF17143B), borderRadius: BorderRadius.circular(18), border: Border.all(color: Colors.white12)), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(icon, color: cyan, size: 25), const SizedBox(height: 8), Text(title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 11))]));
}
class ActionCard extends StatelessWidget {
  final IconData icon; final String title, subtitle;
  const ActionCard({super.key, required this.icon, required this.title, required this.subtitle});
  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: const Color(0xFF17143B), borderRadius: BorderRadius.circular(18), border: Border.all(color: blue.withOpacity(.2))), child: Row(children: [CircleAvatar(backgroundColor: blue.withOpacity(.2), child: Icon(icon, color: cyan)), const SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontFamily: 'Orbitron', fontSize: 12)), Text(subtitle, style: const TextStyle(color: muted, fontSize: 11))])), const Icon(Icons.chevron_right, color: blue)]));
}
