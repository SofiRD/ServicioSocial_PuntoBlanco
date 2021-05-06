//
//  Estadisticas.swift
//  PuntoBlanco_v_0.0.1
//
//  Created by user179426 on 10/18/20.
//
import UIKit
import Charts
import Firebase

class Estadisticas: UIViewController, ChartViewDelegate {
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var contentView: UIView!
    
    var barChart = BarChartView()
    var userReference :DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        barChart.delegate = self
        scrollView.contentSize = barChart.frame.size
        scrollView.addSubview(barChart)
        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewDidLayoutSubviews() {
        print("estadisticas:")
        print(userReference)
        super.viewDidLayoutSubviews()
        barChart.frame = CGRect(x: 0, y: 0, width: self.scrollView.frame.size.width, height: self.scrollView.frame.size.height)
        
        //barChart.center = view.center
        
        
        var entries = [BarChartDataEntry]()
        
        for x in 0...10 {
            entries.append(BarChartDataEntry(x: Double(x), y: Double(x)))
        }
        
        let set = BarChartDataSet( entries: entries )
        set.colors = ChartColorTemplates.joyful()
        
        let data = BarChartData(dataSet: set)
        barChart.data = data
        
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
