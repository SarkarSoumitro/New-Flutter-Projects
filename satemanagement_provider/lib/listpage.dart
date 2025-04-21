import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:satemanagement_provider/listmapprovider.dart';

class Listpage extends StatelessWidget {
  const Listpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listpage'),
      ),
      body: Consumer<ListMapProvider>(
        builder: (ctx, provider, __) {
          var alldata = provider.getdata();
          return alldata.isNotEmpty
              ? ListView.builder(
                  itemCount: alldata.length,
                  itemBuilder: (_, index) {
                    return ListTile(
                      title: Text('${alldata[index]['name']}'),
                      subtitle: Text('${alldata[index]['mobnum']}'),
                    );
                  })
              : const Center(
                  child: Text("No data"),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ListMapProvider>().addData({
            "name": "Samsung", // Correct key here
            "mobnum": "27453241574", // Correct key here
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
