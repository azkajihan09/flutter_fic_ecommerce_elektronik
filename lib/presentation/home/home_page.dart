import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fic_ecommerce_elektronik/common/global_variables.dart';
import 'package:flutter_fic_ecommerce_elektronik/presentation/home/widget/list_category_widget.dart';

import '../../bloc/checkout/checkout_bloc.dart';
import '../cart/cart_page.dart';
import 'widget/banner_widget.dart';
import 'widget/list_product_widget.dart';
import 'package:badges/badges.dart' as badges;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(color: Color(0xff3A539B)),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 38,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Material(
                    borderRadius: BorderRadius.circular(10),
                    elevation: 3,
                    child: TextFormField(
                      onFieldSubmitted: (_) {},
                      decoration: InputDecoration(
                        prefixIcon: InkWell(
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.only(left: 6),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(
                          top: 10,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          borderSide: BorderSide(
                            color: Colors.black38,
                            width: 1,
                          ),
                        ),
                        hintText: 'Lagi cari produk apa ? ',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.mail_outlined,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    Icons.notifications_outlined,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  BlocBuilder<CheckoutBloc, CheckoutState>(
                    builder: (context, state) {
                      if (state is CheckoutLoaded) {
                        return badges.Badge(
                          badgeStyle: const badges.BadgeStyle(
                              elevation: 0, badgeColor: Colors.white),
                          badgeContent: Text(
                            '${state.items.length}',
                            style: const TextStyle(
                              color: Color(0xffEE4D2D),
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const CartPage()));
                            },
                            child: const Icon(
                              Icons.shopping_cart_outlined,
                            ),
                          ),
                        );
                      }
                      return const badges.Badge(
                        badgeStyle: badges.BadgeStyle(
                            elevation: 0, badgeColor: Colors.white),
                        badgeContent: Text(
                          '4',
                          style: TextStyle(color: Color(0xffEE4D2D)),
                        ),
                        child: Icon(
                          Icons.shopping_cart_outlined,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: BannerWidget(),
          ),
          ListCategoryWidget(),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              'List Product',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(child: ListProductWidget())
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        onTap: (index) {},
        items: [
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 0
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: const Icon(
                Icons.home_outlined,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 1
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: const Icon(Icons.person_outline_outlined),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
