import 'package:arxitektura_1/viewmodel/create_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateData extends StatefulWidget {

  static String get id => "create_data";

   const CreateData({super.key,});

  @override
  State<CreateData> createState() => _CreateDataState();
}

class _CreateDataState extends State<CreateData> {
  CreateViewModel viewModel = CreateViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Data")),
      body: ChangeNotifierProvider(
        create: (_) => CreateViewModel(),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Consumer<CreateViewModel>(
            builder: (context, viewModel, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    onChanged:(value)=> viewModel.title,
                    decoration: const InputDecoration(
                      hintText: "Title",
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    onChanged:(value)=> viewModel.createBody(value),
                    decoration: const InputDecoration(
                      hintText: "Body",
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: viewModel.createData(),
                    child: const Text("Create"),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}