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
    @IBOutlet var cellView: UIView!
    
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
        let colors: [UIColor] = [.systemBlue, .systemGreen, .systemRed, .systemOrange]
        var entries: [BarChartDataEntry] = []
        
        for i in 0..<informationToShow.count {
            entries.append(BarChartDataEntry(x: Double(i), y: Double(informationToShow[i])))
        }
        
        let dataSet = BarChartDataSet(entries)
        
        dataSet.colors = colors
            
        let chartData = BarChartData(dataSet: dataSet)
        
        barChartView.setScaleEnabled(false)
        barChartView.doubleTapToZoomEnabled = false
        barChartView.dragEnabled = false
        barChartView.pinchZoomEnabled = false
        barChartView.rightAxis.drawLabelsEnabled = false
        barChartView.leftAxis.drawLabelsEnabled = false
        barChartView.leftAxis.axisMinimum = 0
        barChartView.rightAxis.axisMinimum = 0
        barChartView.xAxis.drawGridLinesEnabled = false
        barChartView.xAxis.labelPosition = .bottom
        barChartView.xAxis.setLabelCount(informationToShow.count, force: false)
        barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: labelInformationToShow)
        barChartView.xAxis.labelRotationAngle = -90
        barChartView.xAxis.labelFont = UIFont(name: "Helvetica Neue", size: 10) ?? UIFont()
        barChartView.legend.enabled = false
        barChartView.animate(yAxisDuration: 2.0)
        
        barChartView.data = chartData
    }
    
    private func configureCell(){
        cellView.roundAndShadowView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
    }
}

