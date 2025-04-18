import 'package:any_link_preview/any_link_preview.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:discuss_hub_project/core/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:discuss_hub_project/core/common/error_text.dart';
import 'package:discuss_hub_project/core/common/loader.dart';
import 'package:discuss_hub_project/core/constants/constants.dart';
import 'package:discuss_hub_project/features/auth/controlller/auth_controller.dart';
import 'package:discuss_hub_project/features/community/controller/community_controller.dart';
import 'package:discuss_hub_project/features/post/controller/post_controller.dart';
import 'package:discuss_hub_project/models/post_model.dart';
import 'package:discuss_hub_project/responsive/responsive.dart';
import 'package:discuss_hub_project/theme/pallete.dart';
import 'package:routemaster/routemaster.dart';
import 'package:url_launcher/url_launcher.dart';

class PostCard extends ConsumerWidget {
  final bool isTrending;

  final Post post;
  const PostCard({
    super.key,
    required this.post,
    this.isTrending = false,
  });

  void deletePost(WidgetRef ref, BuildContext context) async {
    ref.read(postControllerProvider.notifier).deletePost(post, context);
  }

  void upvotePost(WidgetRef ref) async {
    ref.read(postControllerProvider.notifier).upvote(post);
  }

  void downvotePost(WidgetRef ref) async {
    ref.read(postControllerProvider.notifier).downvote(post);
  }

  void awardPost(WidgetRef ref, String award, BuildContext context) async {
    ref
        .read(postControllerProvider.notifier)
        .awardPost(post: post, award: award, context: context);
  }

  void navigateToUser(BuildContext context) {
    Routemaster.of(context).push('/u/${post.uid}');
  }

  void navigateToCommunity(BuildContext context) {
    Routemaster.of(context).push('/r/${post.communityName}');
  }

