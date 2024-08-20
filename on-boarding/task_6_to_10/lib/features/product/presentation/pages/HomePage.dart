import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_6/features/product/presentation/pages/SearchPage.dart';
import 'package:task_6/service_locator.dart';

import '../bloc/product_bloc.dart';
import 'AddPage.dart';
import 'ProductCard.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});
  var f = 2;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          serviceLocator<ProductBloc>()..add(LoadAllProductEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(63, 81, 243, 1),
          ),
          useMaterial3: true,
        ),
        // ignore: prefer_const_constructors
        home: _Homepage(),
      ),
    );
  }
}

class _Homepage extends StatelessWidget {
  _Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          serviceLocator<ProductBloc>()..add(LoadAllProductEvent()),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: AppBar(
              title: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'June 12, 2023',
                    style: TextStyle(
                      color: Color(0xFFAAAAAA),
                      fontSize: 14,
                      height: 1.3, // Line height
                      letterSpacing: 0.0,
                    ),
                  ),
                  Text(
                    'Hello, Dawit',
                    style: TextStyle(
                      fontFamily: 'Sora',
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      height: 1.26, // Line height
                    ),
                  ),
                ],
              ),
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(204, 204, 204, 1),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                ),
              ),
              actions: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    // color: Colors.white, // Background color
                    borderRadius: BorderRadius.circular(6), // Rounded corners
                    border: Border.all(
                      color: const Color.fromARGB(
                          255, 192, 192, 192), // Border color
                      width: 1.0, // Border width
                    ),
                  ),
                  child: Stack(
                    children: [
                      const Center(
                        child: Icon(
                          Icons.notifications,
                          // color: Colors.white,
                          size: 30,
                        ),
                      ),
                      Positioned(
                        top: 7,
                        right: 7,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(63, 81, 243, 1), // Dot color
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Available Products',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Container(
                    width: 40, // Adjust width as needed
                    height: 40, // Adjust height as needed
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromRGBO(204, 204, 204, 1),
                        width: 1.0, // Border width
                      ),
                      borderRadius: BorderRadius.circular(8.0), // Border radius
                    ),
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return SearchPage();
                              },
                            ),
                          );
                        },
                        icon: const Icon(Icons.search)),
                  )
                ],
              ),
            ),
            BlocConsumer<ProductBloc, ProductState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                if (state is LoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is LoadedAllProductState) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        return ProductCard(product: state.products[index]);
                      },
                    ),
                  );
                } else if (state is ErrorState) {
                  return Center(
                    child: Text(state.message),
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return const Addpage();
                },
              ),
            );
          },
          backgroundColor:
              const Color.fromRGBO(63, 81, 243, 1), // Background color
          foregroundColor: Colors.white, // Icon color
          shape: const CircleBorder(),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
