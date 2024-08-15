import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_6/features/product/presentation/bloc/product_bloc.dart';

import 'ProductCard.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // Initial range values for the RangeSlider
  RangeValues _values = const RangeValues(1, 100);

  @override
  Widget build(BuildContext context) {
    RangeLabels labels = RangeLabels(
      _values.start.round().toString(),
      _values.end.round().toString(),
    );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromRGBO(63, 81, 243, 1),
          ),
        ),
        title: const Text(
          "Search Product",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'Poppins',
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: TextFormField(
                    textAlign: TextAlign.justify,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16.0),
                      labelText: "Label", // Placeholder text
                      suffixIcon: const Icon(
                        Icons.arrow_forward_outlined,
                        color: Color.fromRGBO(63, 81, 243, 1),
                      ), // Search icon at the start
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (value) {
                      // Logic to handle changes in the search input can be added here
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.1,
                  height: 40, // Adjust height as needed
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(63, 81, 243, 1),
                    border: Border.all(
                      color: const Color.fromRGBO(63, 81, 243, 1),
                      width: 1.0, // Border width
                    ),
                    borderRadius: BorderRadius.circular(8.0), // Border radius
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.filter_list,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            BlocConsumer<ProductBloc, ProductState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                if (state is LoadedAllProductState) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        return ProductCard(product: state.products[index]);
                      },
                    ),
                  );
                } else if (state is LoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is ErrorState) {
                  return Center(
                    child: Text(state.message),
                  );
                }
                return const SizedBox();
              },
            ),
            Container(
              padding: const EdgeInsets.all(13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Category',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins",
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      textAlign: TextAlign.justify,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (value) {
                        // Logic to handle changes in the search input can be added here
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Price',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins",
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 11,
                      activeTrackColor: const Color.fromRGBO(63, 81, 243, 1),
                      inactiveTrackColor:
                          const Color.fromARGB(255, 220, 220, 220),
                      thumbColor: Colors.white,
                    ),
                    child: RangeSlider(
                      values: _values,
                      min: 1,
                      max: 100,
                      divisions: 99,
                      labels: labels,
                      onChanged: (RangeValues newValues) {
                        setState(() {
                          _values = newValues;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(63, 81, 243, 1),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  side: const BorderSide(
                      color: Color.fromRGBO(63, 81, 243, 1), width: 1.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "APPLY",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
