//
//   CountryCovidInfoCellCell.swift
//   CovidApp
//
//   Creado por Joan Martin Martrus el 21/01/2021.
//   Copyright (c) 2021 ___ORGANIZATIONNAME___. Todos los derechos reservados.

import UIKit

class CountryCovidInfoCellCell: UITableViewCell, GetCellIdentifierProtocol {
    
    // MARK: - IBOutlets
    
    @IBOutlet var countryNameLabel: UILabel!
    @IBOutlet var totalNumberOfDeathsLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    // MARK: - Internal Methods -
    
    func setCountryName(name: String) {
        countryNameLabel.text = name
    }
    
    func setTotalNumberOfDeaths(numberOfDeaths: Int) {
        totalNumberOfDeathsLabel.text = "\(numberOfDeaths)"
    }
    
}
