import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_bloc_with_mockapi/blocs/create_contact_cubit.dart';
import 'package:pattern_bloc_with_mockapi/blocs/create_contact_state.dart';
import 'package:pattern_bloc_with_mockapi/views/view_of_create.dart';
class CreatePage extends StatelessWidget {
  final fullnameController = TextEditingController();
  final phoneNumberController = TextEditingController();

  _finish(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Navigator.pop(context, "result");
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateContactCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Create Contact', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
        ),
        body: BlocBuilder<CreateContactCubit, CreateContactState>(
          builder: (context, state) {
            if(state is CreateContactLoading) {
              return viewOfCreate(context,fullnameController,phoneNumberController, true);
            }
            if(state is CreateContactLoaded) {
              _finish(context);
            }
            if(state is CreateContactError) {
              return Center(
                child: Text(state.error),
              );
            }

            return viewOfCreate(context,fullnameController,phoneNumberController, false);
          },
        ),
      ),
    );
  }
}
