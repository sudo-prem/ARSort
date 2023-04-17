import SwiftUI
import Foundation


struct ChartData {
    static var NSquareChartData: [ChartPoints] {
        var points: [ChartPoints] = []
        var curr: Float = 1.0
        
        for i in 0..<11 {
            points.append(.init(id: .init(ChartPoints.self), size: i, time: curr*curr))
            curr = curr + 1
        }
        
        return points
    }
    
    static var NChartData: [ChartPoints] {
        var points: [ChartPoints] = []
        var curr: Float = 1.0
        
        for i in 0..<28 {
            points.append(.init(id: .init(ChartPoints.self), size: i, time: curr))
            curr = curr + 1
        }
        
        return points
    }
    
    static var NLogNChartData: [ChartPoints] {
        var points: [ChartPoints] = []
        var curr: Float = 1.0
        
        for i in 0..<28 {
            points.append(.init(id: .init(ChartPoints.self), size: i, time: curr * log10(curr)))
            curr = curr + 1
        }
        
        return points
    }
    
    static var LogNChartData: [ChartPoints] {
        var points: [ChartPoints] = []
        var curr: Float = 1.0
        
        for i in 0..<28 {
            points.append(.init(id: .init(ChartPoints.self), size: i, time: log2(curr)))
            curr = curr + 1
        }
        
        return points
    }
    
    static var ConstantChartData: [ChartPoints] {
        var points: [ChartPoints] = []
        
        for i in 0..<28 {
            points.append(.init(id: .init(ChartPoints.self), size: i, time: 7.0))
        }
        
        return points
    }
}
