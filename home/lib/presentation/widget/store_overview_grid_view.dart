import 'package:art_core/art_core.dart';
import 'package:home/presentation/widget/store_overview_item.dart';

class StoreOverviewGridView extends StatefulWidget {
  const StoreOverviewGridView({super.key});

  @override
  State<StoreOverviewGridView> createState() => _StoreOverviewGridViewState();
}

class _StoreOverviewGridViewState extends State<StoreOverviewGridView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: StoreOverviewItem(title: 'Total Sales', value: 'IQD 54,648.00', icon: "assets/images/Icon1.svg", iconColor: Colors.blue, change: '18%')),
            const SizedBox(
              width: 16,
            ),
            Expanded(child: StoreOverviewItem(title: 'Net Profit', value: 'IQD 29,136.58', icon: "assets/images/Icon.svg", iconColor: Colors.green, change: '-07%')),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Expanded(child: StoreOverviewItem(title: 'Products in Stock', value: '114', icon: "assets/images/Icon2.svg", iconColor: Colors.orange, change: '')),
            const SizedBox(
              width: 16,
            ),
            Expanded(child: StoreOverviewItem(title: 'New Customers', value: '563', icon: "assets/images/Icon3.svg", iconColor: Colors.purple, change: '')),
          ],
        )
      ],
    );
  }
}
