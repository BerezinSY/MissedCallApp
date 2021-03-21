//
//  MissedContactCollectionView.swift
//  MissedCallApp
//
//  Created by Stanislav BEREZIN on 20.03.2021.
//

import UIKit

class ClientCollection: UICollectionView {
    
    init() {
        let layout = UICollectionViewFlowLayout()
        super.init(frame: .zero, collectionViewLayout: layout)
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
        register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        register(ClientCell.self, forCellWithReuseIdentifier: ClientCell.id)
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
