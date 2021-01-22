//
//  BaseViewController.swift
//  CovidApp
//
//  Created by Joan Martin Martrus on 21/01/2021.
//

import UIKit

class BaseViewController: UIViewController {

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

}
