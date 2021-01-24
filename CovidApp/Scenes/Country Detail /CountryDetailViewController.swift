//
//  CountryDetailViewController.swift
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

protocol CountryDetailDisplayLogic: class
{
    func showData(cellsModels: [CollectionDrawerItemProtocol])
    func showError(error: Error)
}

class CountryDetailViewController: BaseViewController, CountryDetailDisplayLogic
{

    var interactor: CountryDetailBusinessLogic?
    var router: (NSObjectProtocol & CountryDetailRoutingLogic)?
    
    // MARK: IBoutlets
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var countryNameLabel: UILabel!
    
    // MARK: Properties
    
    var countryName: String?
    var cellsModels: [CollectionDrawerItemProtocol] = []
    
    // MARK: Acttions
    
    @IBAction func datePickerEditingDidEnd(_ sender: Any) {
        let stringDate = datePicker.date.toString(withFormatter: nil)
        self.reloadData(withDate: stringDate)
    }

    
    private func reloadData(withDate dateString: String) {
        self.showSpinner(onView: self.view)
        interactor?.getCountryInfo(countryName: self.countryName ?? "", date: dateString)
    }
    
    
    // MARK: CountryDetailDisplayLogic protocol implementation
    
    func showData(cellsModels: [CollectionDrawerItemProtocol]) {
        self.removeSpinner()
        self.cellsModels = cellsModels
        collectionView.reloadData()
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
        let interactor = CountryDetailInteractor()
        let presenter = CountryDetailPresenter()
        let router = CountryDetailRouter()
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
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.countryNameLabel.text = self.countryName
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        beginLoadInfo()
    }
    
    private func beginLoadInfo() {
        self.showSpinner(onView: self.view)
        if let countryName = self.countryName {
            interactor?.getCountryInfo(countryName: countryName, date: datePicker.date.toString(withFormatter: nil))
        }
    }
}

extension CountryDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cellsModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellModel = cellsModels[indexPath.row]
        let drawer = cellModel.collectionDrawer
        let cell = drawer.dequeueCollectionCell(collectionView, indexPath: indexPath)
        drawer.drawCollectionCell(cell, withItem: cellModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.frame.size.width
        return CGSize(width: collectionViewWidth/2.0, height: (3.0*collectionViewWidth/4.0))
    }
    
}
