
Future<bool> showConfirmDialogue({
  required BuildContext context,
  required String title,
  required String message,
  Function? onOkPress,
  double? fontSize,
  Function? onCancelPress,
  String? okButtonText,
  String? cancelButtonText,
  Color? backGrndColor,
}) async {
  bool? confirmed = await showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: ((context) => Stack(fit: StackFit.expand, children: [
            GestureDetector(onTap: () => Navigator.pop(context)),
            AlertDialog(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              title: Text(
                title,
                style: textStyle(fontWeight: FontWeight.w800, color: black),
              ),
              content: SizedBox(
                height: 120,
                child: Column(children: [
                  Text(
                    message,
                    style: textStyle(
                        fontWeight: FontWeight.w400,
                        color: black,
                        fontSize: fontSize ?? 16),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      kWidth,
                      Expanded(
                        child: TextButton(
                            style: TextButton.styleFrom(
                                elevation: 10, backgroundColor: black),
                            onPressed: () {
                              Navigator.pop(context, true);
                              onOkPress != null ? onOkPress() : null;
                            },
                            child: Text(
                              okButtonText ?? 'Yes',
                              style: const TextStyle(color: kWhite),
                            )),
                      ),
                      kWidth,
                      Expanded(
                        child: TextButton(
                            style: TextButton.styleFrom(
                                side: const BorderSide(color: kgrey)),
                            onPressed: () {
                              Navigator.pop(context, false);
                            },
                            child: Text(
                              cancelButtonText ?? 'No',
                              style: const TextStyle(color: black),
                            )),
                      ),
                      kWidth,
                    ],
                  )
                ]),
              ),
              // actions: [
              // TextButton(

              //     onPressed: () {
              //       Navigator.pop(context, true);
              //       onOkPress != null ? onOkPress() : null;
              //     },
              //     child: Text(
              //       okButtonText ?? 'Yes',
              //       style: const TextStyle(color: black),
              //     )),
              //   TextButton(
              //       onPressed: () {
              //         Navigator.pop(context, false);
              //       },
              //       child: Text(
              //         cancelButtonText ?? 'No',
              //         style: const TextStyle(color: black),
              //       ))
              // ],
            ),
          ])));
  return confirmed ?? false;
}
