import 'package:flutter/material.dart';

class KeepaliveWrapper extends StatefulWidget {
  const KeepaliveWrapper(
      {super.key, @required this.child, this.keepAlive = true});

  final Widget? child;
  final bool keepAlive;

  @override
  State<KeepaliveWrapper> createState() => _KeepaliveWrapperState();
}

class _KeepaliveWrapperState extends State<KeepaliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return widget.child!;
  }

  @override
  bool get wantKeepAlive => widget.keepAlive;
}
