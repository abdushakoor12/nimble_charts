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

import 'package:example/bar_chart/custom_rounded_bars.dart';
import 'package:example/bar_chart/grouped.dart';
import 'package:example/bar_chart/grouped_fill_color.dart';
import 'package:example/bar_chart/grouped_single_target_line.dart';
import 'package:example/bar_chart/grouped_stacked.dart';
import 'package:example/bar_chart/grouped_stacked_weight_pattern.dart';
import 'package:example/bar_chart/grouped_target_line.dart';
import 'package:example/bar_chart/horizontal.dart';
import 'package:example/bar_chart/horizontal_bar_label.dart';
import 'package:example/bar_chart/horizontal_bar_label_custom.dart';
import 'package:example/bar_chart/horizontal_pattern_forward_hatch.dart';
import 'package:example/bar_chart/pattern_forward_hatch.dart';
import 'package:example/bar_chart/simple.dart';
import 'package:example/bar_chart/spark_bar.dart';
import 'package:example/bar_chart/stacked.dart';
import 'package:example/bar_chart/stacked_fill_color.dart';
import 'package:example/bar_chart/stacked_horizontal.dart';
import 'package:example/bar_chart/stacked_target_line.dart';
import 'package:example/bar_chart/vertical_bar_label.dart';
import 'package:example/gallery_scaffold.dart';
import 'package:example/main.dart' as m;
import 'package:flutter/material.dart';

const simpleBarChartTileTitle = 'Simple Bar Chart';
const stackedBarChartTileTitle = 'Stacked Bar Chart';
const groupedBarChartTileTitle = 'Grouped Bar Chart';

List<GalleryScaffold> buildGallery() => [
      GalleryScaffold(
        listTileIcon: const Icon(Icons.insert_chart),
        title: simpleBarChartTileTitle,
        subtitle: 'Simple bar chart with a single series',
        childBuilder: () => m.useRandomData
            ? SimpleBarChart.withRandomData()
            : SimpleBarChart.withSampleData(),
      ),
      GalleryScaffold(
        listTileIcon: const Icon(Icons.insert_chart),
        title: stackedBarChartTileTitle,
        subtitle: 'Stacked bar chart with multiple series',
        childBuilder: () => m.useRandomData
            ? StackedBarChart.withRandomData()
            : StackedBarChart.withSampleData(),
      ),
      GalleryScaffold(
        listTileIcon: const Icon(Icons.insert_chart),
        title: groupedBarChartTileTitle,
        subtitle: 'Grouped bar chart with multiple series',
        childBuilder: () => m.useRandomData
            ? GroupedBarChart.withRandomData()
            : GroupedBarChart.withSampleData(),
      ),
      const GalleryScaffold(
        listTileIcon: Icon(Icons.insert_chart),
        title: 'Grouped Stacked Bar Chart',
        subtitle: 'Grouped and stacked bar chart with multiple series',
        childBuilder: GroupedStackedBarChart.withRandomData,
      ),
      const GalleryScaffold(
        listTileIcon: Icon(Icons.insert_chart),
        title: 'Grouped Bar Target Line Chart',
        subtitle: 'Grouped bar target line chart with multiple series',
        childBuilder: GroupedBarTargetLineChart.withRandomData,
      ),
      const GalleryScaffold(
        listTileIcon: Icon(Icons.insert_chart),
        title: 'Grouped Bar Single Target Line Chart',
        subtitle:
            'Grouped bar target line chart with multiple series and a single target',
        childBuilder: GroupedBarSingleTargetLineChart.withRandomData,
      ),
      const GalleryScaffold(
        listTileIcon: Icon(Icons.insert_chart),
        title: 'Stacked Bar Target Line Chart',
        subtitle: 'Stacked bar target line chart with multiple series',
        childBuilder: StackedBarTargetLineChart.withRandomData,
      ),
      GalleryScaffold(
        listTileIcon: Transform.rotate(
          angle: 1.5708,
          child: const Icon(Icons.insert_chart),
        ),
        title: 'Horizontal Bar Chart',
        subtitle: 'Horizontal bar chart with a single series',
        childBuilder: HorizontalBarChart.withRandomData,
      ),
      GalleryScaffold(
        listTileIcon: Transform.rotate(
          angle: 1.5708,
          child: const Icon(Icons.insert_chart),
        ),
        title: 'Stacked Horizontal Bar Chart',
        subtitle: 'Stacked horizontal bar chart with multiple series',
        childBuilder: StackedHorizontalBarChart.withRandomData,
      ),
      GalleryScaffold(
        listTileIcon: Transform.rotate(
          angle: 1.5708,
          child: const Icon(Icons.insert_chart),
        ),
        title: 'Horizontal Bar Chart with Bar Labels',
        subtitle: 'Horizontal bar chart with a single series and bar labels',
        childBuilder: HorizontalBarLabelChart.withRandomData,
      ),
      GalleryScaffold(
        listTileIcon: Transform.rotate(
          angle: 1.5708,
          child: const Icon(Icons.insert_chart),
        ),
        title: 'Horizontal Bar Chart with Custom Bar Labels',
        subtitle: 'Bar labels with customized styling',
        childBuilder: HorizontalBarLabelCustomChart.withRandomData,
      ),
      GalleryScaffold(
        listTileIcon: Transform.rotate(
          angle: 1.5708,
          child: const Icon(Icons.insert_chart),
        ),
        title: 'Vertical Bar Chart with Bar Labels',
        subtitle: 'Vertical bar chart with a single series and bar labels',
        childBuilder: VerticalBarLabelChart.withRandomData,
      ),
      const GalleryScaffold(
        listTileIcon: Icon(Icons.insert_chart),
        title: 'Spark Bar Chart',
        subtitle: 'Spark Bar Chart',
        childBuilder: SparkBar.withRandomData,
      ),
      const GalleryScaffold(
        listTileIcon: Icon(Icons.insert_chart),
        title: 'Grouped Fill Color Bar Chart',
        subtitle: 'Grouped bar chart with fill colors',
        childBuilder: GroupedFillColorBarChart.withRandomData,
      ),
      const GalleryScaffold(
        listTileIcon: Icon(Icons.insert_chart),
        title: 'Stacked Fill Color Bar Chart',
        subtitle: 'Stacked bar chart with fill colors',
        childBuilder: StackedFillColorBarChart.withRandomData,
      ),
      const GalleryScaffold(
        listTileIcon: Icon(Icons.insert_chart),
        title: 'Pattern Forward Hatch Bar Chart',
        subtitle: 'Pattern Forward Hatch Bar Chart',
        childBuilder: PatternForwardHatchBarChart.withRandomData,
      ),
      GalleryScaffold(
        listTileIcon: Transform.rotate(
          angle: 1.5708,
          child: const Icon(Icons.insert_chart),
        ),
        title: 'Horizontal Pattern Forward Hatch Bar Chart',
        subtitle: 'Horizontal Pattern Forward Hatch Bar Chart',
        childBuilder: HorizontalPatternForwardHatchBarChart.withRandomData,
      ),
      const GalleryScaffold(
        listTileIcon: Icon(Icons.insert_chart),
        title: 'Weight Pattern Bar Chart',
        subtitle: 'Grouped and stacked bar chart with a weight pattern',
        childBuilder: GroupedStackedWeightPatternBarChart.withRandomData,
      ),
      const GalleryScaffold(
        listTileIcon: Icon(Icons.insert_chart),
        title: 'Bar Chart with custom bar radius',
        subtitle: 'Custom rounded bar corners',
        childBuilder: CustomRoundedBars.withRandomData,
      ),
    ];
