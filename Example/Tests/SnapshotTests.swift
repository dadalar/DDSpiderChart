import UIKit
import XCTest
import SnapshotTesting
@testable import DDSpiderChart

class SnapshotTests: XCTestCase {
    
    var spiderChartView: DDSpiderChartView!
    
    override func setUp() {
        super.setUp()
        
        spiderChartView = DDSpiderChartView(frame: .init(x: 0, y: 0, width: 400, height: 400))
    }
    
    override func tearDown() {
        spiderChartView = nil
        super.tearDown()
    }
    
    func attributedAxisLabelSample1(_ label: String) -> NSAttributedString {
        let attributedString = NSMutableAttributedString()
        attributedString.append(NSAttributedString(string: label, attributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont(name: "AvenirNextCondensed-Bold", size: 16)!]))
        return attributedString
    }
    
    func attributedAxisLabelSample2(_ label: String) -> NSAttributedString {
        let attributedString = NSMutableAttributedString()
        attributedString.append(NSAttributedString(string: label, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: "AvenirNextCondensed-Bold", size: 16)!]))
        return attributedString
    }
    
    func testExample1() {
        spiderChartView.backgroundColor = .white
        spiderChartView.color = .gray
        spiderChartView.axes = ["PAS", "DRI", "SPD", "DEF", "PHY", "SHT"].map(attributedAxisLabelSample1)
        spiderChartView.addDataSet(values: [0.6, 0.8, 1.0, 0.6, 0.9, 0.75], color: .red)
        spiderChartView.addDataSet(values: [0.5, 0.4, 0.35, 0.6, 0.7, 0.8], color: .cyan)

        assertSnapshot(matching: spiderChartView, as: .image)
    }
    
    func testExample2() {
        spiderChartView.backgroundColor = UIColor(white: 0.1, alpha: 1.0)
        spiderChartView.color = UIColor(white: 0.75, alpha: 1.0)
        spiderChartView.axes = ["PAS", "DRI", "SPD", "DEF", "PHY", "SHT"].map(attributedAxisLabelSample2)
        spiderChartView.addDataSet(values: [0.6, 0.8, 1.0, 0.6, 0.9, 0.75], color: .red)
        spiderChartView.addDataSet(values: [0.5, 0.4, 0.35, 0.6, 0.7, 0.8], color: .cyan)
        
        assertSnapshot(matching: spiderChartView, as: .image)
    }
    
    func testExample3() {
        spiderChartView.backgroundColor = .white
        spiderChartView.color = .darkGray
        spiderChartView.axes = ["E-mail", "Facebook", "Twitter", "Instagram", "Pinterest", "Snapchat", "Search\nEngine", "Shopping\nSites", "TV"]
        spiderChartView.addDataSet(values: [0.8, 0.8, 1.0, 0.7, 0.9, 0.75, 1.0, 0.88, 0.92], color: UIColor(red:1.00, green:0.54, blue:0.00, alpha:1.0))
        
        assertSnapshot(matching: spiderChartView, as: .image)
    }
}
