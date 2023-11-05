import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/auth_state/auth_cubit.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with TickerProviderStateMixin {
  late final TabController _tabController;
  final _nicknameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final List<String> tabVars = ['Регистрация', 'Авторизация'];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FormValidator validator = FormValidator();

  int _index = 0;
  bool _showPassword = false;

  @override
  void initState() {
    context.read<AuthCubit>().checkLoggedIn();
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _index = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TabBar(
                      controller: _tabController,
                      tabs: [Tab(text: tabVars[0]), Tab(text: tabVars[1])],
                      labelStyle: Theme.of(context).textTheme.titleMedium,
                      unselectedLabelStyle:
                          Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(
                    height: 24.0,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  TextFormField(
                    controller: _emailController,
                    validator: (value) => validator.simpleValidate(value),
                    decoration: InputDecoration(
                        label: Text(
                          'Почта',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        hintText: 'Введите почту',
                        border: const OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    validator: (value) => validator.simpleValidate(value),
                    obscureText: !_showPassword,
                    decoration: InputDecoration(
                        label: Text(
                          'Пароль',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        hintText: 'Введите пароль',
                        border: const OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: _showPassword,
                            onChanged: (val) => togglePasswordVisible(
                                val ?? false), //  <-- leading Checkbox
                          ),
                          Text('Показать пароль',
                              style: Theme.of(context).textTheme.labelLarge)
                        ],
                      ),
                      _index == 1
                          ? TextButton(
                              onPressed: () {},
                              child: const Text('Забыли пароль?'))
                          : const Text('')
                    ],
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  ElevatedButton(
                      onPressed: () => authFunction(context),
                      child: Text(tabVars[_index],
                          style: Theme.of(context).textTheme.bodyLarge)),
                  const SizedBox(
                    height: 16.0,
                  ),
                ],
              )),
        ),
      ),
    );
  }

  void togglePasswordVisible(bool val) => setState(() => _showPassword = val);

  void authFunction(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;

    String email = _emailController.value.text;
    String password = _passwordController.value.text;

    if (_index == 0) {
      context.read<AuthCubit>().registerWithEmailPassword(email, password);
    } else {
      context.read<AuthCubit>().signInWithEmailPassword(email, password);
    }
  }
}

class FormValidator {
  String? simpleValidate(String? val) {
    if (val == null || val.isEmpty || val.length < 4) {
      return 'The value must be longer';
    }
    return null;
  }
}
