import 'package:flutter/material.dart';
import 'package:sound_app/core/constant.dart';
import 'package:sound_app/data/local_data.dart';
import 'package:sound_app/presentation/screens/sound_details.dart';

import 'custompage.dart';

class CustomListView extends StatelessWidget {

  CustomListView({super.key});

   bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listSound.length,
        itemBuilder: (context, i) {
          return Card(
            child: ListTile(
              leading: IconButton(
                icon: Icon(Icons.favorite,
                    color: isSelected ? Colors.orange : Colors.grey),
                onPressed: () {
                   isSelected = !isSelected;
                 
                },
              ),
              title: GestureDetector(
                 onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SoundDetails()));
              CustomPage.currentItem = i;
            },
                child: Text(
                  listSound[i].title,
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 13),
                ),
              ),
              titleAlignment: ListTileTitleAlignment.center,
              subtitle: Text(
                listSound[i].subtitle,
                textAlign: TextAlign.end,
              ),
              trailing: Image.asset(
                myconst.abdarhmanlist,
                fit: BoxFit.fill,
              ),
            ),
          );
        });
  }
}
