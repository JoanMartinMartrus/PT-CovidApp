//
//   CountryCovidInfoCellViewModel.swift
//   CovidApp
//
//   Creado por Joan Martin Martrus el 21/01/2021.
//   Copyright (c) 2021 ___ORGANIZATIONNAME___. Todos los derechos reservados.

import Foundation
internal final class CountryCovidInfoCellViewModel {
    var countryName: String
    var totalDeaths: Int
    var countryCovidInfo: CountryCovidInfoResponse
    init(countryCovidInfo: CountryCovidInfoResponse) {
        self.countryName = countryCovidInfo.country ?? ""
        self.totalDeaths = countryCovidInfo.deaths ?? 0
        self.countryCovidInfo = countryCovidInfo
    }
}

// MARK: - DrawerItemProtocol -

extension CountryCovidInfoCellViewModel: DrawerItemProtocol {
    var cellDrawer: CellDrawerProtocol {
        return CountryCovidInfoCellDrawer()
    }
}
