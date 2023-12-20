import 'package:flutter/material.dart';

class DetailTile extends StatelessWidget {
  const DetailTile({super.key, required this.user});
  final Map<String, dynamic> user;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 0.75),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListTile(
            leading: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.abc),
                SizedBox(
                  height: 2,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.star),
                    SizedBox(
                      width: 3,
                    ),
                    Text('4.8')
                  ],
                ),
              ],
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(user['Name']),
                Text('${user['Speciality']}, ${user['Address']}'),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10)),
                    height: 30,
                    width: 110,
                    child: const Center(child: Text('Appointement')),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
