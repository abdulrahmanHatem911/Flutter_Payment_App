import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/modules/payment/cubit/cubit.dart';
import 'package:payment/modules/payment/cubit/state.dart';
import 'package:payment/modules/payment/toggle_screen.dart';
import 'package:payment/modules/widgets/show_snack.dart';
import 'package:payment/shared/components/component_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var priceController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit()..getAuthToken(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Pament Intergration'),
          backgroundColor: Colors.purple.shade400,
          centerTitle: true,
        ),
        body: BlocConsumer<PaymentCubit, PaymentStates>(
          listener: (context, state) {
            if (state is PaymentRequestTokenSuccessStates) {
              showSnackBar(
                context: context,
                text: 'Success get final token',
                color: Colors.green,
              );
              navigateTo(context, const ToggleScreen());
            }
          },
          builder: (context, state) {
            var cubit = PaymentCubit.get(context);
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 150.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: Colors.purple.shade100,
                        ),
                      ),
                      const SizedBox(height: 20),
                      // for first name
                      defaultTextFromFiled(
                        controller: firstNameController,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter your first name !';
                          }
                          return null;
                        },
                        type: TextInputType.name,
                        label: 'First name',
                        prefix: Icons.person,
                      ),
                      const SizedBox(height: 10),
                      // for last name
                      defaultTextFromFiled(
                        controller: lastNameController,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter your last name !';
                          }
                          return null;
                        },
                        type: TextInputType.name,
                        label: 'Last name',
                        prefix: Icons.person,
                      ),
                      const SizedBox(height: 10),
                      // for email name
                      defaultTextFromFiled(
                        controller: emailController,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email  !';
                          }
                          return null;
                        },
                        type: TextInputType.emailAddress,
                        label: 'Email',
                        prefix: Icons.email,
                      ),
                      const SizedBox(height: 10),
                      // for phone name
                      defaultTextFromFiled(
                        controller: phoneController,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter your phone !';
                          }
                          return null;
                        },
                        type: TextInputType.number,
                        label: 'Phone',
                        prefix: Icons.phone,
                      ),
                      const SizedBox(height: 10),
                      // for price name
                      defaultTextFromFiled(
                        controller: priceController,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter your price !';
                          }
                          return null;
                        },
                        type: TextInputType.number,
                        label: 'Price',
                        prefix: Icons.monetization_on,
                      ),
                      const SizedBox(height: 20),
                      defaultButton(
                        buttonWidget: state is! PaymentRequestTokenLoadingStates
                            ? const Text(
                                'Register',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                ),
                              )
                            : const Center(
                                child: CircularProgressIndicator(),
                              ),
                        function: () {
                          if (formKey.currentState!.validate()) {
                            cubit.getOrderRegistrationID(
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              email: emailController.text,
                              phone: phoneController.text,
                              price: priceController.text,
                            );
                          }
                        },
                        width: 200,
                        radius: 10.0,
                        backgroundColor: Colors.purple.shade300,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
