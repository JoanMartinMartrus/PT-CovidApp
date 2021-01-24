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
    
    func drawBarChart(confirmed: Int?,
                      recovered: Int?,
                      deaths: Int?,
                      active: Int?){
        
        
        if confirmed == nil && recovered == nil && deaths == nil && active == nil {
            setNoDataSet(barChartView: self.barChartView)
        } else {
            setDataSet(confirmed: confirmed ?? 0, recovered: recovered ?? 0, deaths: deaths ?? 0, active: active ?? 0, barChartView: self.barChartView)
            configureBarChartView()
        }
    }
    
    private func configureBarChartView() {
        
        self.barChartView.xAxis.setLabelCount(4, force: false)
        
        self.barChartView.setScaleEnabled(false)
        self.barChartView.doubleTapToZoomEnabled = false
        self.barChartView.dragEnabled = false
        self.barChartView.pinchZoomEnabled = false
        
        self.barChartView.rightAxis.drawLabelsEnabled = false
        self.barChartView.xAxis.drawLabelsEnabled = false
        self.barChartView.leftAxis.labelFont = UIFont.monospacedDigitSystemFont(ofSize: 6, weight: .regular)
        self.barChartView.xAxis.drawGridLinesEnabled = false
        
        self.barChartView.leftAxis.axisMinimum = 0
        self.barChartView.rightAxis.axisMinimum = 0
        
        self.barChartView.xAxis.labelPosition = .bottom
        
        self.barChartView.legend.enabled = true
        
        self.barChartView.animate(yAxisDuration: 1)
    }

    private func setDataSet(confirmed: Int, recovered: Int, deaths: Int, active: Int, barChartView: BarChartView){
        var dataSets: [BarChartDataSet] = []
        let informationToShow = [confirmed, recovered, deaths, active]
        let colors: [UIColor] = [.systemBlue, .systemGreen, .systemRed, .systemOrange]
        let labels = ["Confirmed","Recovered","Deaths","Active"]
        for i in 0..<informationToShow.count {
            let entry = BarChartDataEntry(x: Double(i), y: Double(informationToShow[i]))
            let dataSet = BarChartDataSet(entries: [entry], label: labels[i])
            dataSet.colors = [colors[i]]
            dataSet.valueTextColor = colors[i]
            dataSets.append(dataSet)
        }
        
        let chartData = BarChartData(dataSets: dataSets)

        barChartView.data = chartData
    }
    
    private func setNoDataSet(barChartView: BarChartView) {
        barChartView.noDataText = "Reports for this day are not available."
        barChartView.noDataFont = UIFont.italicSystemFont(ofSize: 10)
        barChartView.noDataTextColor = .darkGray
        barChartView.noDataTextAlignment = .center
        barChartView.data = nil
    }
    
    private func configureCell(){
        cellView.roundAndShadowView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
    }
}

