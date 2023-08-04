import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:jdih/bloc/produkhukum_bloc/produkhukum_bloc.dart';
import 'package:jdih/pages/artikelhukum_page.dart';
import 'package:jdih/pages/berita_page.dart';
import 'package:jdih/pages/detailprodukhukum_page.dart';
import 'package:jdih/pages/galeri_page.dart';
import 'package:jdih/pages/home_page.dart';
import 'package:jdih/pages/monografihukum_page.dart';
import 'package:jdih/pages/produkhukum_page.dart';
import 'package:jdih/pages/putusan_page.dart';
import 'package:jdih/styles/colors.dart';
import 'package:http/http.dart' as http;

// void main() => runApp(const App());
Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(const App());
}

final GoRouter _router = GoRouter(routes: <RouteBase>[
  GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const HomePage(),
      routes: [
        GoRoute(
            path: 'produkhukum',
            builder: (context, state) => const ProdukHukumPage(),
            routes: [
              GoRoute(
                path: 'detail',
                builder: (context, state) {
                  return DetailProdukHukumPage(
                      data: state.extra! as List<dynamic>);
                },
              ),
            ]),
        GoRoute(
            path: 'monografihukum',
            builder: (context, state) => const MonografiHukumPage()),
        GoRoute(
            path: 'putusan', builder: (context, state) => const PutusanPage()),
        GoRoute(
            path: 'berita', builder: (context, state) => const BeritaPage()),
        GoRoute(
            path: 'artikelhukum',
            builder: (context, state) => const ArtikelHukumPage()),
        GoRoute(
            path: 'galeri', builder: (context, state) => const GaleriPage()),
        // GoRoute(
        //     path: 'filterprodukhukum',
        //     builder: (context, state) => const FilterProdukHukumPage())
      ])
]);

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProdukhukumBloc(httpClient: http.Client())..add(ProdukhukumFetched()),
      child: MaterialApp.router(
        title: 'JDIH Provinsi Lampung',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: AppColors.bgColor,
            appBarTheme:
                const AppBarTheme(backgroundColor: AppColors.barColor)),
        routerConfig: _router,
      ),
    );
  }
}
