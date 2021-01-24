//
//  CountryDetailPresenter.swift
//  CovidApp
//
//  Created by Joan Martin Martrus on 22/01/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol CountryDetailPresentationLogic
{
    func onDataLoadSucced(countryCovidReport: CountryCovidReportResponse)
    func onDataLoadFailed(error: Error)
}

class CountryDetailPresenter: CountryDetailPresentationLogic
{

    weak var viewController: CountryDetailDisplayLogic?
  
    func onDataLoadSucced(countryCovidReport: CountryCovidReportResponse) {
        var cellsModels: [CollectionDrawerItemProtocol] = []
        countryCovidReport.provinces?.forEach({ (province) in
            cellsModels.append(ProvinceDetailViewModel.init(provinceName: province.province ?? "" ,
                                                           confirmed: province.confirmed,
                                                           recovered: province.recovered ,
                                                           deaths: province.deaths,
                                                           active: province.active))
        })
        
        viewController?.showData(cellsModels: cellsModels)
    }
    
    func onDataLoadFailed(error: Error) {
        viewController?.showError(error: error)
    }
}
