// import 'package:flutter/material.dart';
// import 'package:mobx/mobx.dart';

// class BaseView<T extends Store> extends StatefulWidget {
//   const BaseView({
//     Key? key,
//     required this.controller,
//     this.onModelReady,
//     this.onDispose,
//     required this.onPageBuilder,
//   }) : super(key: key);

//   final T controller;
//   final Function(T model)? onModelReady;
//   final VoidCallback? onDispose;
//   final Widget Function(BuildContext context, T value) onPageBuilder;

//   @override
//   State<BaseView> createState() => _BaseViewState();
// }

// class _BaseViewState extends State<BaseView> {
//   @override
//   void initState() {
//     widget.onModelReady != null ? widget.onModelReady!(widget.controller) : {};
//     super.initState();
//   }

//   @override
//   void dispose() {
//     widget.onDispose != null ? widget.onDispose!() : {};
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return widget.onPageBuilder(context, widget.controller);
//   }
// }
