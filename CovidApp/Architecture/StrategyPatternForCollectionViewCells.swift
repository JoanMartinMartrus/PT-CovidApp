//
//  StrategyPatternForCollectionViewCells.swift
//  Selector
//
//  Created by Joan Martin Martrus on 02/12/2020.
//  Copyright © 2020 V2M. All rights reserved.
//

import UIKit

protocol GetCollectionIdentifierProtocol {
    static func getCollectionIdentifier() -> String
}

extension GetCollectionIdentifierProtocol where Self: UICollectionViewCell {
    static func getCollectionIdentifier() -> String {
        return String(describing: self)
    }
}

internal protocol CollectionDrawerProtocol {

    
    func dequeueCollectionCell(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell

    
    func drawCollectionCell(_ collectionView: UICollectionViewCell, withItem item: Any)
}

internal protocol CollectionDrawerItemProtocol {

    
    var collectionDrawer: CollectionDrawerProtocol { get }
}
