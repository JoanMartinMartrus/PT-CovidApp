//
//  SearchCountryRouter.swift
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

@objc protocol SearchCountryRoutingLogic
{
  //func navigateToAnotherScreen(withParameter: model)
}

class SearchCountryRouter: NSObject, SearchCountryRoutingLogic
{
  weak var viewController: SearchCountryViewController?
  
  // MARK: Routing
      
//    func navigateToExampleViewController(withParameters:Model) {
//        let vc = ExampleViewController()
//        vc.model = model
//        viewController?.show(vc, sender: nil)
//    }
}