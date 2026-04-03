import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager/core/cubits/product_Cubit/product_cubit.dart';
import 'package:tager/core/repos/get_product_repo.dart';
import 'package:tager/core/servies/create_singleton_servies_locator.dart';
import 'package:tager/feature/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = 'homeView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(getIt.get<GetProductRepo>()),
      child: const HomeViewBody(),
    );
  }
}


