import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:discuss_hub_project/models/community_model.dart';
import 'package:discuss_hub_project/features/community/controller/community_controller.dart';
import 'package:discuss_hub_project/theme/pallete.dart';
import 'package:discuss_hub_project/router.dart';
import 'package:routemaster/routemaster.dart';

class ExploreScreen extends ConsumerWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exploreCommunities = ref.watch(exploreCommunitiesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Explore Communities')),
      body: exploreCommunities.when(
        data: (communities) {
          if (communities.isEmpty) {
            return const Center(child: Text('No new communities to explore!'));
          }
          return ListView.builder(
            itemCount: communities.length,
            itemBuilder: (context, index) {
              final community = communities[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(community.avatar),
                ),
                title: Text('r/${community.name}'),
                onTap: () {
                  Routemaster.of(context).push('/r/${community.name}');
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Error: $error')),
      ),
    );
  }
}