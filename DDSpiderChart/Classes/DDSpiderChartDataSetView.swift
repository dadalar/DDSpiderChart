//
//  DDSpiderChartDataSetView.swift
//  DDSpiderChart
//
//  Created by dadalar on 05/01/2017.
//  Copyright (c) 2017 dadalar. All rights reserved.
//

import UIKit

final class DDSpiderChartDataSetView: UIView {
    
    var radius: CGFloat {
        didSet {
            setNeedsDisplay()
        }
    }
    var values: [Float] {
        didSet {
            setNeedsDisplay()
        }
    }
    let color: UIColor
    
    init(radius: CGFloat, values: [Float], color: UIColor) {
        self.radius = radius
        self.values = values
        self.color = color
        super.init(frame: .zero)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        for (index, value) in values.enumerated() {
            let angle = CGFloat(-Float.pi / 2) - CGFloat(index) * CGFloat(2 * Float.pi) / CGFloat(values.count)
            let x = center.x + radius * CGFloat(value) * cos(angle)
            let y = center.y + radius * CGFloat(value) * sin(angle)
            let point = CGPoint(x: x, y: y)
            if index == 0 {
                path.move(to: point)
            } else {
                path.addLine(to: point)
            }
        }
        path.close()
        self.color.set()
        path.stroke()
        self.color.withAlphaComponent(0.75).setFill()
        path.fill()
    }
    
}
