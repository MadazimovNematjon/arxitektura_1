import 'package:arxitektura_1/viewmodel/create_view_model.dart';
import 'package:arxitektura_1/viewmodel/update_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdatePage extends StatefulWidget {

  static String get id => "create_data";

  const UpdatePage({super.key,});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  UpdateViewModel viewModel = UpdateViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Update Data")),
      body: ChangeNotifierProvider(
        create: (_) => CreateViewModel(),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Consumer<UpdateViewModel>(
            builder: (context, viewModel, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    onChanged:(value)=> viewModel.updateBody(value),
                    decoration: const InputDecoration(
                      hintText: "Title",
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    onChanged:(value)=> viewModel.updateBody(value),
                    decoration: const InputDecoration(
                      hintText: "Body",
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: viewModel.updateData(),
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