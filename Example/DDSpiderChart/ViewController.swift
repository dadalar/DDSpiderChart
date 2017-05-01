//
//  ViewController.swift
//  DDSpiderChart
//
//  Created by dadalar on 05/01/2017.
//  Copyright (c) 2017 dadalar. All rights reserved.
//

import UIKit
import DDSpiderChart

class ViewController: UIViewController {

    @IBOutlet weak var spiderChartView: DDSpiderChartView!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadAxisData(sampleIndex: 0)
    }

    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
        loadAxisData(sampleIndex: sender.selectedSegmentIndex)
    }
    
    // Custom font with custom size & color example
    func attributedAxisLabelSample1(_ label: String) -> NSAttributedString {
        let attributedString = NSMutableAttributedString()
        attributedString.append(NSAttributedString(string: label, attributes: [NSForegroundColorAttributeName: UIColor.black, NSFontAttributeName: UIFont(name: "AvenirNextCondensed-Bold", size: 16)!]))
        return attributedString
    }

    func attributedAxisLabelSample2(_ label: String) -> NSAttributedString {
        let attributedString = NSMutableAttributedString()
        attributedString.append(NSAttributedString(string: label, attributes: [NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: UIFont(name: "AvenirNextCondensed-Bold", size: 16)!]))
        return attributedString
    }

    func loadAxisData(sampleIndex: Int) {
        switch sampleIndex {
        case 0:
            view.backgroundColor = .white
            spiderChartView.color = .gray
            spiderChartView.axes = ["PAS", "DRI", "SPD", "DEF", "PHY", "SHT"].map { attributedAxisLabelSample1($0) }
            spiderChartView.addDataSet(values: [0.6, 0.8, 1.0, 0.6, 0.9, 0.75], color: .red)
            spiderChartView.addDataSet(values: [0.5, 0.4, 0.35, 0.6, 0.7, 0.8], color: .cyan)
        case 1:
            view.backgroundColor = UIColor(white: 0.1, alpha: 1.0)
            spiderChartView.color = UIColor(white: 0.75, alpha: 1.0)
            spiderChartView.axes = ["PAS", "DRI", "SPD", "DEF", "PHY", "SHT"].map { attributedAxisLabelSample2($0) }
            spiderChartView.addDataSet(values: [0.6, 0.8, 1.0, 0.6, 0.9, 0.75], color: .red)
            spiderChartView.addDataSet(values: [0.5, 0.4, 0.35, 0.6, 0.7, 0.8], color: .cyan)
        default:
            view.backgroundColor = .white
            spiderChartView.color = .darkGray
            spiderChartView.axes = ["E-mail", "Facebook", "Twitter", "Instagram", "Pinterest", "Snapchat", "Search\nEngine", "Shopping\nSites", "TV"]
            spiderChartView.addDataSet(values: [0.8, 0.8, 1.0, 0.7, 0.9, 0.75, 1.0, 0.88, 0.92], color: UIColor(red:1.00, green:0.54, blue:0.00, alpha:1.0))
            return
        }
    }

}

