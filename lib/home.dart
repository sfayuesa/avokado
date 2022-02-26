import 'package:flutter/material.dart';
import 'package:ss/mock_data.dart';

class ViewHome extends StatefulWidget {
  const ViewHome({Key? key}) : super(key: key);

  @override
  State<ViewHome> createState() => _ViewHomeState();
}

class _ViewHomeState extends State<ViewHome> {
  static const double _padding = 8;
  final MockData _mock = MockData();

  @override
  void initState() {
    super.initState();
    _mock.init().then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Avokado"),
      ),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: _padding),
          child: GridView.builder(
            itemCount: _mock.dashboard.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1.5,
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              var _indexItem = _mock.dashboard[index];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  child: Stack(
                    children: [
                      _buildBoxAndShadow(),
                      _buildCardInformation(_indexItem, context),
                    ],
                  ),
                  onTap: () {
                    // TODO tap for dashboard item
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCardInformation(
    BasicMockData _indexItem,
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _indexItem.title,
            style: Theme.of(context).textTheme.headline6,
          ),
          const Spacer(),
          if (_indexItem.description != null)
            Text(
              _indexItem.description!,
              overflow: TextOverflow.fade,
              maxLines: 3,
            ),
        ],
      ),
    );
  }

  Widget _buildBoxAndShadow() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 4),
            spreadRadius: 1,
          ),
        ],
      ),
    );
  }
}
