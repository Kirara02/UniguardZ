import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistorySection extends ConsumerStatefulWidget {
  const HistorySection({super.key});

  @override
  ConsumerState<HistorySection> createState() => _HistorySectionState();
}

class _HistorySectionState extends ConsumerState<HistorySection> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  void _switchPage(int pageIndex) {
    setState(() {
      _currentPage = pageIndex;
    });
    _pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _switchPage(0),
              style: ElevatedButton.styleFrom(
                backgroundColor: _currentPage == 0 ? Colors.blue : Colors.grey,
              ),
              child: const Text("Uploaded"),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () => _switchPage(1),
              style: ElevatedButton.styleFrom(
                backgroundColor: _currentPage == 1 ? Colors.blue : Colors.grey,
              ),
              child: const Text("Pending"),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Expanded(
          child: PageView(
            controller: _pageController,
            onPageChanged: (pageIndex) {
              setState(() {
                _currentPage = pageIndex;
              });
            },
            children: const [
              Center(child: Text("Uploaded Page")),
              Center(child: Text("Pending Page")),
            ],
          ),
        ),
      ],
    );
  }
}
