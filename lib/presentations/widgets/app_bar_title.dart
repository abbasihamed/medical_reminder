import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_reminder/core/extentions.dart';
import 'package:medical_reminder/presentations/cubits/person_info/person_info_cubit.dart';

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
                        context
                            .read<PersonInfoCubit>()
                            .setInfo(name: nameController.text.trim());
                        nameController.clear();
                        setState(() {});
                      },
                      icon: const Icon(Icons.check),
                    ),
                    IconButton(
                      onPressed: () {
                        nameController.clear();
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
                  BlocBuilder<PersonInfoCubit, PersonInfoState>(
                    builder: (context, state) {
                      if (state is GetPersonInfo) {
                        final personInfoEntity = state.personInfoEntity;
                        if (personInfoEntity != null) {
                          return Text(personInfoEntity.name);
                        }

                        return const Text('کاربر مهمان');
                      }
                      return const Text('کاربر مهمان');
                    },
                  ),
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
