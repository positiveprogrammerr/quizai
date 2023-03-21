import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quizai/utils/assets_manager.dart';

class AccountAvatarWidget extends StatelessWidget {
  const AccountAvatarWidget({
    Key? key,
    this.loading = false,
    this.photo,
  }) : super(key: key);
  final String? photo;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: Container(
        width: 64,
        height: 64,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: loading
            ? const CupertinoActivityIndicator(
                color: Colors.white,
                radius: 18,
              )
            : photo == null
                ? SvgPicture.asset(
                    Assets.icon('ic_camera'),
                    fit: BoxFit.scaleDown,
                  )
                : Image.network(
                    photo!,
                    fit: BoxFit.cover,
                  ),
      ),
    );
  }
}
