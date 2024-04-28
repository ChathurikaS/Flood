import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/widgets/space.dart';
import 'package:flutter_application_1/presentation/widgets/text.dart';

class _LoadingDialog extends StatelessWidget {
  const _LoadingDialog();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset("assets/gifs/loading.gif")),
          const VGap(gap: 20),
          SizedBox(
            width: double.infinity,
            child: Material(
              color: theme.primaryColor.withOpacity(0.8),
              shape: const StadiumBorder(),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Center(
                    child: TextRegular(
                  "Loading...",
                  color: Colors.white,
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}

void showLoadingDialog(
    BuildContext context, Function(BuildContext context) onBuild) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      onBuild(context);
      return const _LoadingDialog();
    },
  );
}
