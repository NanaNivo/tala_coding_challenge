import 'package:tala_coding_challenge/presentation/custom_widgets/infinite_list_view/bloc/infinite_list_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


extension CustomWidgetExtension on double {
  Widget gap() {
    return SizedBox(height: this);
  }
}

class PaginationError extends StatelessWidget {
  final String error;
  final StatusError typeError;
  const PaginationError({ Key? key, required this.error,this.typeError=StatusError.unset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Center(
           child: Image.asset(
            'lib/assets/images/svg/error_pag.svg',
            fit: BoxFit.contain,
            height: 200,
        ),
         ),
        20.0.gap(),
        // Center(
        //     child: Text(
        //       error.toString().toUpperCase(),
        //       style: TextStyle(
        //           color: locator<AppThemeColors>().secondaryColor),
        //     )),
      ],
    );
  }
}
