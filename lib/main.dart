import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scroll_list_search/blocs/giphy_cubit.dart';
import 'package:scroll_list_search/models/gif_model.dart';
import 'package:scroll_list_search/widgets/list_item.dart';
import 'package:scroll_list_search/widgets/search_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Searching scroll list',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
          create: (_) => GiphyCubit(),
          child: const MyHomePage(title: 'Searching scroll list')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController controller = ScrollController();
  TextEditingController textEditingController = TextEditingController();
  int page = 0;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    if (textEditingController.text.isNotEmpty) {
      fetch();
    }
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        fetch();
      }
    });
  }

  void fetch() {
    setState(() {
      isLoading = true;
    });
    context.read<GiphyCubit>().read(page, textEditingController.text);
    setState(() {
      page++;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title)
              .animate()
              .scale(
                curve: Curves.decelerate,
                duration: Duration(milliseconds: 500),
              )
              .slideX(
                curve: Curves.decelerate,
                duration: Duration(milliseconds: 500),
              )),
      body: Column(
        children: [
          SearchField(
            controller: textEditingController,
            onChanged: (value) {
              Future.delayed(const Duration(milliseconds: 300))
                  .whenComplete(() {
                setState(() {
                  context.read<GiphyCubit>().update([]);
                  page = 0;
                });
                if (value.isNotEmpty) {
                  fetch();
                }
              });
            },
          ),
          Expanded(
            child: BlocBuilder<GiphyCubit, List<GifModel>>(
                builder: (context, items) {
              return ListView.builder(
                  controller: controller,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8.0),
                  itemCount: items.length + 1,
                  itemBuilder: (context, index) {
                    if (index < items.length) {
                      return ListItem(item: items[index]);
                    } else {
                      return Center(
                        child: items.isEmpty || !isLoading
                            ? Container()
                            : const CircularProgressIndicator(),
                      );
                    }
                  });
            }),
          ),
        ],
      ),
    );
  }
}
