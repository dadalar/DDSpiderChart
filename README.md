# DDSpiderChart

[![CI Status](http://img.shields.io/travis/dadalar/DDSpiderChart.svg?style=flat)](https://travis-ci.org/dadalar/DDSpiderChart)
[![Version](https://img.shields.io/cocoapods/v/DDSpiderChart.svg?style=flat)](http://cocoapods.org/pods/DDSpiderChart)
[![License](https://img.shields.io/cocoapods/l/DDSpiderChart.svg?style=flat)](http://cocoapods.org/pods/DDSpiderChart)
[![Platform](https://img.shields.io/cocoapods/p/DDSpiderChart.svg?style=flat)](http://cocoapods.org/pods/DDSpiderChart)

Easy to use Spider (Radar) Chart library for iOS written in Swift.

<p align="center">
<img src="https://raw.githubusercontent.com/dadalar/DDSpiderChart/master/Screenshots/sample1.png" width="280"><img src="https://raw.githubusercontent.com/dadalar/DDSpiderChart/master/Screenshots/sample2.png" width="280">
<img src="https://raw.githubusercontent.com/dadalar/DDSpiderChart/master/Screenshots/sample3.png" width="280">
</p>

## Requirements

- iOS 8.0+ / macOS 10.10+ / tvOS 9.0+ / watchOS 2.0+
- Xcode 8.0+
- Swift 3.0+

## Installation

### CocoaPods

DDSpiderChart is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "DDSpiderChart"
```

## Usage

### Styling in Interface Builder

You can use DDSpiderChartView within Interface Builder. Just drag & drop a UIView and set its class to DDSpiderChartView. The library supports IBDesignable protocol, so you will see your customized chart in Xcode. 

<img src="https://raw.githubusercontent.com/dadalar/DDSpiderChart/master/Screenshots/interface_builder.png" width="400">

### Programmatically

To create a new instance of the chart:
```swift
let spiderChartView = DDSpiderChartView(frame: .zero) // Replace with some frame or add constraints
spiderChartView.axes = ["Axis 1", "Axis 2", "Axis 3", "Axis 4"] // Set axes by giving their labels
spiderChartView.addDataSet(values: [1.0, 0.5, 0.75, 0.6], color: .red) // Add first data set
spiderChartView.addDataSet(values: [0.9, 0.7, 0.75, 0.7], color: .blue) // Add second data set
```

To remove a data set from chart:
```swift
let dataSet1 = spiderChartView.addDataSet(values: [0.9, 0.7, 0.75, 0.7], color: .blue) // Add second data set
// Later
spiderChartView.removeDataSetView(dataSet!)
```

Customization:
```swift
spiderChartView.color = .white // This will change the color of the circles
spiderChartView.circleCount = 20 // How many circles there will be
spiderChartView.circleGap = 5 // The distance between circles
// circleCount * circleGap would be the radius of the chart itself
```

Text Styling: (It just works by passing an array of NSAttributedString's as axes. You have a lot flexibility this way.)
```swift
// Custom font with custom size & color example
func attributedAxisLabel(_ label: String) -> NSAttributedString {
  let attributedString = NSMutableAttributedString()
  attributedString.append(NSAttributedString(string: label, attributes: [NSAttributedStringKey.foregroundColor: UIColor.black, NSAttributedStringKey.font: UIFont(name: "AvenirNextCondensed-Bold", size: 16)!]))
  return attributedString
}
    
override func viewDidLoad() {
  super.viewDidLoad()
  spiderChartView.axes = ["PAS", "DRI", "SPD", "DEF", "PHY", "SHT"].map { attributedAxisLabel($0) }
}
```

## Author

Deniz Adalar, me@dadalar.net

## License

DDSpiderChart is available under the MIT license. See the LICENSE file for more info.
