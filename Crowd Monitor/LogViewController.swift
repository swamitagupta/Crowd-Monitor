//
//  LogViewController.swift
//  Crowd Monitor
//
//  Created by Swamita on 19/03/21.
//

import UIKit
import Charts

class LogViewController: UIViewController {

    @IBOutlet weak var pieChartView: PieChartView!
    @IBOutlet weak var barChartView: BarChartView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    let players = ["10-12pm","12-2pm", "2-4pm", "4-6pm", "6-8pm", "8-10pm"]
    let goals = [6, 15, 26, 30, 8, 10]
    let tomgoals = [4,10,13,22,19,5]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizePieChart(dataPoints: players, values: goals.map{ Double($0) })
        customizeBarChart(dataPoints: players, values: goals.map{ Double($0) })
        
    }
    
    @IBAction func segmentChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex
            {
            case 0:
                customizePieChart(dataPoints: players, values: goals.map{ Double($0) })
                customizeBarChart(dataPoints: players, values: goals.map{ Double($0) })
            case 1:
                customizePieChart(dataPoints: players, values: tomgoals.map{ Double($0) })
                customizeBarChart(dataPoints: players, values: tomgoals.map{ Double($0) })
            default:
                break
            }
    }
    func customizePieChart(dataPoints: [String], values: [Double]) {
        
        var dataEntries: [ChartDataEntry] = []
          for i in 0..<dataPoints.count {
            let dataEntry = PieChartDataEntry(value: values[i], label: dataPoints[i], data: dataPoints[i] as AnyObject)
            dataEntries.append(dataEntry)
          }
        
        let pieChartDataSet = PieChartDataSet(entries: dataEntries, label: nil)
        pieChartDataSet.colors = ChartColorTemplates.material()
          
          let pieChartData = PieChartData(dataSet: pieChartDataSet)
          let format = NumberFormatter()
          format.numberStyle = .none
          let formatter = DefaultValueFormatter(formatter: format)
          pieChartData.setValueFormatter(formatter)
          
          pieChartView.data = pieChartData
    }
    
    func customizeBarChart(dataPoints: [String], values: [Double]) {
          // TO-DO: customize the chart here
        var dataEntries: [BarChartDataEntry] = []
        for i in 0..<dataPoints.count {
          let dataEntry = BarChartDataEntry(x: Double(i), y: Double(values[i]))
          dataEntries.append(dataEntry)
        }
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Count")
        chartDataSet.colors = ChartColorTemplates.material()
        let chartData = BarChartData(dataSet: chartDataSet)
        barChartView.data = chartData
    }
    
    private func colorsOfCharts(numbersOfColor: Int) -> [UIColor] {
      var colors: [UIColor] = []
      for _ in 0..<numbersOfColor {
        let red = Double(arc4random_uniform(256))
        let green = Double(arc4random_uniform(256))
        let blue = Double(arc4random_uniform(256))
        let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
        colors.append(color)
      }
      return colors
    }
}
