import 'package:flutter/material.dart';

void main() => runApp(const WhatsAppApp());

class WhatsAppApp extends StatelessWidget {
  const WhatsAppApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 0, 220, 113),
      ),
      home: const WhatsAppHome(),
    );
  }
}

class WhatsAppHome extends StatefulWidget {
  const WhatsAppHome({Key? key}) : super(key: key);

  @override
  State<WhatsAppHome> createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 220, 113),
        title: const Text('WhatsApp'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.greenAccent[400],
          indicatorWeight: 4.0,
          tabs: const [
            Tab(icon: Icon(Icons.camera_alt)),
            Tab(text: 'CHAT'),
            Tab(text: 'STATUS'),
            Tab(text: 'CALLS'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          KameraScreen(),
          ChatScreen(),
          StatusScreen(),
          PanggilanScreen(),
        ],
      ),
    );
  }
}

class KameraScreen extends StatelessWidget {
  const KameraScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Kamera'));
  }
}

const List<String> names = [
  'Alicia',
  'Bella',
  'Clara',
  'Diana',
  'Ella',
  'Fiona',
  'Grace',
  'Hannah',
  'Isla',
  'Julia'
];

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: names.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://i.pinimg.com/736x/0c/81/f2/0c81f23d85bee640e084b27676c60e52.jpg'),
          ),
          title: Text(names[index]),
          subtitle: const Text('Pesan terakhir'),
          trailing: const Text('18.05'),
        );
      },
    );
  }
}

class StatusScreen extends StatelessWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: names.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://i.pinimg.com/736x/0c/81/f2/0c81f23d85bee640e084b27676c60e52.jpg'),
          ),
          title: Text(names[index]),
          subtitle: const Text('Baru saja diperbarui'),
        );
      },
    );
  }
}

class PanggilanScreen extends StatelessWidget {
  const PanggilanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: names.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://i.pinimg.com/736x/0c/81/f2/0c81f23d85bee640e084b27676c60e52.jpg'),
          ),
          title: Text(names[index]),
          subtitle: const Text('Hari ini, 12:00'),
          trailing: const Icon(Icons.call, color: Colors.green),
        );
      },
    );
  }
}
