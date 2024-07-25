import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tst_ecommerce/provider/favorite_provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() {
    return _FavoriteScreenState();
  }
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {

    final provider = FavoriteProvider.of(context);
    final finalList = provider.favorite;

    return Scaffold(
        body: Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 20, left: 20),
          child: Row(
            children: [
              Text(
                'Favorites',
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Expanded(
            child: ListView.builder(
          itemCount: finalList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Slidable(
                endActionPane: ActionPane(motion: const ScrollMotion(),
                    children: [
                  SlidableAction(
                    onPressed: (context) {
                      finalList.removeAt(index);
                      setState(() {});
                    },
                  backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                    icon: Icons.delete_rounded,
                    label: 'Delete',
                  ),
                ]),
                child: ListTile(
                  title: Text(
                    finalList[index].name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    finalList[index].discription,
                    overflow: TextOverflow.ellipsis,
                  ),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(finalList[index].image),
                    backgroundColor: Colors.cyanAccent.shade100,
                  ),
                  trailing: Text(
                    '\RS ${finalList[index].price}',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  tileColor: Colors.white,
                ),
              ),
              );
          },
        ))
      ],
    ));
  }
}
