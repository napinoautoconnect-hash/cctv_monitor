// import 'package:flutter/material.dart';

// import '../widgets/camera_card.dart';
// import '../models/camera_list.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("CCTV Monitor"), centerTitle: true),
//       body: ListView.builder(
//         itemCount: cameras.length,
//         itemBuilder: (context, index) {
//           return CameraCard(camera: cameras[index]);
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'sec3_screen.dart';
import 'haridwar_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CCTV Monitor',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SEC 3
              SizedBox(
                width: 280,
                height: 65,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Sec3Screen(),
                      ),
                    );
                  },
                  child: const Text(
                    'SEC 3',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // HARIDWAR
              SizedBox(
                width: 280,
                height: 65,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HaridwarScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'HARIDWAR',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
