import 'package:flutter/material.dart';

class Detailspage extends StatefulWidget {
  const Detailspage({super.key});

  @override
  State<Detailspage> createState() => _DetailspageState();
}

class _DetailspageState extends State<Detailspage> {
  int _selectedSize = 32; // Default selected size

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 230,
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'images/shoes.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Color.fromRGBO(63, 81, 243, 1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: const Text(
                    "Men's shoe",
                    style: TextStyle(
                      color: Color.fromRGBO(170, 170, 170, 1),
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.star, color: Colors.yellow, size: 20),
                    Text(
                      '(4.0)',
                      style: TextStyle(
                        color: Color.fromRGBO(170, 170, 170, 1),
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: const Text(
                    "Derby Leather",
                    style: TextStyle(
                      color: Color.fromRGBO(62, 62, 62, 1),
                      fontFamily: 'Poppins',
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "\$120",
                      style: TextStyle(
                        color: Color.fromRGBO(62, 62, 62, 1),
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20),
              child: const Text(
                "Size:",
                style: TextStyle(
                  color: Color.fromRGBO(62, 62, 62, 1),
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              height: 60,
              padding: const EdgeInsets.only(left: 20),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 45 - 32 + 1, // Number of sizes from 32 to 45
                itemBuilder: (context, index) {
                  int size = 32 + index; // Calculate the shoe size
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedSize = size;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: _selectedSize == size
                            ? const Color.fromRGBO(63, 81, 243, 1)
                            : Colors.white,
                        border: Border.all(
                          color: _selectedSize == size
                              ? const Color.fromRGBO(63, 81, 243, 1)
                              : Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: Text(
                          '$size',
                          style: TextStyle(
                            fontSize: 16,
                            color: _selectedSize == size
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              padding:
                  const EdgeInsets.only(left: 20, top: 0, right: 16, bottom: 0),
              child: const Text(
                  "In order to help those of you who would like to reference our articles in an academic setting, appropriate citation formats using MLA and APA can be found below. Guidelines are based on standard usage of these reference systems as of 2020, and should be checked against your institution’s particular guidelines as appropriate. We do not publish the names of our writers or provide the date published, but all systems have instructions regarding citing a website without author"),
            ),
            Container(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 150,
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
                  SizedBox(
                    width: 150,
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
                        "UPDATE",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
