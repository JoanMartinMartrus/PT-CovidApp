//
//  CountryDetailInteractor.swift
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

protocol CountryDetailBusinessLogic
{
    func getCountryInfo(countryName: String, date: String)
}

class CountryDetailInteractor: CountryDetailBusinessLogic
{
    
    var presenter: CountryDetailPresentationLogic?
    
    func getCountryInfo(countryName: String, date: String) {
        NetworkDispatcher.request(endpoint: CovidInfoEndpoint.getCountryInfo(countryName: countryName, date: date)) { (result: Result<[CountryCovidReportResponse], Error>) in
            switch result {
            case .success(let response):
                guard let report = response.first else { return }
                self.presenter?.onDataLoadSucced(countryCovidReport: report)
            case .failure(let error):
                self.presenter?.onDataLoadFailed(error: error)
            }
        }
    }
    
  
}
