import 'package:ecomm_bloc_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:ecomm_bloc_app/core/utils/show_snackbar.dart';
import 'package:ecomm_bloc_app/designs/animated_app_with_rive/common/widgets/sidebar_drawer/sidebar_drawer.dart';
import 'package:ecomm_bloc_app/designs/animated_app_with_rive/screens/entry_point/entry_point.dart';
import 'package:ecomm_bloc_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ecomm_bloc_app/features/product/presentaion/bloc/product_bloc.dart';
import 'package:ecomm_bloc_app/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => serviceLocator<AppUserCubit>()),
      BlocProvider(create: (_) => serviceLocator<AuthBloc>()),
      BlocProvider(
        create: (_) => serviceLocator<ProductBloc>(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Ecom App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Ecom App Home Page'),
      // home: const LoginPage(),
      // home: const OnboardingScreen(),
      home: const EntryPoint(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      context.read<ProductBloc>().add(ProductListFetch());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: BlocConsumer<ProductBloc, ProductState>(listener: (context, state) {
        if (state is ProductListError) {
          showSnackBar(context, state.error);
        }
      }, builder: (context, state) {
        if (state is ProductListLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ProductListSuccess) {
          return ListView.builder(
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              final product = state.products[index];
              return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(product.images![0]),
                  ),
                  title: Text(product.title));
            },
          );
        }
        return const SizedBox();
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
