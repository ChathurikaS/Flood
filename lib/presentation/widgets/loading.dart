// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/widgets/space.dart';
import 'package:flutter_application_1/presentation/widgets/text.dart';

class LoadablePage extends StatelessWidget {
  final bool isLoading;
  final PreferredSizeWidget? appBar;
  final Widget body;

  const LoadablePage({
    super.key,
    required this.isLoading,
    this.appBar,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        Scaffold(appBar: appBar, body: body),
        if (isLoading)
          Material(
            color: Colors.black.withOpacity(0.6),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
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
              ),
            ),
          ),
      ],
    );
  }
}
