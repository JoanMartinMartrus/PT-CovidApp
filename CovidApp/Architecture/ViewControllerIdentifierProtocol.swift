//
//  ViiewControllerIdentifierProtocol.swift
//  Selector
//
//  Created by Borja Saez de Guinoa Vilaplana on 10/11/2020.
//  Copyright © 2020 V2M. All rights reserved.
//

import UIKit

protocol StoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
}

extension StoryboardIdentifiable where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}
