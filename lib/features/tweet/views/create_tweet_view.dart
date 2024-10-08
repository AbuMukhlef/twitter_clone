import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/common/common.dart';
import 'package:twitter_clone/constants/ui_constants.dart';

import '../../../theme/theme.dart';
import '../../auth/controller/auth_controller.dart';

class CreateTweetViewScreen extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const CreateTweetViewScreen(),
      );
  const CreateTweetViewScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateTweetViewScreenState();
}

class _CreateTweetViewScreenState extends ConsumerState<CreateTweetViewScreen> {
  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(currentUserDetailsProvider).value;
    print('current user is $currentUser');
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.close, size: 30)),
        actions: [
          RoundedSmallButton(
            onTap: () {},
            label: 'Tweet',
            backgroundColor: Pallete.blueColor,
            textColor: Pallete.whiteColor,
          )
        ],
      ),
      body: currentUser == null
          ? const Loader()
          : const SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                            // backgroundImage: NetworkImage(currentUser.profilePic),
                            ),
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
