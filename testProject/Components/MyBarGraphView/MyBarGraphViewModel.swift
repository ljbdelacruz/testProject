//
//  MyBarGraphViewModel.swift
//  testProject
//
//  Created by devops on 15/08/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import Charts
import UIKit

class MyBarGraphViewModel{
    var labels:[String]=["January", "February", "March", "April"]
    var fields:[MyBarGraphFieldsViewModel]=[];
    func setupBarChart(barChart:BarChartView, dataSets: [BarChartDataSet]){
        let chartData = BarChartData(dataSets: dataSets)
        let groupSpace = 0.08
        let barSpace = 0.06
        let barWidth = dataSets.count < 3 ? 0.4 : 0.4 - (0.05 * (Double(dataSets.count)))
        chartData.barWidth = barWidth
        barChart.leftAxis.axisMinimum = 0
        barChart.xAxis.valueFormatter = IndexAxisValueFormatter(values: self.labels)
        barChart.xAxis.axisMaximum = Double(10)
        chartData.groupBars(fromX: 0, groupSpace: groupSpace, barSpace: barSpace)
        barChart.data = chartData
        barChart.animate(xAxisDuration: 1.5, yAxisDuration: 1.5, easingOption: .linear)
        
    }
}


class MyBarGraphFieldsViewModel{
    var fieldNames:String?
    var content:MyBarGraphContentViewModel?
}
class MyBarGraphContentViewModel{
    var numbers:[Double]?
    var textColor:UIColor=UIColor.white;
    var fontSize:CGFloat=14;
    var barColor:UIColor=UIColor.red;
    
    
    
    func createBarCharDataEntry(label:String, formatter:IValueFormatter)->BarChartDataSet{
        var list:[BarChartDataEntry]=[];
        for i in 0 ..< numbers!.count{
            let dataEntry = BarChartDataEntry(x: Double(i) , y: numbers![i])
            list.append(dataEntry)
        }
        let set1=BarChartDataSet(values: list, label: label)
        set1.valueFormatter = formatter
        set1.valueFont = UIFont.systemFont(ofSize: 14)
        set1.valueTextColor=UIColor.white;
        set1.colors = [barColor]
        return set1
    }
    
}
