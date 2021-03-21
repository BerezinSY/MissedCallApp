//
//  ClientCollectionViewModelType.swift
//  MissedCallApp
//
//  Created by Stanislav BEREZIN on 21.03.2021.
//

import Foundation

protocol ClientCollectionViewModelType {
    var numberOfItemsInSection: Int { get }
    var completionReload: () -> Void { get set }
    func getData() -> Void
    func cellViewModel(for indexPath: IndexPath) -> ClientCellViewModelType
    func client(for indexPath: IndexPath) -> ClientDetailViewModelType
}
