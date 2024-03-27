import 'package:ecomm_bloc_app/core/utils/show_snackbar.dart';
import 'package:ecomm_bloc_app/features/product/presentaion/bloc/product_bloc.dart';
import 'package:ecomm_bloc_app/features/product/presentaion/widgets/product_card_for_grid_view.dart';
import 'package:ecomm_bloc_app/features/product/presentaion/widgets/product_list_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      context.read<ProductBloc>().add(ProductListFetch());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ecomm App"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocConsumer<ProductBloc, ProductState>(
              listener: (context, state) {
            if (state is ProductListError) {
              showSnackBar(context, state.error);
            }
          }, builder: (context, state) {
            if (state is ProductListLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProductListSuccess) {
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    childAspectRatio: 2 / 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    final product = state.products[index];
                    return ProductCardForGirdView(product: product);
                  });
              // return GridView.count(
              //   crossAxisCount: 2,
              //   childAspectRatio: 0.68,
              //   physics: const NeverScrollableScrollPhysics(),
              //   shrinkWrap: true,
              //   children: [
              //     for (int i = 1; i <= 5; i++) ProductCardForGirdView(p)
              //   ],
              // );

              // return ListView.builder(
              //   itemCount: state.products.length,
              //   itemBuilder: (context, index) {
              //     final product = state.products[index];
              //     return ProductListCard(product: product);

              //   },
              // );
            }
            return const SizedBox();
          }),
        ),
      ),
    );
  }
}
