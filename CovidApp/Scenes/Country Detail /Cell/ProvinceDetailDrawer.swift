//
//   ProvinceDetailDrawer.swift
//   CovidApp
//
//   Creado por Joan Martin Martrus el 23/01/2021.
//   Copyright (c) 2021 ___ORGANIZATIONNAME___. Todos los derechos reservados.

import UIKit

internal final class ProvinceDetailDrawer: CollectionDrawerProtocol {
    
    func dequeueCollectionCell(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.register(UINib(nibName: ProvinceDetailCell.getCollectionIdentifier(),
            bundle: nil),
                                forCellWithReuseIdentifier: ProvinceDetailCell.getCollectionIdentifier())
        
        return collectionView.dequeueReusableCell(withReuseIdentifier: ProvinceDetailCell.getCollectionIdentifier(),
            for: indexPath)
    }
    
    func drawCollectionCell(_ collectionView: UICollectionViewCell, withItem item: Any) {
        guard let cell = collectionView as? ProvinceDetailCell, let cellVM = item as? ProvinceDetailViewModel
        else {
            return
        }
        cell.setProvinceNameLabel(provinceName: cellVM.provinceName)
        cell.drawBarChart(confirmed: cellVM.confirmed,
                          recovered: cellVM.recovered,
                          deaths: cellVM.deaths,
                          active: cellVM.active)
    }
}
