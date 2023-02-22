import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/users/widgets/persistent_tab_bar.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              title: const Text("현승"),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const FaIcon(
                      FontAwesomeIcons.gear,
                      size: Sizes.size20,
                    ))
              ],
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: Sizes.size32,
                    foregroundColor: Colors.teal,
                    foregroundImage: NetworkImage(
                      "https://avatars.githubusercontent.com/u/92836658?v=4",
                    ),
                    child: Text("현승"),
                  ),
                  Gaps.v20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "현승",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: Sizes.size18,
                        ),
                      ),
                      Gaps.h5,
                      FaIcon(
                        FontAwesomeIcons.solidCircleCheck,
                        size: Sizes.size16,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                  Gaps.v24,
                  SizedBox(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            const Text(
                              "97",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Sizes.size18,
                              ),
                            ),
                            Gaps.v5,
                            Text(
                              "Following",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Sizes.size12,
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ],
                        ),
                        VerticalDivider(
                          width: Sizes.size32,
                          thickness: Sizes.size1,
                          indent: Sizes.size10,
                          endIndent: Sizes.size10,
                          color: Colors.grey.shade400,
                        ),
                        Column(
                          children: [
                            const Text(
                              "97",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Sizes.size18,
                              ),
                            ),
                            Gaps.v5,
                            Text(
                              "Followers",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Sizes.size12,
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ],
                        ),
                        VerticalDivider(
                          width: Sizes.size32,
                          thickness: Sizes.size1,
                          indent: Sizes.size10,
                          endIndent: Sizes.size10,
                          color: Colors.grey.shade400,
                        ),
                        Column(
                          children: [
                            const Text(
                              "97",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Sizes.size18,
                              ),
                            ),
                            Gaps.v5,
                            Text(
                              "Likes",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Sizes.size12,
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Gaps.v14,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: FractionallySizedBox(
                          widthFactor: 0.45,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: Sizes.size12,
                            ),
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(
                                  Sizes.size2,
                                )),
                            child: const Text(
                              "Follow",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Gaps.h4,
                      SizedBox(
                        height: Sizes.size40,
                        width: Sizes.size40,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.shade300,
                              width: Sizes.size1,
                            ),
                          ),
                          child: const Center(
                              child: FaIcon(
                            FontAwesomeIcons.youtube,
                            size: Sizes.size16,
                          )),
                        ),
                      ),
                      Gaps.h4,
                      SizedBox(
                        height: Sizes.size40,
                        width: Sizes.size40,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.shade300,
                              width: Sizes.size1,
                            ),
                          ),
                          child: const Center(
                              child: FaIcon(
                            FontAwesomeIcons.caretDown,
                            size: Sizes.size16,
                          )),
                        ),
                      ),
                    ],
                  ),
                  Gaps.v12,
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: Sizes.size32),
                    child: Text(
                      "All highlights and where to watch live matches on FIFA+",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Gaps.v14,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      FaIcon(
                        FontAwesomeIcons.link,
                        size: Sizes.size12,
                      ),
                      Gaps.h8,
                      Text(
                        "link",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Gaps.v20,
                ],
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: PersistentTabBar(),
            ),
          ];
        },
        body: TabBarView(
          children: [
            GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: Sizes.size1,
                mainAxisSpacing: Sizes.size1,
                childAspectRatio: 9 / 16,
              ),
              itemBuilder: (context, index) => Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 9 / 16,
                    child: FadeInImage.assetNetwork(
                      fit: BoxFit.cover,
                      placeholderFit: BoxFit.cover,
                      placeholder: "assets/images/placeholder.jpg",
                      image:
                          "https://images.unsplash.com/photo-1619650277752-9b853abf815b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3840&q=80",
                    ),
                  ),
                  Positioned(
                    bottom: Sizes.size4,
                    left: Sizes.size8,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        FaIcon(
                          FontAwesomeIcons.play,
                          color: Colors.white,
                          size: Sizes.size16,
                        ),
                        Gaps.h4,
                        Text(
                          "4.1M",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Center(
              child: Text("HI"),
            )
          ],
        ),
      ),
    );
  }
}
