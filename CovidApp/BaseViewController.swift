//
//  BaseViewController.swift
//  CovidApp
//
//  Created by Joan Martin Martrus on 21/01/2021.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Properties
    
    var currentSpinner: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func showErrorAlert(error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let accept = UIAlertAction(title: "Accept", style: .default, handler: nil)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel , handler: nil)
        alert.addAction(accept)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let activityIndicator = UIActivityIndicatorView.init(style: UIActivityIndicatorView.Style.large)
        activityIndicator.startAnimating()
        activityIndicator.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(activityIndicator)
            onView.addSubview(spinnerView)
        }
        currentSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            self.currentSpinner?.removeFromSuperview()
            self.currentSpinner = nil
        }
    }

}
