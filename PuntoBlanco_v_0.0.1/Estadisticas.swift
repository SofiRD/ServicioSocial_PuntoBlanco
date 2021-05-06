//
//  Estadisticas.swift
//  PuntoBlanco_v_0.0.1
//
//  Created by user179426 on 10/18/20.
//
import UIKit
import Charts
import Firebase
import FirebaseCore
import FirebaseFirestore

class Estadisticas: UIViewController, ChartViewDelegate {

    var barChart = BarChartView()
    
    var userReference :DatabaseReference!
    var db :DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(self.db.child("Meditaciones"))
        barChart.delegate = self
        
        
    }
    

    
    
    
    override func viewDidLayoutSubviews() {
        print("estadisticas:")
        print(userReference)
        super.viewDidLayoutSubviews()
        barChart.frame = CGRect(x: 5, y: 20, width: self.view.frame.size.width-10, height: self.view.frame.size.height-60)
        
        barChart.center = view.center
        
        view.addSubview(barChart)
        
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
