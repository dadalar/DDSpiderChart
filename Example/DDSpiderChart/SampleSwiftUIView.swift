//
//  SwiftUIView.swift
//  DDSpiderChart
//
//  Created by Pablo Ruan on 12/05/23.
//

#if canImport(SwiftUI)
import SwiftUI
#endif
import DDSpiderChart

@available(iOS 14.0.0, *)
struct SwiftUIView: View {
    @State var currentSample: Sample = .sample1
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .gray
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
    }
    
    var BackgroundColor: Color {
        Color.black
    }
    
    var body: some View {
        ZStack {
            currentSample.bgColor.edgesIgnoringSafeArea(.top)
            VStack {
                ZStack {
                    VStack(spacing: 20) {
                        Text("DDSpiderChart SwiftUI")
                            .foregroundColor(.white)
                            .bold()
                        
                        Picker("", selection: $currentSample) {
                            ForEach(Sample.allCases, id: \.self) { sample in
                                Text(sample.rawValue.capitalized)
                            }
                        }
                        .frame(maxWidth: 300)
                        .pickerStyle(.segmented)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, 50)
                    .padding(.bottom, 20)
                }
                .background(Color.black)
                .edgesIgnoringSafeArea(.top)
                Spacer()
                DDSpiderChart(
                    axes: currentSample.axes,
                    values: currentSample.data,
                    fontTitle: .boldSystemFont(ofSize: 16),
                    textColor: currentSample.titleColor
                ).frame(width: 300, height: 300)
                Spacer()
            }
        }
    }
    
    
    enum Sample: String, CaseIterable {
        case sample1
        case sample2
        case sample3
        
        var data: [DDSpiderChartEntries] {
            switch self {
            case .sample1,
                 .sample2:
                return [
                    DDSpiderChartEntries(values: [0.6, 0.8, 1.0, 0.6, 0.9, 0.75], color: .red),
                    DDSpiderChartEntries(values: [0.5, 0.4, 0.35, 0.6, 0.7, 0.8], color: .accentColor)
                ]
            case .sample3:
                return [
                    DDSpiderChartEntries(values: [0.8, 0.8, 1.0, 0.7, 0.9, 0.75, 1.0, 0.88, 0.92],
                                         color: Color(red:1.00, green:0.54, blue:0.00))
                ]
            }
        }
        
        var axes: [String] {
            switch self {
            case .sample1, .sample2:
                return ["PAS", "DRI", "SPD", "DEF", "PHY", "SHT"]
            case .sample3:
                return ["E-mail", "Facebook", "Twitter", "Instagram", "Pinterest", "Snapchat", "Search\nEngine", "Shopping\nSites", "TV"]
            }
        }
        
        var color: Color {
            switch self {
            case .sample1:
                return .white
            case .sample2:
                return .gray
            case .sample3:
                return .secondary
            }
        }
        
        var titleColor: Color {
            switch self {
            case .sample1:
                return .black
            case .sample2:
                return .white
            case .sample3:
                return .gray
            }
        }
        
        var bgColor: Color {
            switch self {
            case .sample1:
                return .white
            case .sample2:
                return .black.opacity(0.8)
            case .sample3:
                return .white
            }
        }
    }
}

@available(iOS 14.0.0, *)
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
