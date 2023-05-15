//
//  DDSpiderChart.swift
//  DDSpiderChart
//
//  Created by Pablo Ruan on 12/05/23.
//

import Foundation
#if canImport(SwiftUI)
    import SwiftUI
#endif

@available(iOS 14.0.0, *)
public struct DDSpiderChart: UIViewRepresentable {
    
    private let axes: [String]
    private let values: [DDSpiderChartEntries]
    private let color: Color
    private let circleCount: Int
    private let circleGap: CGFloat
    private let endLineCircles: Bool
    private let fontTitle: UIFont
    private let textColor: Color
    
    public init(axes: [String] = [],
                values: [DDSpiderChartEntries] = [],
                color: Color = .gray,
                circleCount: Int = 10,
                circleGap: CGFloat = 10,
                endLineCircles: Bool = true,
                fontTitle: UIFont = .boldSystemFont(ofSize: 16),
                textColor: Color = Color.black) {
        self.axes = axes
        self.values = values
        self.color = color
        self.circleCount = circleCount
        self.circleGap = circleGap
        self.endLineCircles = endLineCircles
        self.fontTitle = fontTitle
        self.textColor = textColor
    }
    
    public func makeUIView(context: Context) -> DDSpiderChartView {
        let chart = DDSpiderChartView()
        chart.backgroundColor = .clear
        return chart
    }
    
    public func updateUIView(_ uiView: DDSpiderChartView, context: Context) {
        uiView.circleCount = circleCount
        uiView.circleGap = circleGap
        uiView.color = UIColor(color)
        uiView.endLineCircles = endLineCircles
        uiView.axes = axes.map { applyStyle($0) }
        values.forEach {
            uiView.addDataSet(values: $0.values, color: UIColor($0.color))
        }
    }
    
    func applyStyle(_ text: String) -> NSAttributedString {
        let attributedString = NSMutableAttributedString()
        let color = UIColor(textColor)
        attributedString.append(
            NSAttributedString(
                string: text,
                attributes: [
                    NSAttributedString.Key.foregroundColor: color,
                    .font: fontTitle
                ]
            )
        )
        return attributedString
    }
}

@available(iOS 14.0, *)
public struct DDSpiderChartEntries {
    var values: [Float]
    var color: Color
    
    public init(values: [Float], color: Color) {
        self.values = values
        self.color = color
    }
}
