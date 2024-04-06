import 'package:flutter/material.dart';
import 'package:mockup_one/src/components/main_variable.dart';
import 'package:mockup_one/src/components/textstyle.dart';

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  ScrollController? scrollController;
  

  double get _horizontalTitlePadding {
    
    const kBasePadding = 15.0;
    const kMultiplier = 0.5;

    if (scrollController!.hasClients) {
      if (scrollController!.offset < (MediaQuery.of(context).size.height / 2)) {
        // In case 50%-100% of the expanded height is viewed
        return kBasePadding;
      }

      if (scrollController!.offset > (MediaQuery.of(context).size.height - kToolbarHeight)) {
        // In case 0% of the expanded height is viewed
        return (MediaQuery.of(context).size.height / 2 - kToolbarHeight) * kMultiplier +
            kBasePadding;
      }

      // In case 0%-50% of the expanded height is viewed
      return (scrollController!.offset - (MediaQuery.of(context).size.height / 2)) * kMultiplier +
          kBasePadding;
    }

    return kBasePadding;
}


  @override
  void initState() {
    scrollController = ScrollController()..addListener(() => setState(() {}));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
          length: 3,
          child: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                 SliverAppBar(
                  centerTitle: true,
                  surfaceTintColor: Colors.transparent,
                  automaticallyImplyLeading: false,
                  expandedHeight: 100.0,
                  elevation: 0,
                  backgroundColor: Colors.white,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    collapseMode: CollapseMode.pin,
                    titlePadding: EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: _horizontalTitlePadding),
                      title: Text("Transactions",
                          style: kDefaultTextStyleCustom(color: GlobalVariablesType.buttonTextColor![1]),
                    ),
                  )
                ),
                SliverPersistentHeader(
                  delegate: _SliverAppBarDelegate(
                   TabBar(
                    indicatorColor: GlobalVariablesType.buttonTextColor![1],
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelColor: Colors.black87,
                      unselectedLabelColor: Colors.white,
                      automaticIndicatorColorAdjustment: true,
                      tabs: [
                        Tab(icon: Text("Active",style: kDefaultTextStyleCustom(color: GlobalVariablesType.buttonTextColor![1]),)),
                        Tab(icon: Text("Pending", style: kDefaultTextStyleCustom(color: GlobalVariablesType.buttonTextColor![1]),)),
                        Tab(icon: Text("Done", style: kDefaultTextStyleCustom(color: GlobalVariablesType.buttonTextColor![1]),)),
                      ],
                    ),
                  ),
                  pinned: true,
                ),
              ];
            },
            body: TabBarView(
              children: [
                Text("Hello 1", style: kDefaultTextStyleCustom(color: GlobalVariablesType.buttonTextColor![1]),),
                Text("Hello 2", style: kDefaultTextStyleCustom(color: GlobalVariablesType.buttonTextColor![1]),),
                Text("Hello 3", style: kDefaultTextStyleCustom(color: GlobalVariablesType.buttonTextColor![1]),),
              ]
          )
        ),
      )
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
    _SliverAppBarDelegate(this._tabBar);

    final TabBar _tabBar;

    @override
    double get minExtent => _tabBar.preferredSize.height;
    @override
    double get maxExtent => _tabBar.preferredSize.height;

    @override
    Widget build(
        BuildContext context, double shrinkOffset, bool overlapsContent) {
      return Container(
        child: _tabBar,
      );
    }

    @override
    bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
      return false;
    }
  }