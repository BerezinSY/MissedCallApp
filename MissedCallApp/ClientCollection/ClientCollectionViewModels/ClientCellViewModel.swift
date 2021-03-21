//
//  ContactCellViewModel.swift
//  MissedCallApp
//
//  Created by Stanislav BEREZIN on 20.03.2021.
//

import Foundation

class ClientCellViewModel: ClientCellViewModelType {
    
    var clientName: String? {
        request.client.name
    }
    
    var clientAddress: String? {
        var value = request.client.address
        value.insert(" ", at: value.index(value.startIndex, offsetBy: 2))
        value.insert(" ", at: value.index(value.startIndex, offsetBy: 6))
        value.insert("-", at: value.index(value.startIndex, offsetBy: 10))
        return value
    }
    
    var duration: String? {
        var value = request.duration
        value.trim(before: ":")
        return value
    }
    
    var created: String? {
        var value = request.created
        value.trim(before: "T")
        value.trim(after: ":")
        return value
    }
    
    private let request: Request
    
    init(request: Request) {
        self.request = request
    }
}
