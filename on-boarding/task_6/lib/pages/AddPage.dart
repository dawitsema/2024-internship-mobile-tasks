import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Addpage extends StatelessWidget {
  const Addpage({super.key});

  @override
  Widget build(BuildContext context) {
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
          "Add Product",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'Poppins',
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(243, 243, 243, 1),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                margin: const EdgeInsets.all(10.0),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "upload image",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 86,
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Label
                    const Text(
                      'name',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    // Form Field
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 40,
                      // padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(243, 243, 243, 1),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: TextFormField(
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 86,
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Label
                    const Text(
                      'catagory',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    // Form Field
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 40,
                      // padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(243, 243, 243, 1),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: TextFormField(
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 86,
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Label
                    const Text(
                      'price',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    // Form Field
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 40,
                      // padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(243, 243, 243, 1),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: Icon(Icons.attach_money)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 200,
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Label
                    const Text(
                      'description',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    // Form Field
                    const SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      child: Container(
                        // padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(243, 243, 243, 1),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: TextFormField(
                          decoration:
                              const InputDecoration(border: InputBorder.none),
                          expands: true,
                          maxLines: null,
                          textAlignVertical: TextAlignVertical.top,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(63, 81, 243, 1),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    side: const BorderSide(
                        color: Color.fromRGBO(63, 81, 243, 1), width: 1.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "ADD",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    side: const BorderSide(color: Colors.red, width: 1.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "DELETE",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
