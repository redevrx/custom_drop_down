import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_drop_down_widget/flutter_custom_drop_down_widget.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    late OverlayPortalController controller1;
    late OverlayPortalController controller2;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('CustomDropDown'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: kToolbarHeight,
                ),

                /// dropdown button
                Text(
                  'dropdown button',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                CustomDropDown(
                  getController: (controller) {
                    controller2 = controller;
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * .8,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(.23),
                              blurRadius: .4)
                        ]),
                    child: Row(
                      children: [
                        CupertinoCheckbox(value: false, onChanged: (it) {}),
                        const Text("Open"),
                      ],
                    ),
                  ),
                  dropDownBuilder: () {
                    return Container(
                      width: MediaQuery.of(context).size.width * .8,
                      height: MediaQuery.of(context).size.height / 100 * 30,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0)),
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              CupertinoCheckbox(
                                  value: true, onChanged: (it) {}),
                              const Text("Item Name")
                            ],
                          );
                        },
                      ),
                    );
                  },
                ),

                const SizedBox(
                  height: kToolbarHeight,
                ),

                /// dropdown button
                Text(
                  'dropdown button',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                CustomDropDown(
                  getController: (controller) {
                    controller1 = controller;
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(12.0)),
                    child: const Text("Open"),
                  ),
                  dropDownBuilder: () {
                    return Container(
                      width: MediaQuery.of(context).size.width * .2,
                      height: MediaQuery.of(context).size.height / 100 * 30,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0)),
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return ElevatedButton(
                            onPressed: () {
                              controller1.toggle();
                            },
                            child: const Text("Open"),
                          );
                        },
                      ),
                    );
                  },
                ),

                const SizedBox(
                  height: kToolbarHeight * 2.8,
                ),
                Text(
                  'dropdown button',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                CustomDropDown(
                  targetAnchor: Alignment.bottomLeft,
                  alignment: Alignment.topCenter,
                  getController: (controller) {
                    controller2 = controller;
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * .8,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(.23),
                              blurRadius: .4)
                        ]),
                    child: Row(
                      children: [
                        CupertinoCheckbox(value: false, onChanged: (it) {}),
                        const Text("Open"),
                      ],
                    ),
                  ),
                  dropDownBuilder: () {
                    return Container(
                      margin: const EdgeInsets.only(top: 2),
                      width: MediaQuery.of(context).size.width * .4,
                      height: MediaQuery.of(context).size.height / 100 * 30,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0)),
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: controller2.toggle,
                            child: Row(
                              children: [
                                CupertinoCheckbox(
                                    value: true, onChanged: (it) {}),
                                const Text("Item Name")
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
