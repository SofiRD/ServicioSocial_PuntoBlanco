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
    @IBOutlet weak var tempnavBar: UINavigationBar!
    
    //var barChart = BarChartView()
    var barChart = LineChartView()

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
        barChart.frame = CGRect(x: 50, y: 100, width: self.scrollView.frame.size.width-100, height: self.scrollView.frame.size.height*0.4)
        
        //barChart.center = view.center
        
        
       // var entries = [BarChartDataEntry]()
        var entries = [ChartDataEntry]()
        
        for x in 0...10 {
            //entries.append(BarChartDataEntry(x: Double(x), y: Double(x)))
            entries.append(ChartDataEntry(x: Double(x), y: Double(x)))
        }
        
        //let set = BarChartDataSet( entries: entries )
        let set = LineChartDataSet( entries: entries )
        set.colors = ChartColorTemplates.joyful()
        
        //let data = BarChartData(dataSet: set)
        let data = LineChartData(dataSet: set)
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
