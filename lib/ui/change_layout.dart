import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChangeLayout extends StatefulWidget {
  int colCountValue;
  List<String> options;
  double aspectWidth;
  double aspectHeight;
  bool isNext;
  ChangeLayout(this.colCountValue, this.options, this.aspectWidth,
      this.aspectHeight, this.isNext);

  @override
  _ChangeLayoutState createState() => _ChangeLayoutState();
}

class _ChangeLayoutState extends State<ChangeLayout> {
  int _index;
  @override
  void initState() {
    _index = -1;
    super.initState();
  }

  @override
  void didUpdateWidget(ChangeLayout oldWidget) {
    if (widget.isNext) {
      _index = -1;
    }

    print('did update widget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      controller: new ScrollController(keepScrollOffset: false),
      crossAxisCount: widget.colCountValue,
      childAspectRatio: widget.aspectWidth / widget.aspectHeight,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.all(10),
      children: List.generate(
        widget.options.length,
        (index) => InkWell(
          splashColor: Colors.orange,
          onTap: () {
            setState(() {
              _index = index;
            });
          },
          child: Card(
            color: _index == index ? Colors.pink : Colors.white,
            shadowColor: Colors.yellow,
            borderOnForeground: true,
            elevation: 7.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Row(
              children: [
                Icon(Icons.fiber_manual_record,
                    size: 15,
                    color: index == _index ? Colors.white : Colors.indigo[900]),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: Text(widget.options[index],
                        style: TextStyle(
                            fontSize: 15,
                            color: index == _index
                                ? Colors.white
                                : Colors.indigo[900],
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