  void navigateToComments(BuildContext context) {
    Routemaster.of(context).push('/post/${post.id}/comments');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isTypeImage = post.type == 'image';
    final isTypeText = post.type == 'text';
    final isTypeLink = post.type == 'link';
    final user = ref.watch(userProvider)!;
    final isGuest = !user.isAuthenticated;

    final currentTheme = ref.watch(themeNotifierProvider);

    return Responsive(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: currentTheme.drawerTheme.backgroundColor,
            ),
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (kIsWeb)
                  Column(
                    children: [
                      IconButton(
                        onPressed: isGuest ? () {} : () => upvotePost(ref),
                        icon: Icon(
                          Constants.up,
                          size: 30,
                          color: post.upvotes.contains(user.uid)
                              ? Pallete.redColor
                              : null,
                        ),
                      ),
                      Text(
                        '${post.upvotes.length - post.downvotes.length == 0 ? 'Vote' : post.upvotes.length - post.downvotes.length}',
                        style: const TextStyle(fontSize: 17),
                      ),
                      IconButton(
                        onPressed: isGuest ? () {} : () => downvotePost(ref),
                        icon: Icon(
                          Constants.down,
                          size: 30,
                          color: post.downvotes.contains(user.uid)
                              ? Pallete.blueColor
                              : null,
                        ),
                      ),
                    ],
                  ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 16,
                        ).copyWith(right: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () => navigateToCommunity(context),
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                          post.communityProfilePic,
                                        ),
                                        radius: 16,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'r/${post.communityName}',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () =>
                                                navigateToUser(context),
                                            child: Text(
                                              'u/${post.username}',
                                              style:
                                                  const TextStyle(fontSize: 12),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    if (isTrending)
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 4.0, bottom: 4.0),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 4),
                                          decoration: BoxDecoration(
                                            color: Colors.orange.shade600,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: const Text(
                                            '🔥 Trending',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    if (post.uid == user.uid)
                                      IconButton(
                                        onPressed: () =>
                                            deletePost(ref, context),
                                        icon: Icon(
                                          Icons.delete,
                                          color: Pallete.redColor,
                                        ),
                                      ),
                                  ],
                                )
                              ],
                            ),
                            if (post.awards.isNotEmpty) ...[
                              const SizedBox(height: 5),
                              SizedBox(
                                height: 25,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: post.awards.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final award = post.awards[index];
                                    return Image.asset(
                                      Constants.awards[award]!,
                                      height: 23,
                                    );
                                  },
                                ),
                              ),
                            ],
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                post.title,
                                style: const TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            if (isTypeImage)
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.35,
                                width: double.infinity,
                                child: CachedNetworkImage(
                                  imageUrl: post.link!,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.broken_image,
                                          color: Colors.grey),
                                ),
                              ),
                            // if (isTypeLink)
                            //   Padding(
                            //     padding:
                            //         const EdgeInsets.symmetric(horizontal: 10),
                            //     child: AnyLinkPreview(
                            //       displayDirection:
                            //           UIDirection.uiDirectionHorizontal,
                            //       link: post.link!,
                            //     ),
                            //   ),
                            if (isTypeLink)
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 8),
                                child: GestureDetector(
                                  onTap: () async {
                                    final url = Uri.parse(post.link!);
                                    try {
                                      if (!await launchUrl(url,
                                          mode:
                                              LaunchMode.externalApplication)) {
                                        showSnackBar(
                                            context, 'Could not open the URL.');
                                      }
                                    } catch (e) {
                                      showSnackBar(
                                          context, 'Error opening URL: $e');
                                    }
                                  },
                                  child: Text(
                                    post.link!,
                                    style: const TextStyle(
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),

                            if (isTypeText)
                              Text(
                                post.description!,
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (!kIsWeb)
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: isGuest
                                            ? () {}
                                            : () => upvotePost(ref),
                                        icon: Icon(
                                          Constants.up,
                                          size: 30,
                                          color: post.upvotes.contains(user.uid)
                                              ? Pallete.redColor
                                              : null,
                                        ),
                                      ),
                                      Text(
                                        '${post.upvotes.length - post.downvotes.length == 0 ? 'Vote' : post.upvotes.length - post.downvotes.length}',
                                        style: const TextStyle(fontSize: 17),
                                      ),
                                      IconButton(
                                        onPressed: isGuest
                                            ? () {}
                                            : () => downvotePost(ref),
                                        icon: Icon(
                                          Constants.down,
                                          size: 30,
                                          color:
                                              post.downvotes.contains(user.uid)
                                                  ? Pallete.blueColor
                                                  : null,
                                        ),
                                      ),
                                    ],
                                  ),
                                Spacer(),
                                IconButton(
                                  onPressed: () => navigateToComments(context),
                                  icon: const Icon(
                                    Icons.comment,
                                  ),
                                ),
                                Text(
                                  '${post.commentCount == 0 ? 'Comment' : post.commentCount}',
                                  style: const TextStyle(fontSize: 17),
                                ),
                                ref
                                    .watch(getCommunityByNameProvider(
                                        post.communityName))
                                    .when(
                                      data: (data) {
                                        if (data.mods.contains(user.uid)) {
                                          return IconButton(
                                            onPressed: () =>
                                                deletePost(ref, context),
                                            icon: const Icon(
                                              Icons.admin_panel_settings,
                                            ),
                                          );
                                        }
                                        return const SizedBox();
                                      },
                                      error: (error, stackTrace) => ErrorText(
                                        error: error.toString(),
                                      ),
                                      loading: () => const Loader(),
                                    ),
                                // IconButton(
                                //   onPressed: isGuest
                                //       ? () {}
                                //       : () {
                                //           showDialog(
                                //             context: context,
                                //             builder: (context) => Dialog(
                                //               child: Padding(
                                //                 padding:
                                //                     const EdgeInsets.all(20),
                                //                 child: GridView.builder(
                                //                   shrinkWrap: true,
                                //                   gridDelegate:
                                //                       const SliverGridDelegateWithFixedCrossAxisCount(
                                //                     crossAxisCount: 4,
                                //                   ),
                                //                   itemCount: user.awards.length,
                                //                   itemBuilder:
                                //                       (BuildContext context,
                                //                           int index) {
                                //                     final award =
                                //                         user.awards[index];

                                //                     return GestureDetector(
                                //                       onTap: () => awardPost(
                                //                           ref, award, context),
                                //                       child: Padding(
                                //                         padding:
                                //                             const EdgeInsets
                                //                                 .all(8.0),
                                //                         child: Image.asset(
                                //                             Constants.awards[
                                //                                 award]!),
                                //                       ),
                                //                     );
                                //                   },
                                //                 ),
                                //               ),
                                //             ),
                                //           );
                                //         },
                                //   icon:
                                //       const Icon(Icons.card_giftcard_outlined),
                                // ),
                                SizedBox(
                                  width: 5,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
