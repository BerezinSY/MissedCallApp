//
//  Configurator.swift
//  MissedCallApp
//
//  Created by Stanislav BEREZIN on 20.03.2021.
//

import UIKit

class Builder {
    
    typealias vc = UIViewController
    
    private init() {}
    
    static func buildClientCollectionVC() -> vc {
        let network = NetworkAPI()
        let viewModel = ClientCollectionViewModel(api: network)
        let vc = ClientCollectionViewController(viewModel: viewModel)
        let navigationVC = UINavigationController(rootViewController: vc)
        navigationVC.navigationBar.shadowImage = UIImage()
        navigationVC.navigationBar.barTintColor = .white
        return navigationVC
    }
    
    static func buildClientDetailVC(viewModel: ClientDetailViewModelType) -> vc {
        let vc = ClientDetailViewController(viewModel: viewModel)
        let navigationVC = UINavigationController(rootViewController: vc)
        navigationVC.navigationBar.shadowImage = UIImage()
        navigationVC.navigationBar.barTintColor = .white
        return navigationVC
    }
}
