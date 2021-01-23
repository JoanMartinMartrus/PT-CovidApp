//
//   ProvinceDetailCell.swift
//   CovidApp
//
//   Creado por Joan Martin Martrus el 23/01/2021.
//   Copyright (c) 2021 ___ORGANIZATIONNAME___. Todos los derechos reservados.
//

import UIKit
import Charts

class ProvinceDetailCell: UICollectionViewCell, GetCollectionIdentifierProtocol {

    // MARK: - IBOutlets -
    @IBOutlet var provinceNameLabel: UILabel!
    @IBOutlet var barChartView: BarChartView!
    
    // MARK: - Internal Methods -
    
    func setProvinceNameLabel(provinceName: String) {
        provinceNameLabel.text = provinceName
    }
    
    func drawBarChart(confirmed: Int,
                      recovered: Int,
                      deaths: Int,
                      active: Int){
        
        let informationToShow = [confirmed, recovered, deaths, active]
        let labelInformationToShow = ["confirmed", "recovered", "deaths", "active"]
        var entries: [BarChartDataEntry] = []
        
        for i in 0..<informationToShow.count {
            entries.append(BarChartDataEntry(x: Double(i), y: Double(informationToShow[i])))
        }
        
        let dataSet = BarChartDataSet(entries)
            
        let chartData = BarChartData(dataSet: dataSet)
                
        barChartView.rightAxis.drawLabelsEnabled = false
        barChartView.leftAxis.drawLabelsEnabled = false
        barChartView.xAxis.labelPosition = .bottom
        barChartView.xAxis.setLabelCount(informationToShow.count, force: false)
        barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: labelInformationToShow)
        barChartView.xAxis.labelRotationAngle = -90
        barChartView.xAxis.labelFont = UIFont(name: "Helvetica Neue", size: 7) ?? UIFont()
        barChartView.legend.enabled = false
        
        barChartView.data = chartData
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
