//
//  MissedContactSheetViewController.swift
//  MissedCallApp
//
//  Created by Stanislav BEREZIN on 20.03.2021.
//

import UIKit

class ClientCollectionViewController: UIViewController {
    
    private var viewModel: ClientCollectionViewModelType
    
    init(viewModel: ClientCollectionViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let collectionView = ClientCollection()
    private lazy var layoutConfigurator = LayoutConfigurator(collectionView)
    
    override func loadView() {
        view = collectionView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Missed calls"
        collectionView.dataSource = self
        collectionView.delegate = self
        viewModel.getData()
        viewModel.completionReload = reloadData
    }
    
    private func reloadData() {
        collectionView.reloadData()
    }
}

extension ClientCollectionViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItemsInSection
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ClientCell.id,
                for: indexPath) as? ClientCell else {
            return UICollectionViewCell()
        }
        
        let clientCellViewModel = viewModel.cellViewModel(for: indexPath)
        cell.clientCellViewModel = clientCellViewModel
        return cell
    }
}

extension ClientCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        layoutConfigurator.setOneItemPerRow()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let client = viewModel.client(for: indexPath)
        present(Builder.buildClientDetailVC(viewModel: client), animated: true)
    }
}
