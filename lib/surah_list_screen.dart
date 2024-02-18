import 'package:flutter/material.dart';

class SurahListScreen extends StatefulWidget {
  @override
  _SurahListScreenState createState() => _SurahListScreenState();
}

class _SurahListScreenState extends State<SurahListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Surah List'),
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // Assuming the API returns a list of Surahs
            final List surahs = snapshot.data['data'];

            return ListView.builder(
              itemCount: surahs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(surahs[index]['englishName']),
                  onTap: () {
                    // Handle navigation or other actions on tap
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
