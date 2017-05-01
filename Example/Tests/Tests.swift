import UIKit
import XCTest
@testable import DDSpiderChart

class Tests: XCTestCase {

    var spiderChartView: DDSpiderChartView!

    override func setUp() {
        super.setUp()

        spiderChartView = DDSpiderChartView(frame: .zero)
    }
    
    override func tearDown() {
        spiderChartView = nil
        super.tearDown()
    }
    
    func testDataSetViews() {
        spiderChartView.axes = ["Axis 1", "Axis 2"]

        // On the initial state, we shouldn't have any inner views yet
        XCTAssertEqual(spiderChartView.views.count, 0)

        let v1 = spiderChartView.addDataSet(values: [1.0, 0.5], color: .white, animated: false)!
        XCTAssertEqual(spiderChartView.views, [v1])

        let v2 = spiderChartView.addDataSet(values: [0.3, 0.5], color: .red, animated: false)!
        XCTAssertEqual(spiderChartView.views, [v1, v2])

        let v3 = spiderChartView.addDataSet(values: [0.3, 0.5], color: .brown, animated: false)
        XCTAssertEqual(spiderChartView.views, [v1, v2, v3!])
        spiderChartView.removeDataSetView(v3!)
        XCTAssertEqual(spiderChartView.views, [v1, v2])
    }

    func testInvalidInput() {
        spiderChartView.axes = ["Axis 1"]
        XCTAssertEqual(spiderChartView.views.count, 0)

        spiderChartView.addDataSet(values: [1, 0], color: .white, animated: false) // 2 values for 1 axis is no good
        XCTAssertEqual(spiderChartView.views.count, 0)
    }

    func testViewSize() {
        spiderChartView.circleCount = 10
        spiderChartView.circleGap = 10
        XCTAssertGreaterThan(spiderChartView.intrinsicContentSize.height, 200)
        XCTAssertGreaterThan(spiderChartView.intrinsicContentSize.width, 200)
    }

}
