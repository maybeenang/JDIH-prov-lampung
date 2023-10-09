import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:jdih/models/produkhukum.dart';
import 'package:jdih/pages/artikelhukum_page.dart';
import 'package:jdih/pages/berita_page.dart';
import 'package:jdih/pages/detailberita_page.dart';
import 'package:jdih/pages/detailprodukhukum_page.dart';
import 'package:jdih/pages/galeri_page.dart';
import 'package:jdih/pages/home_page.dart';
import 'package:jdih/pages/monografihukum_page.dart';
import 'package:jdih/pages/produkhukum_page.dart';
import 'package:jdih/pages/putusan_page.dart';
import 'package:jdih/pages/webview_monografi.dart';
import 'package:jdih/services/logger.dart';
import 'package:jdih/styles/colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(const ProviderScope(
    observers: [
      StateLogger(),
    ],
    child: App(),
  ));
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
                data: state.extra! as ProdukHukum,
              );
            },
          ),
        ],
      ),
      GoRoute(
        path: 'monografihukum',
        builder: (context, state) => const MonografiHukumPage(),
        routes: [
          GoRoute(
            path: 'detail',
            builder: (context, state) {
              return WebViewMonografi(
                url: state.extra! as String,
              );
            },
          ),
        ],
      ),
      GoRoute(
        path: 'putusan',
        builder: (context, state) => const PutusanPage(),
      ),
      GoRoute(
        path: 'berita',
        builder: (context, state) => const BeritaPage(),
        routes: [
          GoRoute(
            path: 'detail/:id',
            builder: (context, GoRouterState state) {
              final params = state.pathParameters;
              return DetailBeritaPage(
                params: params.values.first,
              );
            },
          ),
        ],
      ),
      GoRoute(
        path: 'artikelhukum',
        builder: (context, state) => const ArtikelHukumPage(),
      ),
      GoRoute(
        path: 'galeri',
        builder: (context, state) => const GaleriPage(),
      ),
    ],
  )
]);

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'JDIH Provinsi Lampung',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: AppColors.bgColor,
          appBarTheme: const AppBarTheme(backgroundColor: AppColors.barColor)),
      routerConfig: _router,
    );
  }
}
