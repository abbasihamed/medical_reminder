import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medical_reminder/core/extentions.dart';

class HomeAppBarTitle extends StatefulWidget {
  const HomeAppBarTitle({
    super.key,
  });

  @override
  State<HomeAppBarTitle> createState() => _HomeAppBarTitleState();
}

class _HomeAppBarTitleState extends State<HomeAppBarTitle> {
  bool isEdit = false;
  final TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return isEdit
        ? TextFormField(
            controller: nameController,
            inputFormatters: [
              LengthLimitingTextInputFormatter(60),
            ],
            decoration: InputDecoration(
              hintText: 'نام خود را بنویسید',
              suffixIcon: SizedBox(
                width: 85,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        isEdit = false;
                        setState(() {});
                      },
                      icon: const Icon(Icons.check),
                    ),
                    IconButton(
                      onPressed: () {
                        isEdit = false;
                        setState(() {});
                      },
                      icon: const Icon(Icons.close_rounded),
                    ),
                  ],
                ),
              ),
              enabledBorder: const UnderlineInputBorder(),
              focusedBorder: const UnderlineInputBorder(),
            ),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text('کاربر مهمان'),
                  IconButton(
                    onPressed: () {
                      isEdit = true;
                      setState(() {});
                    },
                    icon: const Icon(Icons.edit),
                  ),
                ],
              ),
              Text('امروز حالتان چطوره؟',
                  style: context.textThem().titleMedium),
            ],
          );
  }
}
