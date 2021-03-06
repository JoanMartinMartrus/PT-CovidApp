//
//  SearchCountryViewController.swift
//  CovidApp
//
//  Created by Joan Martin Martrus on 21/01/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol SearchCountryDisplayLogic: class
{
    func showData(cellModels: [DrawerItemProtocol])
    func showError(error: Error)
}

class SearchCountryViewController: BaseViewController, SearchCountryDisplayLogic
{

    var interactor: SearchCountryBusinessLogic?
    var router:  SearchCountryRoutingLogic?
    
    // MARK: IBoutlets
    
    @IBOutlet var tableView: UITableView!
    
    // MARK: Properties
    
    lazy var searchBar:UISearchBar = UISearchBar()
    
    private var cellModels: [DrawerItemProtocol] = []
    private var filteredCellModels: [DrawerItemProtocol] = []
    
    
    // MARK: SearchCountryDisplayLogic protocol implementatios
    
    func showData(cellModels: [DrawerItemProtocol]) {
        self.removeSpinner()
        self.cellModels = cellModels
        self.filteredCellModels = self.cellModels
        tableView.reloadData()
    }
    
    func showError(error: Error) {
        self.removeSpinner()
        self.showErrorAlert(error: error)
    }
    
    // MARK: Object lifecycle
  
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
  
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
  
    // MARK: Setup
  
    private func setup()
    {
        let viewController = self
        let interactor = SearchCountryInteractor()
        let presenter = SearchCountryPresenter()
        let router = SearchCountryRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
    }
  
    // MARK: View lifecycle
  
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        configureNavigationController()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        createSearchBar()
        
    }
    
    private func createSearchBar() {
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = " Search..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = true
        searchBar.backgroundColor = #colorLiteral(red: 0.9762066007, green: 0.7820909023, blue: 0.7772926688, alpha: 1)
        searchBar.delegate = self
        navigationItem.titleView = searchBar
    }
    
    private func configureNavigationController() {
        self.title = "Covid Search"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        beginLoadInfo()
    }
    
    private func beginLoadInfo() {
        self.showSpinner(onView: self.view)
        interactor?.getCountriesCovidInfo()
    }
    

  
}

extension SearchCountryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCellModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = filteredCellModels[indexPath.row]
        let drawer = cellModel.cellDrawer
        let cell = drawer.dequeueCell(tableView, cellForRowAt: indexPath)
        drawer.drawCell(cell, withItem: cellModel, delegate: self, at: indexPath)
        return cell
    }
}

extension SearchCountryViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredCellModels = cellModels.filter { (cellModel) -> Bool in
            return (cellModel as? CountryCovidInfoCellViewModel)?.countryName.lowercased().contains(searchText.lowercased()) ?? false
        }
        if searchText.isEmpty {
            filteredCellModels = cellModels
        }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cellModel = filteredCellModels[indexPath.row] as? CountryCovidInfoCellViewModel {
            router?.navigateToCountryDetailViewController(withParameters: cellModel.countryCovidInfo)
        }
 
    }
    
}
