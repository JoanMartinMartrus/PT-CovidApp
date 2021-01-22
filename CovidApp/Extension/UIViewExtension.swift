//
//  UIViewExtension.swift
//  CovidApp
//
//  Created by Joan Martin Martrus on 22/01/2021.
//

import UIKit

extension UIView {
    func roundAndShadowView() {
        self.layer.cornerRadius = 5
        self.layer.shadowRadius = 3
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = .zero
        self.layer.shadowOpacity = 0.3
    }
}
