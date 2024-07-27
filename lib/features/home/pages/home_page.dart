import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/models/operation.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../operation/bloc/operation_bloc.dart';
import '../../settings/pages/settings_page.dart';
import '../bloc/home_bloc.dart';
import '../widgets/balance_card.dart';
import '../widgets/home_appbar.dart';
import '../widgets/nav_bar.dart';
import '../widgets/operation_card.dart';
import '../widgets/transaction_tabs.dart';
import '../widgets/transaction_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Stack(
        children: [
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeNews) return const Text('News');
              if (state is HomeQuiz) return const Text('Quiz');
              if (state is HomeSettings) return const SettingsPage();
              return const _Home();
            },
          ),
          const NavBar(),
        ],
      ),
    );
  }
}

class _Home extends StatefulWidget {
  const _Home();

  @override
  State<_Home> createState() => _HomeState();
}

class _HomeState extends State<_Home> {
  int tabIndex = 0;
  List<Operation> operations = getList(0);

  void changeTab(int index) {
    if (index != tabIndex) {
      setState(() {
        tabIndex = index;
        operations = getList(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const HomeAppbar(),
              const SizedBox(height: 16),
              const BalanceCard(),
              const SizedBox(height: 24),
              const TransactionText(),
              const SizedBox(height: 16),
              TransactionTabs(
                tabIndex: tabIndex,
                onTap: changeTab,
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
        BlocBuilder<OperationBloc, OperationState>(
          builder: (context, state) {
            if (state is OperationsLoadedState) {
              if (state.operations.isEmpty) {
                return const Expanded(
                  child: Center(
                    child: Text('No operations!'),
                  ),
                );
              }

              return Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  children: [
                    ...List.generate(
                      operations.length,
                      (index) {
                        return OperationCard(operation: operations[index]);
                      },
                    ),
                  ],
                ),
              );
            }

            return Container();
          },
        ),
        const SizedBox(height: 62),
      ],
    );
  }
}
