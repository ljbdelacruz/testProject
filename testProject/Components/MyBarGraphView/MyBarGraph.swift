//
//  MyBarGraph.swift
//  testProject
//
//  Created by devops on 15/08/2019.
//  Copyright © 2019 devops. All rights reserved.
//

import UIKit
import Charts

class MyBarGraph: UIView {
    public let xibname:String="MyBarGraph";
    @IBOutlet var cView: UIView!
    @IBOutlet weak var barGraph: BarChartView!
    
    override public init(frame: CGRect){
        super.init(frame: frame)
        commonInit()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    public func commonInit() {
        Bundle.main.loadNibNamed(xibname, owner: self, options: nil)
        cView.fixInView(self)
    }
    func setData(vm:MyBarGraphViewModel, formatter:IValueFormatter){
        self.setupBarChart(barChart: self.barGraph);
        self.barChartUpdate(self.barGraph, vm:vm, formatter: formatter);
    }
    
}


extension MyBarGraph{
    func setupBarChart(barChart:BarChartView){
        barChart.minOffset = 0.50
        barChart.noDataText = "No transactions to display."
        barChart.chartDescription?.enabled =  false
        barChart.backgroundColor = UIColor.black
        
        let legend = barChart.legend
        legend.enabled = true
        legend.horizontalAlignment = .left
        legend.verticalAlignment = .top
        legend.orientation = .horizontal
        legend.drawInside = true
        legend.yOffset = 18.0
        legend.xOffset = 18.0
        legend.formSize = 22.0
        legend.textColor = UIColor.white
        
        let xaxis = barChart.xAxis
        xaxis.drawGridLinesEnabled = false
        xaxis.labelPosition = .bottom
        xaxis.centerAxisLabelsEnabled = true
        xaxis.granularity = 1
        xaxis.labelTextColor = UIColor.white
        
        let leftAxisFormatter = NumberFormatter()
        leftAxisFormatter.maximumFractionDigits = 1
        
        barChart.scaleXEnabled = true
        barChart.setScaleMinima(2.0, scaleY: 0)
        
        barChart.leftAxis.drawGridLinesEnabled = false
        barChart.leftAxis.enabled = false
        barChart.rightAxis.enabled = false
        barChart.pinchZoomEnabled = false
        barChart.drawValueAboveBarEnabled = true
        barChart.leftAxis.axisMinimum = 0
        
        barChart.notifyDataSetChanged()
        
        // height offset, para di lumagpas yung bar sa graph
        barChart.extraTopOffset = 40.0
        barChart.extraBottomOffset = 5.0
    }
    func barChartUpdate(_ barChart: BarChartView, vm:MyBarGraphViewModel, formatter:IValueFormatter) {
        var charDataSets:[BarChartDataSet]=[]
        for i in 0 ..< vm.fields.count{
            
            let set=vm.fields[i].content!.createBarCharDataEntry(label: vm.fields[i].fieldNames!, formatter: self)
            charDataSets.append(set)
        }
        vm.setupBarChart(barChart: self.barGraph, dataSets: charDataSets)
    }
}




extension MyBarGraph: IValueFormatter {
    func stringForValue(_ value: Double, entry: ChartDataEntry, dataSetIndex: Int, viewPortHandler: ViewPortHandler?) -> String {
        return String(String(value).characters.dropLast().dropLast())
    }
    
}



//MARK: Sample Data
extension MyBarGraph{
    static func initDummyData()->MyBarGraphViewModel{
        let tempVM=MyBarGraphViewModel();
        tempVM.labels=["Jan", "Feb", "Mar", "Apr"];
        let temp=MyBarGraphFieldsViewModel();
        temp.fieldNames="Nintendo Switch";
        temp.content=MyBarGraphContentViewModel();
        temp.content!.numbers=[0.2,2,1,3]
        temp.content!.barColor=UIColor.red;
        tempVM.fields.append(temp);
        
        let temp2=MyBarGraphFieldsViewModel();
        temp2.fieldNames="PS4";
        temp2.content=MyBarGraphContentViewModel();
        temp2.content!.numbers=[1,1,1,4]
        temp2.content!.barColor=UIColor.blue;
        tempVM.fields.append(temp2);
        
        
//        let temp3=MyBarGraphFieldsViewModel();
//        temp3.fieldNames="Xbox One";
//        temp3.content=MyBarGraphContentViewModel();
//        temp3.content!.numbers=[2,3,1,0]
//        temp3.content!.barColor=UIColor.green;
//        tempVM.fields.append(temp3);
        return tempVM;
        
    }
}
