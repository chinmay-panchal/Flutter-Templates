import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskapi/provider/homeProvider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => HomeProvider()),
        ],
        builder: (context, widget) {
          context.read<HomeProvider>().fetchdio(number: 1);
          print("build");
          return Scaffold(
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      // Provider.of<HomeProvider>(context, listen: false)
                      //     .fetchData(number: HomeProvider().pageNumber--);
                      context.read<HomeProvider>().fetchdio(
                          number: context.read<HomeProvider>().pageNumber--);
                    },
                    child: Container(
                        height: 50,
                        padding: EdgeInsets.all(10),
                        width: 130,
                        color: Colors.amber,
                        child: Center(child: Text("Prv"))),
                  ),
                  InkWell(
                    onTap: () {
                      // Provider.of<HomeProvider>(context, listen: false)
                      //     .fetchData(
                      //         number: Provider.of<HomeProvider>(context,
                      //                 listen: false)
                      //             .pageNumber++);
                      context.read<HomeProvider>().fetchdio(
                          number: context.read<HomeProvider>().pageNumber + 1);
                    },
                    child: Container(
                        height: 50,
                        padding: EdgeInsets.all(10),
                        width: 130,
                        child: Center(child: Text("Nxt")),
                        color: Colors.amber),
                  )
                ],
              ),
              body: Column(
                children: [
                  Consumer<HomeProvider>(builder: (context, provider, _) {
                    return Expanded(
                      child: ListView.builder(
                          itemCount: provider.userDataModel?.data?.length,
                          itemBuilder: (ctx, index) {
                            return ListTile(
                              leading: CircleAvatar(
                                  backgroundImage: NetworkImage(provider
                                          .userDataModel?.data?[index].avatar ??
                                      '')),
                              title: Text(
                                  '${provider.userDataModel?.data?[index].firstName} ${provider.userDataModel?.data?[index].lastName}'),
                              subtitle: Text(
                                  '${provider.userDataModel?.data?[index].email}' ??
                                      ''),
                            );
                          }),
                    );
                  }),
                ],
              ));
        });
  }
}




// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return FutureProvider<List<Data>>(
//       create: (context) => HomeProvider().fetchData(), 
//       initialData: [],
//       catchError: (context, error) {
//         print("Error: $error");
//         return [];
//       },
//       child: Scaffold(
//         appBar: AppBar(title: Text("User List")),
//         body: Consumer<List<Data>>(
//           builder: (context, users, child) {
            // if (users.isEmpty) {
            //   return Center(child: CircularProgressIndicator());
            // }

//             return ListView.builder(
//               itemCount: users.length,
//               itemBuilder: (context, index) {
//                 final user = users[index];
//                 return ListTile(
//                   leading: CircleAvatar(
//                       backgroundImage: NetworkImage(user.avatar ?? '')),
//                   title: Text("${user.firstName} ${user.lastName}"),
//                   subtitle: Text(user.email ?? ''),
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }