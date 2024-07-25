import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/core/init/dependency_injection.dart';
import 'package:test/core/local_storage/local_source.dart';
import 'package:test/core/routing/routing_manager.dart';
import 'package:test/features/auth/presentation_layer/screens/login.dart';

void main()async {
  runApp(const MyApp());
    WidgetsFlutterBinding.ensureInitialized();

    DependencyInjection.injectDependencies();
LocalStorage localStorage = LocalStorage();

  await localStorage.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RouteName.splash,
      getPages: RoutingManager.pages,
      debugShowCheckedModeBanner: false,
    );
  }
}
