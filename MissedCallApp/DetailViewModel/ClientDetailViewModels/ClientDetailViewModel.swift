//
//  ClientDetailViewModel.swift
//  MissedCallApp
//
//  Created by Stanislav BEREZIN on 21.03.2021.
//

import Foundation

class ClientDetailViewModel: ClientDetailViewModelType {
    
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
    
    var clientLabel: String? {
        request.businessNumber.label
    }
    
    var number: String? {
        var value = request.businessNumber.number
        value.insert(" ", at: value.index(value.startIndex, offsetBy: 2))
        value.insert(" ", at: value.index(value.startIndex, offsetBy: 6))
        value.insert("-", at: value.index(value.startIndex, offsetBy: 10))
        return value
    }
    
    private let request: Request
    
    init(request: Request) {
        self.request = request
    }
}
