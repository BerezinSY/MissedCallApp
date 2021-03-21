//
//  ViewController.swift
//  MissedCallApp
//
//  Created by Stanislav BEREZIN on 20.03.2021.
//

import UIKit

class ClientDetailViewController: UIViewController {
    
    private let customView = ClientDetailView()
    
    private let viewModel: ClientDetailViewModelType
    
    init(viewModel: ClientDetailViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Missed call"
        customView.viewModel = viewModel
    }
}
