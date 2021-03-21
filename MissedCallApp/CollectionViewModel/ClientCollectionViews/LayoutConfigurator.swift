//
//  LayoutConfigurator.swift
//  MissedCallApp
//
//  Created by Stanislav BEREZIN on 20.03.2021.
//

import UIKit

class LayoutConfigurator {
    
    private let collectionView: UICollectionView
    
    init(_ collectionView: UICollectionView) {
        self.collectionView = collectionView
    }
    
    func setOneItemPerRow() -> CGSize {
        setupLayout(itemPerRow: 1)
    }
    
    private func setupLayout(itemPerRow: CGFloat) -> CGSize {
        let paddingWidth = 20 * (itemPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = availableWidth / itemPerRow
        return CGSize(width: widthPerItem, height: 90)
    }
}
