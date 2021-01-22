//
//   CountryCovidInfoCellDrawer.swift
//   CovidApp
//
//   Creado por Joan Martin Martrus el 21/01/2021.
//   Copyright (c) 2021 ___ORGANIZATIONNAME___. Todos los derechos reservados.

import UIKit

internal final class CountryCovidInfoCellDrawer: CellDrawerProtocol {
    func dequeueCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(UINib(nibName: CountryCovidInfoCellCell.cellIdentifier(), bundle: nil), forCellReuseIdentifier: CountryCovidInfoCellCell.cellIdentifier())
        
        return tableView.dequeueReusableCell(withIdentifier: CountryCovidInfoCellCell.cellIdentifier(), for: indexPath)
    }
    
    func drawCell(_ cell: UITableViewCell, withItem item: Any, delegate: Any? = nil, at indexPath: IndexPath? = nil) {
        guard let cell = cell as? CountryCovidInfoCellCell, let cellVM = item as? CountryCovidInfoCellViewModel else {
            return
        }
        
        cell.configureCell()
        cell.setCountryName(name: cellVM.countryName)
        cell.setTotalNumberOfDeaths(numberOfDeaths: cellVM.totalDeaths)   
    }
}

