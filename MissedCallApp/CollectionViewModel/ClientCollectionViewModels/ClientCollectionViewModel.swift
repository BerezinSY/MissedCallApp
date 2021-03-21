//
//  ContactCollectionViewModel.swift
//  MissedCallApp
//
//  Created by Stanislav BEREZIN on 20.03.2021.
//

import Foundation

class ClientCollectionViewModel: ClientCollectionViewModelType {
    
    var numberOfItemsInSection: Int {
        sortedRequests.count
    }
    
    var completionReload: () -> Void = {}
    
    private var requests: [Request] = []
    
    private var sortedRequests: [Request] {
        requests.sorted { $0.created > $1.created }
    }
    
    private let api: Networking
    
    init(api: Networking) {
        self.api = api
    }
    
    func cellViewModel(for indexPath: IndexPath) -> ClientCellViewModelType {
        let request = sortedRequests[indexPath.item]
        return ClientCellViewModel(request: request)
        
    }
    
    func client(for indexPath: IndexPath) -> ClientDetailViewModelType {
        let request = sortedRequests[indexPath.item]
        return ClientDetailViewModel(request: request)
    }
    
    func getData() {
        api.getData { [unowned self] (requests) in
            self.requests = requests
            completionReload()
        }
    }
}
