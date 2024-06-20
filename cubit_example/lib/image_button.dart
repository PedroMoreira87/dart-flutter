import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'image_select_bloc.dart';

class ImageButton extends StatelessWidget {
  const ImageButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageSelectCubit, ImageSelectState>(
      builder: (context, state) {
        if (state.imageUrl != null) {
          return IconButton(
            icon: Image.network(state.imageUrl!),
            iconSize: 50,
            onPressed: () {},
          );
        } else {
          return Container();
        }
      },
    );
  }
}
