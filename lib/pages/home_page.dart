import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, 'carDetails'),
        child: const Icon(Icons.add),
      ),
      body: Container (
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView (
          clipBehavior: Clip.none,
          children: const [
              _ItemContainer(),
              _ItemContainer(),
              _ItemContainer(),
              _ItemContainer(),
              _ItemContainer(),
              _ItemContainer(),
              _ItemContainer(),
              _ItemContainer(),
              _ItemContainer(),
              _ItemContainer(),
              _ItemContainer(),
              _ItemContainer(),
              _ItemContainer(),
              _ItemContainer(),
              _ItemContainer(),
              _ItemContainer(),
              _ItemContainer(),
              _ItemContainer(),
              _ItemContainer(),
          ],
        ),
      ),
    );
  }
}

class _ItemContainer extends StatelessWidget {
  const _ItemContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {}, // Navigator.pushNamed(context, 'carDetails'),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(-5,5)
            )
          ]
        ),
        margin: const EdgeInsets.symmetric(vertical: 12),
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 50,
              width: 50,
              margin: const EdgeInsets.only(right: 20),
              decoration: const BoxDecoration (
                shape: BoxShape.circle,
                color: Colors.red,
              ),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Vehiculo: ABC123', style: TextStyle(
                    fontSize: 22
                  )),
                  Text('Guido leonel Cotelesso',
                    style: TextStyle(fontSize: 20),
                    overflow: TextOverflow.ellipsis
                  )
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}