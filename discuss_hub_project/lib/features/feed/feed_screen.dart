import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:discuss_hub_project/core/common/error_text.dart';
import 'package:discuss_hub_project/core/common/loader.dart';
import 'package:discuss_hub_project/core/common/post_card.dart';
import 'package:discuss_hub_project/features/auth/controlller/auth_controller.dart';
import 'package:discuss_hub_project/features/community/controller/community_controller.dart';
import 'package:discuss_hub_project/features/post/controller/post_controller.dart';

class FeedScreen extends ConsumerWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(allPostsProvider).when(
          data: (posts) {
            final now = DateTime.now();
            final trendingPosts = posts
                .where((p) => now.difference(p.createdAt).inHours <= 24)
                .toList()
              ..sort((a, b) => (b.upvotes.length - b.downvotes.length)
                  .compareTo(a.upvotes.length - a.downvotes.length));

            final trendingIds = trendingPosts.map((p) => p.id).toSet();

            // final otherPosts = posts
            //     .where((p) => !trendingIds.contains(p.id))
            //     .toList()
            //   ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

            final otherPosts =
                posts.where((p) => !trendingIds.contains(p.id)).toList()
                  ..sort((a, b) {
                    // If both posts have 0 likes, sort by creation date (newest first)
                    if (a.upvotes.isEmpty && b.upvotes.isEmpty) {
                      return b.createdAt.compareTo(a.createdAt);
                    }
                    // Otherwise, sort by upvotes (most liked)
                    return b.upvotes.length.compareTo(a.upvotes.length);
                  });

            return ListView(
              children: [
                if (trendingPosts.isNotEmpty) ...[
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '🔥 Fresh & Trending',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ...trendingPosts
                      .map((post) => PostCard(post: post, isTrending: true)),
                  const Divider(),
                ],
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '💬 Past Discussions',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                ...otherPosts.map((post) => PostCard(post: post)),
              ],
            );
          },
          error: (error, stackTrace) => ErrorText(error: error.toString()),
          loading: () => const Loader(),
        );
  }

  // @override
  // Widget build(BuildContext context, WidgetRef ref) {
  //   return ref.watch(allPostsProvider).when(
  //         data: (posts) {
  //           return ListView.builder(
  //             itemCount: posts.length,
  //             itemBuilder: (context, index) {
  //               final post = posts[index];
  //               return PostCard(post: post);
  //             },
  //           );
  //         },
  //         error: (error, stackTrace) => ErrorText(error: error.toString()),
  //         loading: () => const Loader(),
  //       );
  // }

  // @override
  // Widget build(BuildContext context, WidgetRef ref) {
  //   final user = ref.watch(userProvider)!;
  //   final isGuest = !user.isAuthenticated;

  //   if (!isGuest) {
  //     return ref.watch(userCommunitiesProvider).when(
  //           data: (communities) => ref.watch(userPostsProvider(communities)).when(
  //                 data: (data) {
  //                   return ListView.builder(
  //                     itemCount: data.length,
  //                     itemBuilder: (BuildContext context, int index) {
  //                       final post = data[index];
  //                       return PostCard(post: post);
  //                     },
  //                   );
  //                 },
  //                 error: (error, stackTrace) {
  //                   return ErrorText(
  //                     error: error.toString(),
  //                   );
  //                 },
  //                 loading: () => const Loader(),
  //               ),
  //           error: (error, stackTrace) => ErrorText(
  //             error: error.toString(),
  //           ),
  //           loading: () => const Loader(),
  //         );
  //   }
  //   return ref.watch(userCommunitiesProvider).when(
  //         data: (communities) => ref.watch(guestPostsProvider).when(
  //               data: (data) {
  //                 return ListView.builder(
  //                   itemCount: data.length,
  //                   itemBuilder: (BuildContext context, int index) {
  //                     final post = data[index];
  //                     return PostCard(post: post);
  //                   },
  //                 );
  //               },
  //               error: (error, stackTrace) {
  //                 return ErrorText(
  //                   error: error.toString(),
  //                 );
  //               },
  //               loading: () => const Loader(),
  //             ),
  //         error: (error, stackTrace) => ErrorText(
  //           error: error.toString(),
  //         ),
  //         loading: () => const Loader(),
  //       );
  // }
}
