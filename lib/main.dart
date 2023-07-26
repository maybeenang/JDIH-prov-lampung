import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:jdih/pages/artikelhukum_page.dart';
import 'package:jdih/pages/berita_page.dart';
import 'package:jdih/pages/detailprodukhukum_page.dart';
import 'package:jdih/pages/galeri_page.dart';
import 'package:jdih/pages/home_page.dart';
import 'package:jdih/pages/monografihukum_page.dart';
import 'package:jdih/pages/produkhukum_page.dart';
import 'package:jdih/pages/putusan_page.dart';
import 'package:jdih/styles/colors.dart';

// void main() => runApp(const App());
Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JDIH Provinsi Lampung',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: AppColors.bgColor,
          appBarTheme: const AppBarTheme(backgroundColor: AppColors.barColor)),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/produkhukum': (context) => const ProdukHukumPage(),
        '/monografihukum': (context) => const MonografiHukumPage(),
        '/putusan': (context) => const PutusanPage(),
        '/artikelhukum': (context) => const ArtikelHukumPage(),
        '/berita': (context) => const BeritaPage(),
        '/galeri': (context) => const GaleriPage(),
        '/detail': (context) => const DetailProdukHukumPage(),
      },
    );
  }
}
