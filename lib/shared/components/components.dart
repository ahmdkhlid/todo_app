// @dart=2.9

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udemy_projects/modules/todo_app/new_tasks/new_tasks_screen.dart';
import 'package:udemy_projects/shared/cubit/cubit.dart';
import 'package:udemy_projects/shared/styles/colors.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = defaultColor,
  @required String text,
  bool isUpperCase = true,
  double radius = 5.0,
  @required final Function() function,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 0.0,
      ),
      child: Container(
        decoration: BoxDecoration(),
        child: MaterialButton(
          minWidth: width,
          onPressed: function,
          height: 55.0,
          color: background,
          elevation: 3.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Text(
            text,
            style: GoogleFonts.aladin(
              color: Colors.white,
              fontSize: 30.0,
            ),
          ),
        ),
      ),
    );

Widget defaultTextButton({
  @required Function function,
  @required String text,
}) =>
    TextButton(
      child: Text(
        text.toUpperCase(),
        style: TextStyle(fontSize: 14, color: Colors.black54),
      ),
      onPressed: function,
    );

Widget defaultTextField({
  double radius = 5.0,
  @required TextEditingController controller,
  @required TextInputType type,
  @required String label,
  @required IconData prefix,
  Function onSubmit,
  bool isUpperCase = true,
  Function onChanged,
  @required validate,
  Function onTap,
  bool isPassword = false,
  IconData suffix,
  suffixPressed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onChanged: onChanged,
      onFieldSubmitted: onSubmit,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
            color: Colors.grey.withOpacity(0.5),
            fontSize: 18.0,
            fontWeight: FontWeight.w300),
        suffixIcon: suffix != null
            ? IconButton(
                icon: Icon(suffix),
                onPressed: suffixPressed,
              )
            : null,
        prefixIcon: Icon(prefix),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.solid,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(
            radius,
          ),
        ),
      ),
    );

Widget defaultTaskItem(
  Map model,
  context,
) =>
    Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Dismissible(
        key: Key(model['id'].toString()),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Card(
            shadowColor: Colors.grey[300],
            elevation: 4.0,
            color: Colors.white,
            borderOnForeground: true,
            child: Padding(
              padding: const EdgeInsets.all(
                10.0,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.indigo.shade100,
                    radius: 30.0,
                    child: Text(
                      '${model['time']}',
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${model['title']}',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        '${model['date']}',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  // const SizedBox(
                  //   width: 25.0,
                  // ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              AppCubit.get(context).updateData(
                                status: 'done',
                                id: model['id'],
                              );
                            },
                            icon: Icon(Icons.check_circle_outline),
                            color: Colors.black45,
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          IconButton(
                            onPressed: () {
                              AppCubit.get(context).updateData(
                                status: 'archived',
                                id: model['id'],
                              );
                            },
                            icon: Icon(Icons.archive_outlined),
                            color: Colors.black45,
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          IconButton(
                            onPressed: () {
                              AppCubit.get(context).deleteData(id: model['id']);
                            },
                            icon: Icon(Icons.delete),
                            color: Colors.black45,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        onDismissed: (direction) {
          AppCubit.get(context).deleteData(id: model['id']);
        },
      ),
    );

Widget tasksBuilder({
  @required List<Map> tasks,
}) =>
    ConditionalBuilder(
      condition: tasks.length > 0,
      builder: (context) => ListView.separated(
        itemBuilder: (context, index) => defaultTaskItem(
          tasks[index],
          context,
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 1.0,
        ),
        itemCount: tasks.length,
      ),
      fallback: (context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.menu,
              size: 100,
              color: Colors.grey,
            ),
            Text(
              'No tasks yet, please add some',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );

Widget infoCard({
  String text,
  Color background = Colors.black,
  IconData icon,
}) =>
    Container(
      width: double.infinity,
      height: 60,
      child: Card(
        color: Colors.white,
        elevation: 1.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Row(
          children: [
            const SizedBox(
              width: 10.0,
            ),
            Icon(
              icon,
              color: Colors.grey,
              size: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
              ),
              child: Text(
                text,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: background,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );

Widget buildArticleItem(
  article,
  context,
) =>
    InkWell(
      onTap: () {
        navigateTo(
          context,
          NewTasksScreen(),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(children: [
            Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                      '${article['urlToImage']}',
                    ),
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Container(
                height: 120.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );

Widget myDivider() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey.shade800,
      ),
    );

Widget articleBuilder(list, context, {isSearch = false}) => ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => buildArticleItem(
                list[index],
                context,
              ),
          separatorBuilder: (context, index) => myDivider(),
          itemCount: list.length),
      fallback: (context) =>
          isSearch ? Container() : Center(child: CircularProgressIndicator()),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ), (route) {
      return false;
    });

void showToast({
  @required String text,
  @required ToastStates state,
}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}

Widget buildListProduct(
  model,
  context, {
  bool isOldPrice = true,
}) =>
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 120.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage(model.image),
                  width: 120.0,
                  height: 120.0,
                ),
                if (model.discount != 0 && isOldPrice)
                  Container(
                    color: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      'DISCOUNT',
                      style: TextStyle(
                        fontSize: 8.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.0,
                      height: 1.3,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '${model.price.toString()}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14.0,
                          height: 1.3,
                          color: defaultColor,
                        ),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      if (model.product.discount != 0 && isOldPrice)
                        Text(
                          '${model.oldPrice.toString()}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 10.0,
                            height: 1.3,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      Spacer(),
                      // IconButton(
                      //   onPressed: () {
                      //     // ShopAppCubit.get(context).changeFavourites(model.id);
                      //   },
                      //   icon: ShopAppCubit.get(context).favorites[model.id]
                      //       ? Icon(
                      //           Icons.favorite_outlined,
                      //           color: Colors.pink,
                      //           size: 14.0,
                      //         )
                      //       : Icon(
                      //           Icons.favorite_outlined,
                      //           color: Colors.grey,
                      //           size: 14.0,
                      //         ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
