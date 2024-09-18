// Copyright 2018 the Charts project authors. Please see the AUTHORS file
// for details.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

/// Example of a bar chart with domain selection A11y behavior.
///
/// The OS screen reader (TalkBack / VoiceOver) setting must be turned on, or
/// the behavior does not do anything.
///
/// Note that the screenshot does not show any visual differences but when the
/// OS screen reader is enabled, the node that is being read out loud will be
/// surrounded by a rectangle.
///
/// When [charts.DomainA11yExploreBehavior] is added to the chart, the chart
/// will listen for the gesture that triggers "explore mode".
/// "Explore mode" creates semantic nodes for each domain value in the chart
/// with a description (customizable, defaults to domain value) and a bounding
/// box that surrounds the domain.
///
/// These semantic node descriptions are read out loud by the OS screen reader
/// when the user taps within the bounding box, or when the user cycles through
/// the screen's elements (such as swiping left and right).
library;

// EXCLUDE_FROM_GALLERY_DOCS_START
import 'dart:math';

import 'package:flutter/material.dart';
// EXCLUDE_FROM_GALLERY_DOCS_END
import 'package:nimble_charts/flutter.dart' as charts;

class DomainA11yExploreBarChart extends StatelessWidget {
  const DomainA11yExploreBarChart(
    this.seriesList, {
    super.key,
    this.animate = false,
  });

  /// Creates a [charts.BarChart] with sample data and no transition.
  factory DomainA11yExploreBarChart.withSampleData() =>
      DomainA11yExploreBarChart(
        _createSampleData(),
    );
    );
  }
      );
  }

  // EXCLUDE_FROM_GALLERY_DOCS_START
  // This section is excluded from being copied to the gallery.
  // It is used for creating random series data to demonstrate animation in
  // the example app only.
  factory DomainA11yExploreBarChart.withRandomData() =>
      DomainA11yExploreBarChart(_createRandomData());
  final List<charts.Series<dynamic, String>> seriesList;
  final bool animate;

  /// Create random data.
  List<charts.Series<OrdinalSales, String>> _createRandomData() {
    final random = Random();

    final mobileData = [
      OrdinalSales('2014', random.nextInt(100)),
      OrdinalSales('2015', random.nextInt(100)),
      OrdinalSales('2016', random.nextInt(100)),
      OrdinalSales('2017', random.nextInt(100)),
    ];

    final tabletData = [
      // Purposely missing data to show that only measures that are available
      // are vocalized.
      OrdinalSales('2016', random.nextInt(100)),
      OrdinalSales('2017', random.nextInt(100)),
    ];

    return [
      charts.Series<OrdinalSales, String>(
        id: 'Mobile Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (sales, _) => sales.year,
        measureFn: (sales, _) => sales.sales,
        data: mobileData,
      ),
      charts.Series<OrdinalSales, String>(
        id: 'Tablet Sales',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (sales, _) => sales.year,
        measureFn: (sales, _) => sales.sales,
        data: tabletData,
      ),
    ];
  }
  // EXCLUDE_FROM_GALLERY_DOCS_END

  /// An example of how to generate a customized vocalization for
  /// [charts.DomainA11yExploreBehavior] from a list of [charts.SeriesDatum]s.
  ///
  /// The list of series datums is for one domain.
  ///
  /// This example vocalizes the domain, then for each series that has that
  /// domain, it vocalizes the series display name and the measure and a
  /// description of that measure.
  String vocalizeDomainAndMeasures(List<charts.SeriesDatum> seriesDatums) {
    final buffer = new StringBuffer();

    // The datum's type in this case is [OrdinalSales].
    // So we can access year and sales information here.
    buffer.write(seriesDatums.first.datum.year);

    for (final seriesDatum in seriesDatums) {
      final series = seriesDatum.series;
      final datum = seriesDatum.datum;

      buffer.write(' ${series.displayName} '
          '${datum.sales / 1000} thousand dollars');
    }

    return buffer.toString();
  }

  @override
  Widget build(BuildContext context) => Semantics(
        // Describe your chart
        label: 'Yearly sales bar chart',
        // Optionally provide a hint for the user to know how to trigger
        // explore mode.
        hint: 'Press and hold to enable explore',
        child: charts.BarChart(
          seriesList,
          animate: animate,
          // To prevent conflict with the select nearest behavior that uses the
          // tap gesture, turn off default interactions when the user is using
          // an accessibility service like TalkBack or VoiceOver to interact
          // with the application.
          defaultInteractions: !MediaQuery.of(context).accessibleNavigation,
          behaviors: [
            charts.DomainA11yExploreBehavior(
              // Callback for generating the message that is vocalized.
              // An example of how to use is in [vocalizeDomainAndMeasures].
              // If none is set, the default only vocalizes the domain value.
              vocalizationCallback: vocalizeDomainAndMeasures,
              // The following settings are optional, but shown here for
              // demonstration purchases.
              // [exploreModeTrigger] Default is press and hold, can be
              // changed to tap.
              exploreModeTrigger: charts.ExploreModeTrigger.pressHold,
              // [exploreModeEnabledAnnouncement] Optionally notify the OS
              // when explore mode is enabled.
              exploreModeEnabledAnnouncement: 'Explore mode enabled',
              // [exploreModeDisabledAnnouncement] Optionally notify the OS
              // when explore mode is disabled.
              exploreModeDisabledAnnouncement: 'Explore mode disabled',
              // [minimumWidth] Default and minimum is 1.0. This is the
              // minimum width of the screen reader bounding box. The bounding
              // box width is calculated based on the domain axis step size.
              // Minimum width will be used if the step size is smaller.
              minimumWidth: 1,
            ),
            // Optionally include domain highlighter as a behavior.
            // This behavior is included in this example to show that when an
            // a11y node has focus, the chart's internal selection model is
            // also updated.
            charts.DomainHighlighter(),
          ],
        ),
      );

  /// Create one series with sample hard coded data.
  List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final mobileData = [
      OrdinalSales('2014', 5),
      OrdinalSales('2015', 25),
      OrdinalSales('2016', 100),
      OrdinalSales('2017', 75),
    ];

    final tabletData = [
      // Purposely missing data to show that only measures that are available
      // are vocalized.
      OrdinalSales('2016', 25),
      OrdinalSales('2017', 50),
    ];

    return [
      charts.Series<OrdinalSales, String>(
        id: 'Mobile Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (sales, _) => sales.year,
        measureFn: (sales, _) => sales.sales,
        data: mobileData,
      ),
      charts.Series<OrdinalSales, String>(
        id: 'Tablet Sales',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (sales, _) => sales.year,
        measureFn: (sales, _) => sales.sales,
        data: tabletData,
      ),
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  OrdinalSales(this.year, this.sales);
  final String year;
  final int sales;
}
