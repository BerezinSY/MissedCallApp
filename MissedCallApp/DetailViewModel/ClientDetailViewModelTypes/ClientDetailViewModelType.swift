//
//  ClientDetailViewModelType.swift
//  MissedCallApp
//
//  Created by Stanislav BEREZIN on 21.03.2021.
//

import Foundation

protocol ClientDetailViewModelType: class {
    var clientName: String? { get }
    var clientAddress: String? { get }
    var duration: String? { get }
    var clientLabel: String? { get }
    var number: String? { get }
}
