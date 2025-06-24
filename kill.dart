import 'package:flutter/material.dart';

class hip extends StatefulWidget {
  const hip({super.key});


  @override
  State<hip> createState() => _hipState();

}
class _hipState extends State<hip> {


  final TextEditingController pricecontroller = TextEditingController();
  final TextEditingController gstcontroller = TextEditingController();
  String result = "";

  void calculateGST () {
    double? price = double.tryParse(pricecontroller.text);
    double? gst = double.tryParse(gstcontroller.text);

    if (price == null || gst == null) {
      setState(() {
        result = "Enter the valid values";
      });
      return;
    }
    double gstAmount = (price * gst) / 100;
    double totalAmount = price + gstAmount;

    setState(() {
      showDialog(context: (context), builder: (BuildContext) {
        return AboutDialog(
          children: [
            Text("$result"),
          ],
        );
      });
      result = "Original price = \u20B9$price\n"
          "GST Rate: $gst%\n"
          "Gst Amount: \u20B9${gstAmount.toStringAsFixed(2)}\n"
          "Final Amount: \u20B9${totalAmount.toStringAsFixed(2)}\n";
    });
  }
  inclu(){
    double? price = double.tryParse(pricecontroller.text);
    double? gst = double.tryParse(gstcontroller.text);

    double priceAmount = 100 + gst!;
    double gstAmount = priceAmount / 100;
    double currentAmount = price! / gstAmount;
    double totalAmount = price - currentAmount;

    print(totalAmount);

    showDialog(context: (context), builder: (BuildContext) {
      return AboutDialog(
        children: [
          Text("$result")
        ],
      );
    });
    result = "original price = \u20B9$price\n"
    "gst =$gst%\n"
    "Amount =\u20B9${currentAmount.toStringAsFixed(3)}\n"
    "tax cost =\u20B9${totalAmount.toStringAsFixed(3)}\n";

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GST Calculator"),
      ),
      body:
      Column(
        children: [
          const SizedBox(height: 100),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: pricecontroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Enter your price',
                      border: OutlineInputBorder()
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              const SizedBox(height: 50),
              Padding(

                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: gstcontroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'enter GST',
                    border: OutlineInputBorder()
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 60),
          ElevatedButton(onPressed: (calculateGST), child: Text('Exclusive')),
          const SizedBox(height: 50),
          ElevatedButton(onPressed: (inclu), child: Text('Inclusive'))

        ],

      ),


    );
  }
}
