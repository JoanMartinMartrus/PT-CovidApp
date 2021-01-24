//
//   ProvinceDetailViewModel.swift
//   CovidApp
//
//   Creado por Joan Martin Martrus el 23/01/2021.
//   Copyright (c) 2021 ___ORGANIZATIONNAME___. Todos los derechos reservados.

import Foundation
internal final class ProvinceDetailViewModel {
    var provinceName: String
    var confirmed: Int?
    var recovered: Int?
    var deaths: Int?
    var active: Int?

    init(provinceName: String,
         confirmed: Int?,
         recovered: Int?,
         deaths: Int?,
         active: Int?) {
        self.provinceName = provinceName
        self.confirmed = confirmed
        self.recovered = recovered
        self.deaths = deaths
        self.active = active
    }
}

// MARK: - DrawerItemProtocol -

extension ProvinceDetailViewModel: CollectionDrawerItemProtocol {
    var collectionDrawer: CollectionDrawerProtocol {
        return ProvinceDetailDrawer()
    }
}
