// Material(
//                                   clipBehavior: Clip.hardEdge,
//                                   shape: const CircleBorder(),
//                                   color: Colors.transparent,
//                                   child: Hero(
//                                     tag: '_ColartiveCanvas',
//                                     flightShuttleBuilder: (
//                                       BuildContext flightContext,
//                                       Animation<double> animation,
//                                       HeroFlightDirection flightDirection,
//                                       BuildContext fromHeroContext,
//                                       BuildContext toHeroContext,
//                                     ) {
//                                       return Container(
//                                         decoration: BoxDecoration(
//                                           color: darkModeFlag
//                                               ? jetBlack
//                                               : lightModeBgColor,
//                                           shape: BoxShape.circle,
//                                         ),
//                                       );
//                                     },
//                                     child: IconButton(
//                                       icon: const Icon(Icons.check),
//                                       onPressed: () async {
//                                         if (state.selectedColors.isNotEmpty) {
//                                           hintIndex = -1;
//                                           hintModeFlag = false;
//                                           textIndex = -2;
//                                           textMode = 0;
//                                           BlocProvider.of<SelectedColorsBloc>(
//                                                   context)
//                                               .onRemoveEmptyStickerText();
//                                           if (FocusScope.of(context).hasFocus) {
//                                             FocusScope.of(context).unfocus();
//                                           }
//                                           Navigator.push(
//                                             context,
//                                             PageRouteBuilder(
//                                               transitionDuration:
//                                                   const Duration(
//                                                       milliseconds: 500),
//                                               pageBuilder: (_, __, ___) =>
//                                                   CanvasFull(design,
//                                                       state.selectedColors),
//                                             ),
//                                           );
//                                         } else {
//                                           showSnackBar(
//                                               context,
//                                               'No Color selected',
//                                               'Please select colors to proceed.');
//                                         }
//                                       },
//                                     ),
//                                   ),
//                                 ),