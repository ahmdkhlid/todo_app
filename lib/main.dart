// @dart=2.9
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_projects/modules/todo_app/new_tasks/new_tasks_screen.dart';
import 'package:udemy_projects/shared/bloc_observer.dart';
import 'package:udemy_projects/shared/network/remote/dio_helper.dart';

import 'all_app_cubit/cubit.dart';
import 'all_app_cubit/states.dart';
import 'shared/network/local/cache_helper.dart';
import 'shared/styles/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  bool isDark = CacheHelper.getData(key: 'isDark');

  runApp(
    MyApp(
      isDark: isDark,
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isDark;

  MyApp({
    this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AllAppCubit(),
      child: BlocConsumer<AllAppCubit, AllAppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            theme: lightTheme,
            darkTheme: darkTheme,
            debugShowCheckedModeBanner: false,
            title: 'Flutter ',
            themeMode: ThemeMode.light,
            home: NewTasksScreen(),
          );
        },
      ),
    );
  }
}
