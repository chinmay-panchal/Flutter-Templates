import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:discuss_hub_project/core/common/error_text.dart';
import 'package:discuss_hub_project/core/common/loader.dart';
import 'package:discuss_hub_project/core/common/sign_in_button.dart';
import 'package:discuss_hub_project/features/auth/controlller/auth_controller.dart';
import 'package:discuss_hub_project/features/community/controller/community_controller.dart';
import 'package:discuss_hub_project/models/community_model.dart';
import 'package:routemaster/routemaster.dart';

class CommunityListDrawer extends ConsumerWidget {
  const CommunityListDrawer({super.key});

  void navigateToCreateCommunity(BuildContext context) {
    Routemaster.of(context).push('/create-community');
  }

  void navigateToCommunity(BuildContext context, Community community) {
    Routemaster.of(context).push('/r/${community.name}');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider)!;
    final isGuest = !user.isAuthenticated;

    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            isGuest
                ? const SignInButton()
                : ListTile(
                    title: const Text('Create a community'),
                    leading: const Icon(Icons.add),
                    onTap: () => navigateToCreateCommunity(context),
                  ),
            if (!isGuest)
              ref.watch(userCommunitiesProvider).when(
                    data: (communities) {
                      if (communities.isEmpty) {
                        // Don't show anything if user has no communities
                        return const SizedBox.shrink();
                      }
                      return Expanded(
                        child: ListView.builder(
                          itemCount: communities.length,
                          itemBuilder: (BuildContext context, int index) {
                            final community = communities[index];
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(community.avatar),
                              ),
                              title: Text('r/${community.name}'),
                              onTap: () {
                                navigateToCommunity(context, community);
                              },
                            );
                          },
                        ),
                      );
                    },
                    error: (error, stackTrace) =>
                        ErrorText(error: error.toString()),
                    loading: () => const Loader(),
                  ),
          ],
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:discuss_hub_project/core/common/error_text.dart';
// import 'package:discuss_hub_project/core/common/loader.dart';
// import 'package:discuss_hub_project/core/common/sign_in_button.dart';
// import 'package:discuss_hub_project/features/auth/controlller/auth_controller.dart';
// import 'package:discuss_hub_project/features/community/controller/community_controller.dart';
// import 'package:discuss_hub_project/models/community_model.dart';
// import 'package:routemaster/routemaster.dart';

// class CommunityListDrawer extends ConsumerWidget {
//   CommunityListDrawer({super.key});

//   void navigateToCreateCommunity(BuildContext context) {
//     Routemaster.of(context).push('/create-community');
//   }

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final allCommunities = ref.watch(allCommunitiesProvider);
//     final user = ref.watch(userProvider)!;
//     final isGuest = !user.isAuthenticated;
//     if (isGuest) {
//       print("it is guest account");
//     }

//     return Drawer(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           isGuest
//               ? const SignInButton()
//               : ListTile(
//                   title: const Text('Create a community'),
//                   leading: const Icon(Icons.add),
//                   onTap: () => navigateToCreateCommunity(context),
//                 ),
//           if (!isGuest)
//           allCommunities.when(
//             data: (communities) {
//               return Expanded(
//                 child: ListView.builder(
//                   itemCount: communities.length,
//                   itemBuilder: (context, index) {
//                     final community = communities[index];
//                     return ListTile(
//                       leading: CircleAvatar(
//                         backgroundImage: NetworkImage(community.avatar),
//                       ),
//                       title: Text('r/${community.name}'),
//                       onTap: () {
//                         Routemaster.of(context).push('/r/${community.name}');
//                       },
//                     );
//                   },
//                 ),
//               );
//             },
//             loading: () => const Center(child: CircularProgressIndicator()),
//             error: (error, _) => Center(child: Text('Error: $error')),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // class CommunityListDrawer extends ConsumerWidget {
// //   const CommunityListDrawer({super.key});

//   // void navigateToCreateCommunity(BuildContext context) {
//   //   Routemaster.of(context).push('/create-community');
//   // }

// //   void navigateToCommunity(BuildContext context, Community community) {
//     // Routemaster.of(context).push('/r/${community.name}');
// //   }

// //   @override
// //   Widget build(BuildContext context, WidgetRef ref) {
//     // final user = ref.watch(userProvider)!;
//     // final isGuest = !user.isAuthenticated;
//     // if (isGuest) {
//     //   print("it is guest account");
//     // }

// //     return Drawer(
// //       child: SafeArea(
// //         child: Column(
//           // children: [
//             // isGuest
//             //     ? const SignInButton()
//             //     : ListTile(
//             //         title: const Text('Create a community'),
//             //         leading: const Icon(Icons.add),
//             //         onTap: () => navigateToCreateCommunity(context),
//             //       ),
//             // if (!isGuest)
// //               ref.watch(userCommunitiesProvider).when(
// //                     data: (communities) => Expanded(
// //                       child: ListView.builder(
// //                         itemCount: communities.length,
// //                         itemBuilder: (BuildContext context, int index) {
// //                           final community = communities[index];
// //                           return ListTile(
// //                             leading: CircleAvatar(
// //                               backgroundImage: NetworkImage(community.avatar),
// //                             ),
// //                             title: Text('r/${community.name}'),
// //                             onTap: () {
// //                               navigateToCommunity(context, community);
// //                             },
// //                           );
// //                         },
// //                       ),
// //                     ),
// //                     error: (error, stackTrace) => ErrorText(
// //                       error: error.toString(),
// //                     ),
// //                     loading: () => const Loader(),
// //                   ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
