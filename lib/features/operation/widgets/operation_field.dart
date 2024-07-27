import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/textfields/txt_field.dart';

class OperationField extends StatelessWidget {
  const OperationField({
    super.key,
    required this.controller,
    required this.income,
    required this.onSelected,
  });

  final TextEditingController controller;
  final bool income;
  final void Function(bool) onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          TxtField(
            controller: controller,
            hintText: 'Operation name',
            onChanged: () {},
          ),
          Container(
            height: 0.5,
            margin: const EdgeInsets.only(left: 16),
            color: const Color(0xffEBEBF5).withOpacity(0.3),
          ),
          Container(
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                const SizedBox(width: 16),
                const Text(
                  'Select operation',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'SF',
                  ),
                ),
                const Spacer(),
                CupertinoButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Stack(
                          children: [
                            Positioned(
                              right: 30,
                              top: 160,
                              child: Material(
                                type: MaterialType.transparency,
                                child: Container(
                                  width: 250,
                                  margin: EdgeInsets.zero,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff252525),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    children: [
                                      CupertinoButton(
                                        onPressed: () {
                                          onSelected(true);
                                          context.pop();
                                        },
                                        padding: EdgeInsets.zero,
                                        child: const SizedBox(
                                          height: 44,
                                          child: Row(
                                            children: [
                                              SizedBox(width: 32),
                                              Text(
                                                'Income',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 17,
                                                  fontFamily: 'SF',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 0.5,
                                        color: const Color(0xffEBEBF5)
                                            .withOpacity(0.3),
                                      ),
                                      CupertinoButton(
                                        onPressed: () {
                                          onSelected(false);
                                          context.pop();
                                        },
                                        padding: EdgeInsets.zero,
                                        child: const SizedBox(
                                          height: 44,
                                          child: Row(
                                            children: [
                                              SizedBox(width: 32),
                                              Text(
                                                'Expense',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 17,
                                                  fontFamily: 'SF',
                                                ),
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
                          ],
                        );
                      },
                    );
                  },
                  padding: EdgeInsets.zero,
                  child: Row(
                    children: [
                      Text(
                        income ? 'Income' : 'Expense',
                        style: TextStyle(
                          color: const Color(0xffEBEBF5).withOpacity(0.3),
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'SF',
                        ),
                      ),
                      const SizedBox(width: 9),
                      SvgPicture.asset('assets/select.svg'),
                      const SizedBox(width: 16),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
