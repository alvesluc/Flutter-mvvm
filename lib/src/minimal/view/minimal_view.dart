import 'package:flutter/material.dart';

import '../state/minimal_state.dart';
import '../view_model/minimal_view_model.dart';

class MinimalView extends StatefulWidget {
  const MinimalView({Key? key}) : super(key: key);

  @override
  State<MinimalView> createState() => _MinimalViewState();
}

class _MinimalViewState extends State<MinimalView> {
  final _viewModel = MinimalViewModel(MinimalState());

  @override
  void initState() {
    super.initState();
    _viewModel.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _viewModel.removeListener(() {});
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "E-mail",
                ),
                onChanged: _viewModel.setEmail,
                enabled: !_viewModel.state.isLoading,
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Password",
                ),
                obscureText: true,
                onChanged: _viewModel.setPassword,
                enabled: !_viewModel.state.isLoading,
              ),
              TextButton(
                onPressed: _viewModel.canLogin ? _viewModel.login : null,
                child: Text(_viewModel.state.message),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
